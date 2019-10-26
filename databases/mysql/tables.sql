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

CREATE TABLE orders(
    orderid INT AUTO_INCREMENT PRIMARY KEY,
    date VARCHAR(100) NOT NULL,
    totalprice DECIMAL NOT NULL,
    rating DECIMAL NOT NULL,
    clientid INT NOT NULL,
    CONSTRAINT fk_client
    FOREIGN KEY (clientid)
        REFERENCES users(userid),
    restaurantid INT NOT NULL
);

CREATE TABLE orderXproduct(
    orderxproductid INT AUTO_INCREMENT PRIMARY KEY,
    details VARCHAR(100) NOT NULL,
    orderid INT NOT NULL,
    CONSTRAINT fk_order
    FOREIGN KEY (orderid)
        REFERENCES orders(orderid),
    productid INT NOT NULL
);

INSERT INTO usertypes(typename)
    VALUES ('Client'),('Owner'),('Admin');

INSERT INTO users(firstname, lastname, email, username, password_digest, usertypeid) 
    VALUES ('Jaun', 'Poti', 'sup@bro.com', 'pojun', '$2a$12$G3Kypeg5tziitUEdrlUIPOqtanu8wffqCDCPE/uv39RYChQGsRvae', 1) , ('Riam', 'Totso', 'jk@ngga.com', 'ritot', '$2a$12$D47xrhvd9x9zpcX/YnS/oemoscY..gwhpUqLzRdZCJ7573ZLE2FVq', 2);

INSERT INTO orders(date, totalprice, rating, clientid, restaurantid) 
   VALUES ('19-10-2019', 5000.00, 9.5, 1, 1);

INSERT INTO orderXproduct(details, orderid, productid)
    VALUES ('Gluten Free', 1, 1);
