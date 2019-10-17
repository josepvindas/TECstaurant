package order_service

import (
	context "context"
	"fmt"
	"math/rand"
) // THIS CODE IS A STARTING POINT ONLY. IT WILL NOT BE UPDATED WITH SCHEMA CHANGES.

type Resolver struct {
	orders []*Order
}

func (r *Resolver) Mutation() MutationResolver {
	return &mutationResolver{r}
}
func (r *Resolver) Query() QueryResolver {
	return &queryResolver{r}
}

type mutationResolver struct{ *Resolver }

func (r *mutationResolver) CreateOrder(ctx context.Context, input NewOrder) (*Order, error) {
	order := &Order{
		ID:         fmt.Sprintf("O%d", rand.Int()),
		Date:       input.Date,
		Rating:     *input.Rating,
		TotalPrice: input.TotalPrice,
	}
	r.orders = append(r.orders, order)
	return order, nil
}

type queryResolver struct{ *Resolver }

func (r *queryResolver) Orders(ctx context.Context) ([]*Order, error) {
	return r.orders, nil
}
