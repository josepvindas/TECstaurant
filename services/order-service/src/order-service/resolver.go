package order_service

import (
	context "context"
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

const (
	host     = "127.0.0.3"
	port     = 5432
	user     = "root"
	password = "123"
	dbname   = "services"
)

type Resolver struct {
	orders   []*Order
	products []*Product
}

func (r *Resolver) Mutation() MutationResolver {
	return &mutationResolver{r}
}
func (r *Resolver) Order() OrderResolver {
	return &orderResolver{r}
}
func (r *Resolver) Query() QueryResolver {
	return &queryResolver{r}
}

type mutationResolver struct{ *Resolver }

func (r *mutationResolver) CreateOrder(ctx context.Context, input NewOrder) (*Order, error) {

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	// Open doesn't open a connection. Validate DSN data:
	err = db.Ping()
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	// Prepare statement for inserting data
	orderInsert := "INSERT INTO orders(date, totalprice, rating, clientid, locationid) VALUES ( $1, $2, $3, $4, $5 ) RETURNING orderid"
	orderid := 0
	err = db.QueryRow(orderInsert, input.Date, input.TotalPrice, input.Rating, input.ClientID, input.LocationID).Scan(&orderid) // Insert order and get id
	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}
	defer db.Close()

	// Prepare statement for inserting data
	productInsert := "INSERT INTO orderXproduct(details, orderid, productid) VALUES ( $1, $2, $3 )" // $num = placeholder

	for _, element := range input.Products {
		_, err = db.Exec(productInsert, element.Details, orderid, element.ProductID) // Insert product
		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
	}
	defer db.Close()

	order := &Order{
		ID:         orderid,
		Date:       input.Date,
		Rating:     input.Rating,
		TotalPrice: input.TotalPrice,
		ClientId:   input.ClientID,
		LocationId: input.LocationID,
	}

	return order, nil
}

type orderResolver struct{ *Resolver }

func (r *orderResolver) Client(ctx context.Context, obj *Order) (*Client, error) {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	// Open doesn't open a connection. Validate DSN data:
	err = db.Ping()
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	sqlStatement := `SELECT username, email FROM users WHERE userid=$1;`
	var email string
	var username string
	// Replace 3 with an ID from your database or another random
	// value to test the no rows use case.
	row := db.QueryRow(sqlStatement, obj.ClientId)
	switch err := row.Scan(&username, &email); err {
	case sql.ErrNoRows:
		fmt.Println("No rows were returned!")
	case nil:

	default:
		panic(err)
	}

	return &Client{ID: obj.ClientId, Username: username, Email: email}, nil
}
func (r *orderResolver) Location(ctx context.Context, obj *Order) (*Location, error) {
	return &Location{ID: obj.LocationId}, nil
}
func (r *orderResolver) Products(ctx context.Context, obj *Order) ([]*Product, error) {
	var products []*Product
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	// Open doesn't open a connection. Validate DSN data:
	err = db.Ping()
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	rows, err := db.Query("SELECT orderxproductid, details, orderid, productid FROM orderXproduct WHERE orderid = $1", obj.ID)
	if err != nil {
		// handle this error better than this
		panic(err)
	}
	defer rows.Close()
	for rows.Next() {
		var orderxproductid int
		var details string
		var orderid int
		var productid int
		err = rows.Scan(&orderxproductid, &details, &orderid, &productid)
		if err != nil {
			// handle this error
			panic(err)
		}

		product := &Product{
			ID:        orderxproductid,
			Details:   details,
			orderID:   orderid,
			productID: productid,
		}
		products = append(products, product)
	}
	// get any error encountered during iteration
	err = rows.Err()
	if err != nil {
		panic(err)
	}

	return products, nil
}

type queryResolver struct{ *Resolver }

func (r *queryResolver) Orders(ctx context.Context) ([]*Order, error) {
	var orders []*Order
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	// Open doesn't open a connection. Validate DSN data:
	err = db.Ping()
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	rows, err := db.Query("SELECT orderid, date, totalprice, rating, clientid, locationid FROM orders")
	if err != nil {
		// handle this error better than this
		panic(err)
	}
	defer rows.Close()
	for rows.Next() {
		var orderid int
		var date string
		var totalprice float64
		var rating float64
		var clientid int
		var locationid int
		err = rows.Scan(&orderid, &date, &totalprice, &rating, &clientid, &locationid)
		if err != nil {
			// handle this error
			panic(err)
		}

		order := &Order{
			ID:         orderid,
			Date:       date,
			Rating:     rating,
			TotalPrice: totalprice,
			ClientId:   clientid,
			LocationId: locationid,
		}
		orders = append(orders, order)
	}
	// get any error encountered during iteration
	err = rows.Err()
	if err != nil {
		panic(err)
	}

	return orders, nil
}
