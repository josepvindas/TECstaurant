# TECstaurant

## About

Backend infrastructure application run in a [kubernetes](https://kubernetes.io/) cluster. The project components are as follows:

- [API Gateway](#API-Gateway)
- [Services](#Services)
- [Databases](#Databases)

The project is structured in accordance to this model:

![alt-text](https://i.imgur.com/mdNVM4V.png)

## Installation

### Pre-requisites

Since this solution is containerized, the only packages that need to be installed in the host machine before being able to run the project are the [docker](https://www.docker.com/) base image, and the [docker-compose](https://docs.docker.com/compose/) service.

### Running the solution

```bash
git clone https://github.com/josepvindas/TECstaurant.git
cd /Tecstaurant
docker-compose build
docker-compose up
```

That's it. All other packages will be installed in the containers themselves, so they don't need to be installed in the host.

> **Important:** all of the micro-services run inside a private internal network, this means that the host can only communicate with the [API Gateway](#API-Gateway), and all other services are not publicly accessible.

## API Gateway

## Databases

There are two database solutions that work together to store and manage the data of this solution:

- [Neo4j](#Neo4j)
- [MySQl](#MySQL)

### Neo4j

Simple graph database using [Neo4j](https://neo4j.com/). This database is tasked with storing all the locations of the TECstaurant,
as well as the products they sell, and the services they offer. Furthermore, the database also offers suggestions on what products to buy,
based on recent purchases and what other people who purchased the same product, have also acquired.

![alt-text](https://i.imgur.com/ix63Co4.png)

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

- [Locations](#Location)
- [Products](#Product)
- [Services](#Service)
- [Reservations](#Reservation)

#### Location

##### Add a new Location

Route: `/locations`
Request Type: `POST`

Request Body:

```json
{
  "id": id,
  "name": "name",
  "address": "address"
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully added.
- Error: There was a problem while adding the data.

##### Get all Locations

Route: `/locations`
Request Type: `GET`

Response:

```json
{
  "result":
  [
    {
      "Location":
      {
        "id"id,
        "name":"name",
        "address":"address"
      }
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
  "status": "status",
  "location":
  {
    "id"id,
    "name":"name",
    "address":"address"
  }
}
```

Status:

- Success: Data retrieved successfully.
- Error: Data doesn't exist.

##### Update a Location

Route: `/locations`
Request Type: `PUT`

Request Body:

```json
{
  "id": id,
  "data": {
    "name": "name",
    "address": "address"
  }
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully modified.
- Error: There was a problem while modifying the data.

##### Remove a location

Route: `/locations/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: Data deleted successfully.
- Error: Couldn't delete data.

#### Product

##### Add a new Product

Route: `/products`
Request Type: `POST`

Request Body:

```json
{
  "id": id,
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully added.
- Error: There was a problem while adding the data.

##### Get all Products

Route: `/products`
Request Type: `GET`

Response:

```json
{
  "result": [
    {
      "Product": {
        "id": id,
        "name": "name",
        "price": "price",
        "description": "description"
      }
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
  "status": "status",
  "product": {
    "id": id,
    "name": "name",
    "price": "price",
    "description": "description"
  }
}
```

Status:

- Success: Data retrieved successfully.
- Error: Data doesn't exist.

##### Update a Product

Route: `/products`
Request Type: `PUT`

Request Body:

```json
{
  "id": id,
  "data": {
    "name": "name",
    "price": "price",
    "description": "description"
  }
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully modified.
- Error: There was a problem while modifying the data.

##### Remove a Product

Route: `/products/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: Data deleted successfully.
- Error: Couldn't delete data.

#### Service

##### Add a new Service

Route: `/services`
Request Type: `POST`

Request Body:

```json
{
  "id": id,
  "name": "name",
  "hourly_fee": fee
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully added.
- Error: There was a problem while adding the data.

##### Get all Services

Route: `/services`
Request Type: `GET`

Response:

```json
{
  "result": [
    {
      "Service": {
        "id": id,
        "name": "name",
        "hourly_fee": fee
      }
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
  "status": "status",
  "service": {
    "id": id,
    "name": "name",
    "hourly_fee": fee
  }
}
```

Status:

- Success: Data retrieved successfully.
- Error: Data doesn't exist.

##### Update a Service

Route: `/services`
Request Type: `PUT`

Request Body:

```json
{
  "id": id,
  "data": {
    "name": "name",
    "hourly_fee": fee
  }
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully modified.
- Error: There was a problem while modifying the data.

##### Remove a Service

Route: `/services/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: Data deleted successfully.
- Error: Couldn't delete data.

#### Reservation

##### Add a new Reservation

Route: `/reservations`
Request Type: `POST`

Request Body:

```json
{
  "id": id,
  "client_id": id,
  "date": date,
  "start_time": time,
  "end_time": time,
  "cost": cost
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully added.
- Error: There was a problem while adding the data.

##### Get all Reservations

Route: `/reservations`
Request Type: `GET`

Response:

```json
{
  "result": [
    {
      "Reservation": {
        "id": id,
        "client_id": id,
        "date": date,
        "start_time": time,
        "end_time": time,
        "cost": cost
      }
    }
  ]
}
```

##### Get Reservation by id

Route: `/reservations/:id`
Request Type: `GET`

Response:

```json
{
  "status": "status",
  "reservation": {
    "id": id,
    "client_id": id,
    "date": date,
    "start_time": time,
    "end_time": time,
    "cost": cost
  }
}
```

Status:

- Success: Data retrieved successfully.
- Error: Data doesn't exist.

##### Update a Reservation

Route: `/reservations`
Request Type: `PUT`

Request Body:

```json
{
  "id": id,
  "data": {
    "client_id": id,
    "date": date,
    "start_time": time,
    "end_time": time,
    "cost": cost
  }
}
```

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: The data has been successfully modified.
- Error: There was a problem while modifying the data.

##### Remove a Reservation

Route: `/reservations/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status"
}
```

Status:

- Success: Data deleted successfully.
- Error: Couldn't delete data.

### order-service

### report-service

### user-service
