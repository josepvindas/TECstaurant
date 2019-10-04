# TECstaurant

## About

Backend infrastructure application run in a kubernetes cluster. The project components are as follows:

- [API Gateway](#API-Gateway)
- [Services](#Services)
- [Databases](#Databases)

![alt-text](https://i.imgur.com/mdNVM4V.png)

## Installation

## Configuration

## API Gateway

## Databases

### Neo4j DB

Simple graph database using [Neo4j](https://neo4j.com/). This database is tasked with storing all the locations of the TECstaurant,
as well as the products they sell, and the services they offer. Furthermore, the database also offers suggestions on what products to buy,
based on recent purchases and what other people who purchased the same product, have also acquired.

![alt-text](https://i.imgur.com/vyTFZyj.png)

### MySQL DB

Simple SQL database using [MySQL](https://www.mysql.com/).

## Services

### catalog-service

### order-service

### report-service

### user-service
