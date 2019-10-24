USE services;

CREATE TABLE usertypes(
    usertypeid INT AUTO_INCREMENT PRIMARY KEY,
    typename VARCHAR(100) NOT NULL
);

CREATE TABLE users(
    userid INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password_digest VARCHAR(100) NOT NULL,
    usertypeid INT NOT NULL,
    CONSTRAINT fk_usertype
    FOREIGN KEY (usertypeid)
        REFERENCES usertypes(usertypeid)
);

CREATE TABLE products(
    productid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    imageurl VARCHAR(100) NOT NULL,
    price DECIMAL NOT NULL
);

CREATE TABLE restaurants(
    restaurantid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    tags VARCHAR(100) NOT NULL,
    ownerid INT NOT NULL,
    CONSTRAINT fk_owner
    FOREIGN KEY (ownerid)
        REFERENCES users(userid)
);

CREATE TABLE locations(
    locationId INT AUTO_INCREMENT PRIMARY KEY,
    locationName VARCHAR(100) NOT NULL,
    locationAddress VARCHAR(100) NOT NULL,
    locationRating DECIMAL NOT NULL,
    restaurantId INT NOT NULL,
    CONSTRAINT fk_restaurant
    FOREIGN KEY (restaurantId)
        REFERENCES restaurants(restaurantId)
);

CREATE TABLE orders(
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    orderDate VARCHAR(100) NOT NULL,
    orderTotalPrice DECIMAL NOT NULL,
    orderRating DECIMAL NOT NULL,
    clientid INT NOT NULL,
    CONSTRAINT fk_client
    FOREIGN KEY (clientid)
        REFERENCES users(userid),
    locationId INT NOT NULL,
    CONSTRAINT fk_location
    FOREIGN KEY (locationId)
        REFERENCES locations(locationId)
);

CREATE TABLE orderXproduct(
    orderXproductId INT AUTO_INCREMENT PRIMARY KEY,
    details VARCHAR(100) NOT NULL,
    orderId INT NOT NULL,
    CONSTRAINT fk_order
    FOREIGN KEY (orderId)
        REFERENCES orders(orderId),
    productId INT NOT NULL,
    CONSTRAINT fk_product
    FOREIGN KEY (productId)
        REFERENCES products(productId)
);

INSERT INTO usertypes(typename)
    VALUES ('Client'),('Owner'),('Admin');

INSERT INTO users(firstname, lastname, email, username, password_digest, usertypeid) 
    VALUES ('Jaun', 'Poti', 'sup@bro.com', 'pojun', '$2a$12$G3Kypeg5tziitUEdrlUIPOqtanu8wffqCDCPE/uv39RYChQGsRvae', 1) , ('Riam', 'Totso', 'jk@ngga.com', 'ritot', '$2a$12$D47xrhvd9x9zpcX/YnS/oemoscY..gwhpUqLzRdZCJ7573ZLE2FVq', 2);

INSERT INTO products(productName, productDescription, productImageURL, productPrice)
    VALUES ('Brownie', 'Astroboy Gold', 'https://imgur.com/BBRPp7b', 5000.00);

INSERT INTO restaurants(name, description, tags, ownerid) 
    VALUES ('Spork', 'I&I', '#DownBabylon', 2);

INSERT INTO locations(locationName, locationAddress, locationRating, restaurantId) 
    VALUES ('By Sauron', 'Mordor',  9.5, 1);

INSERT INTO orders(orderDate, orderTotalPrice, orderRating, clientId, locationId) 
   VALUES ('19-10-2019', 5000.00, 9.5, 1, 1);

INSERT INTO orderXproduct(details, orderId, productId)
    VALUES ('Gluten Free', 1, 1);
