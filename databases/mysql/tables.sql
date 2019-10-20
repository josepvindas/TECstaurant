USE services;

CREATE TABLE clients(
    clientId INT AUTO_INCREMENT PRIMARY KEY,
    clientName VARCHAR(100) NOT NULL,
    clientLastName VARCHAR(100) NOT NULL,
    clientEmail VARCHAR(100) NOT NULL,
    clientUserName VARCHAR(100) NOT NULL,
    clientPassword VARCHAR(100) NOT NULL
);

CREATE TABLE owners(
    ownerId INT AUTO_INCREMENT PRIMARY KEY,
    ownerName VARCHAR(100) NOT NULL,
    ownerLastName VARCHAR(100) NOT NULL,
    ownerEmail VARCHAR(100) NOT NULL,
    ownerUserName VARCHAR(100) NOT NULL,
    ownerPassword VARCHAR(100) NOT NULL
);

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    productDescription VARCHAR(100) NOT NULL,
    productImageURL VARCHAR(100) NOT NULL,
    productPrice DECIMAL NOT NULL
);

CREATE TABLE restaurants(
    restaurantId INT AUTO_INCREMENT PRIMARY KEY,
    restaurantName VARCHAR(100) NOT NULL,
    restaurantDescription VARCHAR(100) NOT NULL,
    restaurantTags VARCHAR(100) NOT NULL,
    ownerId INT NOT NULL,
    CONSTRAINT fk_owner
    FOREIGN KEY (ownerId)
        REFERENCES owners(ownerId)
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
    clientId INT NOT NULL,
    CONSTRAINT fk_client
    FOREIGN KEY (clientId)
        REFERENCES clients(clientId),
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

INSERT INTO clients(clientName, clientLastName, clientEmail, clientUserName, clientPassword) 
    VALUES ('Jaun', 'Poti', 'sup@bro.com', 'pojun', '123');

INSERT INTO owners(ownerName, ownerLastName, ownerEmail, ownerUserName, ownerPassword) 
    VALUES ('Riam', 'Totso', 'jk@ngga.com', 'ritot', '456');

INSERT INTO products(productName, productDescription, productImageURL, productPrice)
    VALUES ('Brownie', 'Astroboy Gold', 'https://imgur.com/BBRPp7b', 5000.00);

INSERT INTO restaurants(restaurantName, restaurantDescription, restaurantTags, ownerId) 
    VALUES ('Spork', 'I&I', '#DownBabylon', 1);

INSERT INTO locations(locationName, locationAddress, locationRating, restaurantId) 
    VALUES ('By Sauron', 'Mordor',  9.5, 1);

INSERT INTO orders(orderDate, orderTotalPrice, orderRating, clientId, locationId) 
   VALUES ('19-10-2019', 5000.00, 9.5, 1, 1);

INSERT INTO orderXproduct(details, orderId, productId)
    VALUES ('Gluten Free', 1, 1);
