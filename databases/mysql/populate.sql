USE services;

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