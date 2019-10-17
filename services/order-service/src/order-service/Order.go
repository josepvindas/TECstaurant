package order_service

// Order : struct for server model
type Order struct {
	ID         string
	Date       string
	Rating     float64
	TotalPrice float64
}
