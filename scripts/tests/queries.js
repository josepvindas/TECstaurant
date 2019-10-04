const fetch = require('node-fetch');

module.exports.getProduct = id => {
  return fetch('http://localhost:4000/graphql', {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      query: '{product(id: ' + id + ') { name price type description }}'
    })
  })
    .then(response => response.json())
    .then(responseJson => {
      console.log(responseJson.data);
    })
    .catch(err => {
      console.log(err);
    });
};

module.exports.getProductsByType = type => {
  return fetch('http://localhost:4000/graphql', {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      query: '{products(type:' + type + ') { name price type description }}'
    })
  })
    .then(response => response.json())
    .then(responseJson => {
      console.log(responseJson);
    })
    .catch(err => {
      console.log(err);
    });
};

// GraphQL Queries
/*



query getProductsByType ($producttype: String!) {
  products(type: $producttype) {
    name
    price
    type
    description
  }
}

query getProducts ($productID1: Int!, $productID2: Int!) {
  product1: product(id: $productID1){
    ...productFields
  }
  product2: product(id: $productID2){
    ...productFields
  }
}

mutation updateProduct($id: Int!, $price: Int!) {
  updateProductPrice(id: $id, price: $price){
    ...productFields
  }
}

fragment productFields on Product {
  name
  price
  description
}
*/
