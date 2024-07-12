create database constrains_DB;
use constrains_DB;

create table productlines(
productLine VARCHAR(50) PRIMARY KEY,
textDescription VARCHAR(4000),
htmlDescription MEDIUMTEXT,
image MEDIUMBLOB
);

CREATE TABLE products (
    productCode VARCHAR(15) PRIMARY KEY,
    productName VARCHAR(70) NOT NULL,
    productLine VARCHAR(50) ,
    productScale VARCHAR(10) NOT NULL,
    productVendor VARCHAR(50) NOT NULL,
    productDescription TEXT NOT NULL,
    quantityInStock INT NOT NULL,
    buyPrice DECIMAL(10, 2) NOT NULL,
    MSRP DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

create table offices(
	officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    territory VARCHAR(50) NOT NULL
);

create table employees(
employeeNumber INT PRIMARY KEY,
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL,
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
officeCode VARCHAR(10),
reportsTo INT,
jobTitle VARCHAR(50) NOT NULL,
FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);

create table customers(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(15) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber INT,
creditLimit DECIMAL(10, 2),
FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

create table orders(
	orderNumber INT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE NOT NULL,
    shippedDate DATE,
    status VARCHAR(15) NOT NULL,
    comments TEXT,
    customerNumber INT,
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

create table orderdetails(
orderNumber INT,
productCode VARCHAR(15),
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber INT NOT NULL,
PRIMARY KEY (orderNumber, productCode),
FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber),
FOREIGN KEY (productCode) REFERENCES products(productCode)
);

create table payments(
CustomerNumber INT,
checkNumber VARCHAR(50),
paymentDate DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL
);

