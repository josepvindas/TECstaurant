const express = require('express');
const expressGraphQL = require('express-graphql');
const { buildSchema } = require('graphql');

// GraphQL Schema
var schema = buildSchema(`
  type Query {
    product(id: Int!): Product
    products(type: String): [Product]
  }
  type Mutation {
    updateProductPrice(id: Int!, price: Int!): Product
  }
  type Product {
    id: Int
    name: String
    price: Int
    type: String
    description: String
  }
`);

// Dummy Data for testing
var productData = [
  {
    id: 1,
    name: 'Beer',
    price: 12,
    type: 'drink',
    description: 'A 600ml bottle of local beer'
  },
  {
    id: 2,
    name: 'Wine',
    price: 20,
    type: 'drink',
    description: 'A 600ml bottle of red wine'
  },
  {
    id: 3,
    name: 'Burger',
    price: 12,
    type: 'meal',
    description: 'A delicious home-made burger'
  }
];

// get a product by id
getProduct = args => {
  var id = args.id;
  return productData.filter(product => {
    return product.id == id;
  })[0];
};

// get all products
getProducts = args => {
  if (args.type) {
    var type = args.type;
    return productData.filter(product => product.type === type);
  } else {
    return productData;
  }
};

// Update the price of a product
updateProductPrice = args => {
  var id = args.id;
  var price = args.price;

  productData.map(product => {
    if (product.id === id) {
      product.price = price;
      return product;
    }
  });
  return productData.filter(product => product.id === id)[0];
};

// Root Resolver
var root = {
  product: getProduct,
  products: getProducts,
  updateProductPrice: updateProductPrice
};

// Express server with GraphQL endpoint
const server = express();
server.post(
  '/graphql',
  expressGraphQL({
    schema: schema, // define the GraphQL schema to be used
    rootValue: root, // Attach root resolver
    graphiql: false // For testing
  })
);

// Start server
const PORT = 4000;
server.listen(PORT, () => console.log('Listening on port:' + PORT));
