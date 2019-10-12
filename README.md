# TECstaurant

## About

Backend infrastructure application run in a [kubernetes](https://kubernetes.io/) cluster. The project components are as follows:

- [API Gateway](#API-Gateway)
- [Services](#Services)
- [Databases](#Databases)

The project is structured in accordance to this model:

![alt-text](https://i.imgur.com/mdNVM4V.png)

## Usage

## API Gateway

## Databases

There are two database solutions that work together to store and manage the data of this solution:

- [Neo4j](#Neo4j)
- [MySQl](#MySQL)

### Neo4j

Simple graph database using [Neo4j](https://neo4j.com/). This database is tasked with storing all the locations of the TECstaurant,
as well as the products they sell, and the services they offer. Furthermore, the database also offers suggestions on what products to buy,
based on recent purchases and what other people who purchased the same product, have also acquired.

![alt-text](https://i.imgur.com/n6HRYQA.png)

### MySQL

Simple SQL database using [MySQL](https://www.mysql.com/).

![alt-text](https://i.imgur.com/vyTFZyj.png)

## Services

Collection of micro-services that compose the backend logic and functionality.

- [catalog-service](#catalog-service)
- [order-service](#order-service)
- [report-service](#report-service)
- [user-service](#user-service)

### catalog-service

It is a micro-service written in [Node.js](https://nodejs.org/en/). This micro-service manages the cataloging aspects of TECstaurant. It works in conjunction with the [Neo4j Database](#Neo4j) to provide the CRUD functions for all the different data types that compose the catalog.

The docker image for this service is available [here](https://hub.docker.com/r/tecstaurant/catalog-service).

- [Locations](#Location)
- [Products](#Product)
- [Services](#Service)

#### Location

##### Add a new Location

Route: `/locations`
Request Type: `POST`

Request Body:

```json
{
  "id": "id",
  "name": "name",
  "address": "address"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully added.
- Failed: There was a problem while adding the data.

##### Get all Locations

Route: `/locations`
Request Type: `GET`

Response:

```json
{
  "locations": [
    {
      "id": "id",
      "name": "name",
      "address": "address"
    }
  ]
}
```

##### Get Location by id

Route: `/locations/:id`
Request Type: `GET`

Response:

```json
{
  "id": "id",
  "name": "name",
  "address": "address"
}
```

Status:

- Success: Data retrieved successfully.
- Failed: Data doesn't exist.

##### Get Location's menu

Route: `/locations/:id/menu`
Request Type: `GET`

Response:

```json
{
  "menu": [
    {
      "id": "id",
      "name": "name",
      "price": "price",
      "description": "description"
    }
  ]
}
```

##### Get Location's services

Route: `/locations/:id/services`
Request Type: `GET`

Response:

```json
{
  "services": [
    {
      "id": "id",
      "name": "name",
      "hourly_fee": "hourly_fee",
      "description": "description"
    }
  ]
}
```

##### Update a Location

Route: `/locations/:id`
Request Type: `PUT`

Request Body:

```json
{
  "name": "name",
  "address": "address"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully modified.
- Failed: There was a problem while modifying the data.

##### Remove a location

Route: `/locations/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: Data deleted successfully.
- Failed: Couldn't delete data.

#### Product

##### Add a new Product

Route: `/products`
Request Type: `POST`

Request Body:

```json
{
  "id": "id",
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully added.
- Failed: There was a problem while adding the data.

##### Get all Products

Route: `/products`
Request Type: `GET`

Response:

```json
{
  "products": [
    {
      "id": "id",
      "name": "name",
      "price": "price",
      "description": "description"
    }
  ]
}
```

##### Get Product by id

Route: `/products/:id`
Request Type: `GET`

Response:

```json
{
  "id": "id",
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Status:

- Success: Data retrieved successfully.
- Failed: Data doesn't exist.

##### Update a Product

Route: `/products/:id`
Request Type: `PUT`

Request Body:

```json
{
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully modified.
- Failed: There was a problem while modifying the data.

##### Remove a Product

Route: `/products/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: Data deleted successfully.
- Failed: Couldn't delete data.

#### Service

##### Add a new Service

Route: `/services`
Request Type: `POST`

Request Body:

```json
{
  "id": "id",
  "name": "name",
  "hourly_fee": "hourly_fee"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully added.
- Failed: There was a problem while adding the data.

##### Get all Services

Route: `/services`
Request Type: `GET`

Response:

```json
{
  "services": [
    {
      "id": "id",
      "name": "name",
      "hourly_fee": "hourly_fee"
    }
  ]
}
```

##### Get Service by id

Route: `/services/:id`
Request Type: `GET`

Response:

```json
{
  "id": "id",
  "name": "name",
  "hourly_fee": "hourly_fee"
}
```

##### Update a Service

Route: `/services/:id`
Request Type: `PUT`

Request Body:

```json
{
  "name": "name",
  "hourly_fee": "hourly_fee",
  "description": "description"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully modified.
- Failed: There was a problem while modifying the data.

##### Remove a Service

Route: `/services/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: Data deleted successfully.
- Failed: Couldn't delete data.

### order-service

### report-service

### user-service
