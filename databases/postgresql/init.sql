GRANT ALL PRIVILEGES ON DATABASE services TO root;

CREATE TABLE IF NOT EXISTS usertypes (
    usertypeid SERIAL PRIMARY KEY,
    typename varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    userid SERIAL PRIMARY KEY,
    firstname varchar(100) NOT NULL,
    lastname varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    username varchar(100) NOT NULL,
    password_digest varchar(100) NOT NULL,
    usertypeid integer NOT NULL REFERENCES usertypes
);

CREATE TABLE IF NOT EXISTS orders (
    orderid SERIAL PRIMARY KEY,
    date varchar(100) NOT NULL,
    totalprice real NOT NULL,
    rating real NOT NULL,
    clientid integer NOT NULL REFERENCES users,
    locationid integer NOT NULL
);

CREATE TABLE IF NOT EXISTS orderXproduct (
    orderxproductid SERIAL PRIMARY KEY,
    details varchar(100) NOT NULL,
    orderid integer NOT NULL REFERENCES orders,
    productid integer NOT NULL
);

INSERT INTO usertypes(typename)
    VALUES ('Client'),('Owner'),('Admin');

INSERT INTO users(firstname, lastname, email, username, password_digest, usertypeid) 
    VALUES ('Jaun', 'Poti', 'sup@bro.com', 'pojun', '$2a$12$G3Kypeg5tziitUEdrlUIPOqtanu8wffqCDCPE/uv39RYChQGsRvae', 1) , ('Riam', 'Totso', 'jk@ngga.com', 'ritot', '$2a$12$D47xrhvd9x9zpcX/YnS/oemoscY..gwhpUqLzRdZCJ7573ZLE2FVq', 2);

INSERT INTO orders(date, totalprice, rating, clientid, locationid) 
   VALUES ('19-10-2019', 5000.00, 9.5, 1, 1);

INSERT INTO orderXproduct(details, orderid, productid)
    VALUES ('Gluten Free', 1, 1);
