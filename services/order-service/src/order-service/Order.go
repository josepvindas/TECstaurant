package order_service

// Order : struct for server model
type Order struct {
	ID         int
	Date       string
	Rating     float64
	TotalPrice float64
	ClientId   int
	LocationId int
}
