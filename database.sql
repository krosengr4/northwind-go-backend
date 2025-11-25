-- ---------------------------------------------------------------------- --
-- Target DBMS:           MySQL                                           -- -- Project name:          Northwind                                       -- -- ---------------------------------------------------------------------- --
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS order_details CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS shippers CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;

-- ---------------------------------------------------------------------- --
-- Tables                                                                 -- -- ---------------------------------------------------------------------- --
-- ---------------------------------------------------------------------- --
-- Add table "categories"                                                 -- -- ---------------------------------------------------------------------- --

CREATE TABLE categories (
    category_id SERIAL,
    category_name VARCHAR(15) NOT NULL,
    description TEXT,
    CONSTRAINT pk_categories PRIMARY KEY (category_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "customers"                                                  -- -- ---------------------------------------------------------------------- --

CREATE TABLE customers (
    customer_id VARCHAR(5) NOT NULL,
    company_name VARCHAR(40) NOT NULL,
    contact_name VARCHAR(30),
    address VARCHAR(60),
    city VARCHAR(15),
    region VARCHAR(15),
    postal_code VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(24),
    CONSTRAINT pk_customers PRIMARY KEY (customer_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "employees"                                                  -- -- ---------------------------------------------------------------------- --

CREATE TABLE employees (
    employee_id SERIAL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    title VARCHAR(30),
    birth_date TIMESTAMP,
    hire_date TIMESTAMP,
    address VARCHAR(60),
    state VARCHAR(60),
    city VARCHAR(15),
    postal_code VARCHAR(10),
    country VARCHAR(15),
    reports_to INTEGER,
     salary DOUBLE PRECISION,
    CONSTRAINT pk_employees PRIMARY KEY (employee_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "order_details"                                              -- -- ---------------------------------------------------------------------- --

CREATE TABLE order_details (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    unit_price DECIMAL(10,4) NOT NULL DEFAULT 0,
    quantity SMALLINT NOT NULL DEFAULT 1,
    CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "orders"                                                     -- -- ---------------------------------------------------------------------- --

CREATE TABLE orders (
    order_id SERIAL,
    customer_id VARCHAR(5),
    employee_id INTEGER,
    order_date TIMESTAMP,
    required_date TIMESTAMP,
    shipped_date TIMESTAMP,
    ship_via INTEGER,
    freight DECIMAL(10,4) DEFAULT 0,
    ship_name VARCHAR(40),
    ship_address VARCHAR(60),
    region VARCHAR(60),
    ship_city VARCHAR(15),
    ship_postal_code VARCHAR(10),
    ship_country VARCHAR(15),
    CONSTRAINT pk_orders PRIMARY KEY (order_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "products"                                                   -- -- ---------------------------------------------------------------------- --

CREATE TABLE products (
    product_id SERIAL,
    product_name VARCHAR(40) NOT NULL,
    supplier_id INTEGER,
    category_id INTEGER,
    quantity_per_unit VARCHAR(20),
    unit_price DECIMAL(10,4) DEFAULT 0,
    units_in_stock SMALLINT DEFAULT 0,
    units_on_order SMALLINT DEFAULT 0,
    reorder_level SMALLINT DEFAULT 0,
    discontinued BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_products PRIMARY KEY (product_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "shippers"                                                   -- -- ---------------------------------------------------------------------- --

CREATE TABLE shippers (
    shipper_id SERIAL,
    company_name VARCHAR(40) NOT NULL,
    phone VARCHAR(24),
    CONSTRAINT pk_shippers PRIMARY KEY (shipper_id)
);

-- ---------------------------------------------------------------------- --
-- Add table "suppliers"                                                  -- -- ---------------------------------------------------------------------- --

CREATE TABLE suppliers (
    supplier_id SERIAL,
    company_name VARCHAR(40) NOT NULL,
    contact_name VARCHAR(30),
    contact_title VARCHAR(30),
    address VARCHAR(60),
    city VARCHAR(15),
    region VARCHAR(15),
    postal_code VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(24),
    fax VARCHAR(24),
    CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id)
);

-- ---------------------------------------------------------------------- --
-- Add info into "categories"                                             -- -- ---------------------------------------------------------------------- --

INSERT INTO categories VALUES(DEFAULT,'Beverages','Soft drinks, coffees, teas, beers, and ales');
INSERT INTO categories VALUES(DEFAULT,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO categories VALUES(DEFAULT,'Confections','Desserts, candies, and sweet breads');
INSERT INTO categories VALUES(DEFAULT,'Dairy products','Cheeses');
INSERT INTO categories VALUES(DEFAULT,'Grains/Cereals','Breads, crackers, pasta, and cereal');
INSERT INTO categories VALUES(DEFAULT,'Meat/Poultry','Prepared meats');
INSERT INTO categories VALUES(DEFAULT,'Produce','Dried fruit and bean curd');
INSERT INTO categories VALUES(DEFAULT, 'Seafood','Seaweed and fish');

-- ---------------------------------------------------------------------- --
-- Add info into "customers"                                              -- -- ---------------------------------------------------------------------- --

INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '05021', 'Mexico', '(5) 555-4729');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('ANTON', 'Antonio Moreno Taquera', 'Antonio Moreno', 'Mataderos  2312', 'Mxico D.F.', NULL, '05023', 'Mexico', '(5) 555-3932');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('AROUT', 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BERGS', 'Berglunds snabbkp', 'Christina Berglund', 'Berguvsvgen  8', 'Lule', NULL, 'S-958 22', 'Sweden', '0921-12 34 65');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BLONP', 'Blondesddsl pre et fils', 'Frdrique Citeaux', '24, place Klber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BOLID', 'Blido Comidas preparadas', 'Martn Sommer', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BONAP', 'Bon app''', 'Laurence Lebihan', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Sierras de Granada 9993', 'Mxico D.F.', NULL, '05022', 'Mexico', '(5) 555-3392');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('COMMI', 'Comrcio Mineiro', 'Pedro Afonso', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('DUMON', 'Du monde entier', 'Janine Labrune', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('EASTC', 'Eastern Connection', 'Ann Devon', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FOLIG', 'Folies gourmandes', 'Martine Ranc', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FOLKO', 'Folk och f HB', 'Maria Larsson', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FRANK', 'Frankenversand', 'Peter Franken', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany', '089-0877310');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FRANR', 'France restauration', 'Carine Schmitt', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('GALED', 'Galera del gastrnomo', 'Eduardo Saavedra', 'Rambla de Catalua, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('GODOS', 'Godos Cocina Tpica', 'Jos Pedro Freyre', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('GOURL', 'Gourmet Lanchonetes', 'Andr Fonseca', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('GREAL', 'Great Lakes Food Market', 'Howard Snyder', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', '5 Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('HILAA', 'HILARION-Abastos', 'Carlos Hernndez', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela', '(5) 555-1340');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'city Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('ISLAT', 'Island Trading', 'Helen Bennett', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('KOENE', 'Kniglich Essen', 'Philip Cramer', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('LACOR', 'La corne d''abondance', 'Daniel Tonini', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('LAMAI', 'La maison d''Asie', 'Annette Roulet', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('LAZYK', 'Lazy K Kountry Store', 'John Steel', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984');
INSERT INTO customers (customer_id, company_name, contact_name, address, city, region, postal_code, country, phone)
VALUES('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938');
-- ---------------------------------------------------------------------- --
-- Add info into "employees"                                              -- -- ---------------------------------------------------------------------- --

INSERT INTO employees VALUES(default,'Davolio','Nancy','Sales Representative','1948-12-08','1992-05-01','507 - 20th Ave. E.Apt. 2A','Seattle','WA','98122','USA',2
,'2954.55');
INSERT INTO employees VALUES(default,'Fuller','Andrew','Vice President, Sales','1952-02-19','1992-08-14','908 W. Capital Way','Tacoma','WA','98401','USA',NULL
,'2254.49');
INSERT INTO employees VALUES(default,'Leverling','Janet','Sales Representative','1963-08-30','1992-04-01','722 Moss Bay Blvd.','Kirkland','WA','98033','USA',2
,'3119.15');
INSERT INTO employees VALUES(default,'Peacock','Margaret','Sales Representative','1937-09-19','1993-05-03','4110 Old Redmond Rd.','Redmond','WA','98052','USA',2
,'1861.08');
INSERT INTO employees VALUES(default,'Buchanan','Steven','Sales Manager','1955-03-04','1993-10-17','14 Garrett Hill','London',NULL,'SW1 8JR','UK',2
,'1744.21');
INSERT INTO employees VALUES(default,'Suyama','Michael','Sales Representative','1963-07-02','1993-10-17','Coventry House
Miner Rd.','London',default,'EC2 7JR','UK',5
,'2004.07');
INSERT INTO employees VALUES(default,'King','Robert','Sales Representative','1960-05-29','1994-01-02','Edgeham Hollow
Winchester Way','London',default,'RG1 9SP','UK',5
,'1991.55');
INSERT INTO employees VALUES(default,'Callahan','Laura','Inside Sales Coordinator','1958-01-09','1994-03-05','4726 - 11th Ave. N.E.','Seattle','WA','98105','USA',2
,'2100.50');
INSERT INTO employees VALUES(default,'Dodsworth','Anne','Sales Representative','1966-01-27','1994-11-15','7 Houndstooth Rd.','London',NULL,'WG2 7LT','UK',5
,'2333.33');

-- ---------------------------------------------------------------------- --
-- Add info into "orders"                                                 -- -- ---------------------------------------------------------------------- --

INSERT INTO orders  Values ('10248','VINET',5,'1996-07-04 00:00:00.000','1996-08-01 00:00:00.000','1996-07-16 00:00:00.000',3,32.38,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO orders  Values ('10249','TOMSP',6,'1996-07-05 00:00:00.000','1996-08-16 00:00:00.000','1996-07-10 00:00:00.000',1,11.61,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO orders  Values ('10250','HANAR',4,'1996-07-08 00:00:00.000','1996-08-05 00:00:00.000','1996-07-12 00:00:00.000',2,65.83,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10251','VICTE',3,'1996-07-08 00:00:00.000','1996-08-05 00:00:00.000','1996-07-15 00:00:00.000',1,41.34,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO orders  Values ('10252','SUPRD',4,'1996-07-09 00:00:00.000','1996-08-06 00:00:00.000','1996-07-11 00:00:00.000',2,51.3,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO orders  Values ('10253','HANAR',3,'1996-07-10 00:00:00.000','1996-07-24 00:00:00.000','1996-07-16 00:00:00.000',2,58.17,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10254','CHOPS',5,'1996-07-11 00:00:00.000','1996-08-08 00:00:00.000','1996-07-23 00:00:00.000',2,22.98,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO orders  Values ('10255','RICSU',9,'1996-07-12 00:00:00.000','1996-08-09 00:00:00.000','1996-07-15 00:00:00.000',3,148.33,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO orders  Values ('10256','WELLI',3,'1996-07-15 00:00:00.000','1996-08-12 00:00:00.000','1996-07-17 00:00:00.000',2,13.97,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO orders  Values ('10257','HILAA',4,'1996-07-16 00:00:00.000','1996-08-13 00:00:00.000','1996-07-22 00:00:00.000',3,81.91,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10258','ERNSH',1,'1996-07-17 00:00:00.000','1996-08-14 00:00:00.000','1996-07-23 00:00:00.000',1,140.51,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10259','CENTC',4,'1996-07-18 00:00:00.000','1996-08-15 00:00:00.000','1996-07-25 00:00:00.000',3,3.25,'Centro comercial Moctezuma','Sierras de Granada 9993','Mxico D.F.',NULL,'5022','Mexico');
INSERT INTO orders  Values ('10260','OTTIK',4,'1996-07-19 00:00:00.000','1996-08-16 00:00:00.000','1996-07-29 00:00:00.000',1,55.09,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10261','QUEDE',4,'1996-07-19 00:00:00.000','1996-08-16 00:00:00.000','1996-07-30 00:00:00.000',2,3.05,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10262','RATTC',8,'1996-07-22 00:00:00.000','1996-08-19 00:00:00.000','1996-07-25 00:00:00.000',3,48.29,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10263','ERNSH',9,'1996-07-23 00:00:00.000','1996-08-20 00:00:00.000','1996-07-31 00:00:00.000',3,146.06,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10264','FOLKO',6,'1996-07-24 00:00:00.000','1996-08-21 00:00:00.000','1996-08-23 00:00:00.000',3,3.67,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10265','BLONP',2,'1996-07-25 00:00:00.000','1996-08-22 00:00:00.000','1996-08-12 00:00:00.000',1,55.28,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10266','WARTH',3,'1996-07-26 00:00:00.000','1996-09-06 00:00:00.000','1996-07-31 00:00:00.000',3,25.73,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10267','FRANK',4,'1996-07-29 00:00:00.000','1996-08-26 00:00:00.000','1996-08-06 00:00:00.000',1,208.58,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10268','GROSR',8,'1996-07-30 00:00:00.000','1996-08-27 00:00:00.000','1996-08-02 00:00:00.000',3,66.29,'GROSELLA-Restaurante','5 Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela');
INSERT INTO orders  Values ('10269','WHITC',5,'1996-07-31 00:00:00.000','1996-08-14 00:00:00.000','1996-08-09 00:00:00.000',1,4.56,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10270','WARTH',1,'1996-08-01 00:00:00.000','1996-08-29 00:00:00.000','1996-08-02 00:00:00.000',1,136.54,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10271','SPLIR',6,'1996-08-01 00:00:00.000','1996-08-29 00:00:00.000','1996-08-30 00:00:00.000',2,4.54,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10272','RATTC',6,'1996-08-02 00:00:00.000','1996-08-30 00:00:00.000','1996-08-06 00:00:00.000',2,98.03,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10273','QUICK',3,'1996-08-05 00:00:00.000','1996-09-02 00:00:00.000','1996-08-12 00:00:00.000',3,76.07,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10274','VINET',6,'1996-08-06 00:00:00.000','1996-09-03 00:00:00.000','1996-08-16 00:00:00.000',1,6.01,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO orders  Values ('10275','MAGAA',1,'1996-08-07 00:00:00.000','1996-09-04 00:00:00.000','1996-08-09 00:00:00.000',1,26.93,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10276','TORTU',8,'1996-08-08 00:00:00.000','1996-08-22 00:00:00.000','1996-08-14 00:00:00.000',3,13.84,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10277','MORGK',2,'1996-08-09 00:00:00.000','1996-09-06 00:00:00.000','1996-08-13 00:00:00.000',3,125.77,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO orders  Values ('10278','BERGS',8,'1996-08-12 00:00:00.000','1996-09-09 00:00:00.000','1996-08-16 00:00:00.000',2,92.69,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10279','LEHMS',8,'1996-08-13 00:00:00.000','1996-09-10 00:00:00.000','1996-08-16 00:00:00.000',2,25.83,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10280','BERGS',2,'1996-08-14 00:00:00.000','1996-09-11 00:00:00.000','1996-09-12 00:00:00.000',1,8.98,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10281','ROMEY',4,'1996-08-14 00:00:00.000','1996-08-28 00:00:00.000','1996-08-21 00:00:00.000',1,2.94,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO orders  Values ('10282','ROMEY',4,'1996-08-15 00:00:00.000','1996-09-12 00:00:00.000','1996-08-21 00:00:00.000',1,12.69,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO orders  Values ('10283','LILAS',3,'1996-08-16 00:00:00.000','1996-09-13 00:00:00.000','1996-08-23 00:00:00.000',3,84.81,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10284','LEHMS',4,'1996-08-19 00:00:00.000','1996-09-16 00:00:00.000','1996-08-27 00:00:00.000',1,76.56,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10285','QUICK',1,'1996-08-20 00:00:00.000','1996-09-17 00:00:00.000','1996-08-26 00:00:00.000',2,76.83,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10286','QUICK',8,'1996-08-21 00:00:00.000','1996-09-18 00:00:00.000','1996-08-30 00:00:00.000',3,229.24,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10287','RICAR',8,'1996-08-22 00:00:00.000','1996-09-19 00:00:00.000','1996-08-28 00:00:00.000',3,12.76,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10288','REGGC',4,'1996-08-23 00:00:00.000','1996-09-20 00:00:00.000','1996-09-03 00:00:00.000',1,7.45,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10289','BSBEV',7,'1996-08-26 00:00:00.000','1996-09-23 00:00:00.000','1996-08-28 00:00:00.000',3,22.77,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10290','COMMI',8,'1996-08-27 00:00:00.000','1996-09-24 00:00:00.000','1996-09-03 00:00:00.000',1,79.7,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO orders  Values ('10291','QUEDE',6,'1996-08-27 00:00:00.000','1996-09-24 00:00:00.000','1996-09-04 00:00:00.000',2,6.4,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10292','TRADH',1,'1996-08-28 00:00:00.000','1996-09-25 00:00:00.000','1996-09-02 00:00:00.000',2,1.35,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO orders  Values ('10293','TORTU',1,'1996-08-29 00:00:00.000','1996-09-26 00:00:00.000','1996-09-11 00:00:00.000',3,21.18,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10294','RATTC',4,'1996-08-30 00:00:00.000','1996-09-27 00:00:00.000','1996-09-05 00:00:00.000',2,147.26,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10295','VINET',2,'1996-09-02 00:00:00.000','1996-09-30 00:00:00.000','1996-09-10 00:00:00.000',2,1.15,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO orders  Values ('10296','LILAS',6,'1996-09-03 00:00:00.000','1996-10-01 00:00:00.000','1996-09-11 00:00:00.000',1,0.12,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10297','BLONP',5,'1996-09-04 00:00:00.000','1996-10-16 00:00:00.000','1996-09-10 00:00:00.000',2,5.74,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10298','HUNGO',6,'1996-09-05 00:00:00.000','1996-10-03 00:00:00.000','1996-09-11 00:00:00.000',2,168.22,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10299','RICAR',4,'1996-09-06 00:00:00.000','1996-10-04 00:00:00.000','1996-09-13 00:00:00.000',2,29.76,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10300','MAGAA',2,'1996-09-09 00:00:00.000','1996-10-07 00:00:00.000','1996-09-18 00:00:00.000',2,17.68,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10301','WANDK',8,'1996-09-09 00:00:00.000','1996-10-07 00:00:00.000','1996-09-17 00:00:00.000',2,45.08,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10302','SUPRD',4,'1996-09-10 00:00:00.000','1996-10-08 00:00:00.000','1996-10-09 00:00:00.000',2,6.27,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO orders  Values ('10303','GODOS',7,'1996-09-11 00:00:00.000','1996-10-09 00:00:00.000','1996-09-18 00:00:00.000',2,107.83,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO orders  Values ('10304','TORTU',1,'1996-09-12 00:00:00.000','1996-10-10 00:00:00.000','1996-09-17 00:00:00.000',2,63.79,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10305','OLDWO',8,'1996-09-13 00:00:00.000','1996-10-11 00:00:00.000','1996-10-09 00:00:00.000',3,257.62,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO orders  Values ('10306','ROMEY',1,'1996-09-16 00:00:00.000','1996-10-14 00:00:00.000','1996-09-23 00:00:00.000',3,7.56,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO orders  Values ('10307','LONEP',2,'1996-09-17 00:00:00.000','1996-10-15 00:00:00.000','1996-09-25 00:00:00.000',2,0.56,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO orders  Values ('10308','ANATR',7,'1996-09-18 00:00:00.000','1996-10-16 00:00:00.000','1996-09-24 00:00:00.000',3,1.61,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO orders  Values ('10309','HUNGO',3,'1996-09-19 00:00:00.000','1996-10-17 00:00:00.000','1996-10-23 00:00:00.000',1,47.3,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10310','THEBI',8,'1996-09-20 00:00:00.000','1996-10-18 00:00:00.000','1996-09-27 00:00:00.000',2,17.52,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO orders  Values ('10311','DUMON',1,'1996-09-20 00:00:00.000','1996-10-04 00:00:00.000','1996-09-26 00:00:00.000',3,24.69,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO orders  Values ('10312','WANDK',2,'1996-09-23 00:00:00.000','1996-10-21 00:00:00.000','1996-10-03 00:00:00.000',2,40.26,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10313','QUICK',2,'1996-09-24 00:00:00.000','1996-10-22 00:00:00.000','1996-10-04 00:00:00.000',2,1.96,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10314','RATTC',1,'1996-09-25 00:00:00.000','1996-10-23 00:00:00.000','1996-10-04 00:00:00.000',2,74.16,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10315','ISLAT',4,'1996-09-26 00:00:00.000','1996-10-24 00:00:00.000','1996-10-03 00:00:00.000',2,41.76,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10316','RATTC',1,'1996-09-27 00:00:00.000','1996-10-25 00:00:00.000','1996-10-08 00:00:00.000',3,150.15,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10317','LONEP',6,'1996-09-30 00:00:00.000','1996-10-28 00:00:00.000','1996-10-10 00:00:00.000',1,12.69,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO orders  Values ('10318','ISLAT',8,'1996-10-01 00:00:00.000','1996-10-29 00:00:00.000','1996-10-04 00:00:00.000',2,4.73,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10319','TORTU',7,'1996-10-02 00:00:00.000','1996-10-30 00:00:00.000','1996-10-11 00:00:00.000',3,64.5,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10320','WARTH',5,'1996-10-03 00:00:00.000','1996-10-17 00:00:00.000','1996-10-18 00:00:00.000',3,34.57,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10321','ISLAT',3,'1996-10-03 00:00:00.000','1996-10-31 00:00:00.000','1996-10-11 00:00:00.000',2,3.43,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10322','PERIC',7,'1996-10-04 00:00:00.000','1996-11-01 00:00:00.000','1996-10-23 00:00:00.000',3,0.4,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10323','KOENE',4,'1996-10-07 00:00:00.000','1996-11-04 00:00:00.000','1996-10-14 00:00:00.000',1,4.88,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10324','SAVEA',9,'1996-10-08 00:00:00.000','1996-11-05 00:00:00.000','1996-10-10 00:00:00.000',1,214.27,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10325','KOENE',1,'1996-10-09 00:00:00.000','1996-10-23 00:00:00.000','1996-10-14 00:00:00.000',3,64.86,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10326','BOLID',4,'1996-10-10 00:00:00.000','1996-11-07 00:00:00.000','1996-10-14 00:00:00.000',2,77.92,'Blido Comidas preparadas','C/ Araquil, 67','Madrid',NULL,'28023','Spain');
INSERT INTO orders  Values ('10327','FOLKO',2,'1996-10-11 00:00:00.000','1996-11-08 00:00:00.000','1996-10-14 00:00:00.000',1,63.36,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10328','FURIB',4,'1996-10-14 00:00:00.000','1996-11-11 00:00:00.000','1996-10-17 00:00:00.000',3,87.03,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10329','SPLIR',4,'1996-10-15 00:00:00.000','1996-11-26 00:00:00.000','1996-10-23 00:00:00.000',2,191.67,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10330','LILAS',3,'1996-10-16 00:00:00.000','1996-11-13 00:00:00.000','1996-10-28 00:00:00.000',1,12.75,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10331','BONAP',9,'1996-10-16 00:00:00.000','1996-11-27 00:00:00.000','1996-10-21 00:00:00.000',1,10.19,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10332','MEREP',3,'1996-10-17 00:00:00.000','1996-11-28 00:00:00.000','1996-10-21 00:00:00.000',2,52.84,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10333','WARTH',5,'1996-10-18 00:00:00.000','1996-11-15 00:00:00.000','1996-10-25 00:00:00.000',3,0.59,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10334','VICTE',8,'1996-10-21 00:00:00.000','1996-11-18 00:00:00.000','1996-10-28 00:00:00.000',2,8.56,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO orders  Values ('10335','HUNGO',7,'1996-10-22 00:00:00.000','1996-11-19 00:00:00.000','1996-10-24 00:00:00.000',2,42.11,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10336','PRINI',7,'1996-10-23 00:00:00.000','1996-11-20 00:00:00.000','1996-10-25 00:00:00.000',2,15.51,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO orders  Values ('10337','FRANK',4,'1996-10-24 00:00:00.000','1996-11-21 00:00:00.000','1996-10-29 00:00:00.000',3,108.26,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10338','OLDWO',4,'1996-10-25 00:00:00.000','1996-11-22 00:00:00.000','1996-10-29 00:00:00.000',3,84.21,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO orders  Values ('10339','MEREP',2,'1996-10-28 00:00:00.000','1996-11-25 00:00:00.000','1996-11-04 00:00:00.000',2,15.66,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10340','BONAP',1,'1996-10-29 00:00:00.000','1996-11-26 00:00:00.000','1996-11-08 00:00:00.000',3,166.31,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10341','SIMOB',7,'1996-10-29 00:00:00.000','1996-11-26 00:00:00.000','1996-11-05 00:00:00.000',3,26.78,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO orders  Values ('10342','FRANK',4,'1996-10-30 00:00:00.000','1996-11-13 00:00:00.000','1996-11-04 00:00:00.000',2,54.83,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10343','LEHMS',4,'1996-10-31 00:00:00.000','1996-11-28 00:00:00.000','1996-11-06 00:00:00.000',1,110.37,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10344','WHITC',4,'1996-11-01 00:00:00.000','1996-11-29 00:00:00.000','1996-11-05 00:00:00.000',2,23.29,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10345','QUICK',2,'1996-11-04 00:00:00.000','1996-12-02 00:00:00.000','1996-11-11 00:00:00.000',2,249.06,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10346','RATTC',3,'1996-11-05 00:00:00.000','1996-12-17 00:00:00.000','1996-11-08 00:00:00.000',3,142.08,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10347','FAMIA',4,'1996-11-06 00:00:00.000','1996-12-04 00:00:00.000','1996-11-08 00:00:00.000',3,3.1,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10348','WANDK',4,'1996-11-07 00:00:00.000','1996-12-05 00:00:00.000','1996-11-15 00:00:00.000',2,0.78,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10349','SPLIR',7,'1996-11-08 00:00:00.000','1996-12-06 00:00:00.000','1996-11-15 00:00:00.000',1,8.63,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10350','LAMAI',6,'1996-11-11 00:00:00.000','1996-12-09 00:00:00.000','1996-12-03 00:00:00.000',2,64.19,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10351','ERNSH',1,'1996-11-11 00:00:00.000','1996-12-09 00:00:00.000','1996-11-20 00:00:00.000',1,162.33,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10352','FURIB',3,'1996-11-12 00:00:00.000','1996-11-26 00:00:00.000','1996-11-18 00:00:00.000',3,1.3,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10353','PICCO',7,'1996-11-13 00:00:00.000','1996-12-11 00:00:00.000','1996-11-25 00:00:00.000',3,360.63,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10354','PERIC',8,'1996-11-14 00:00:00.000','1996-12-12 00:00:00.000','1996-11-20 00:00:00.000',3,53.8,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10355','AROUT',6,'1996-11-15 00:00:00.000','1996-12-13 00:00:00.000','1996-11-20 00:00:00.000',1,41.95,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10356','WANDK',6,'1996-11-18 00:00:00.000','1996-12-16 00:00:00.000','1996-11-27 00:00:00.000',2,36.71,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10357','LILAS',1,'1996-11-19 00:00:00.000','1996-12-17 00:00:00.000','1996-12-02 00:00:00.000',3,34.88,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10358','LAMAI',5,'1996-11-20 00:00:00.000','1996-12-18 00:00:00.000','1996-11-27 00:00:00.000',1,19.64,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10359','SEVES',5,'1996-11-21 00:00:00.000','1996-12-19 00:00:00.000','1996-11-26 00:00:00.000',3,288.43,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO orders  Values ('10360','BLONP',4,'1996-11-22 00:00:00.000','1996-12-20 00:00:00.000','1996-12-02 00:00:00.000',3,131.7,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10361','QUICK',1,'1996-11-22 00:00:00.000','1996-12-20 00:00:00.000','1996-12-03 00:00:00.000',2,183.17,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10362','BONAP',3,'1996-11-25 00:00:00.000','1996-12-23 00:00:00.000','1996-11-28 00:00:00.000',1,96.04,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10363','DRACD',4,'1996-11-26 00:00:00.000','1996-12-24 00:00:00.000','1996-12-04 00:00:00.000',3,30.54,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO orders  Values ('10364','EASTC',1,'1996-11-26 00:00:00.000','1997-01-07 00:00:00.000','1996-12-04 00:00:00.000',1,71.97,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO orders  Values ('10365','ANTON',3,'1996-11-27 00:00:00.000','1996-12-25 00:00:00.000','1996-12-02 00:00:00.000',2,22,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO orders  Values ('10366','GALED',8,'1996-11-28 00:00:00.000','1997-01-09 00:00:00.000','1996-12-30 00:00:00.000',2,10.14,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO orders  Values ('10367','VAFFE',7,'1996-11-28 00:00:00.000','1996-12-26 00:00:00.000','1996-12-02 00:00:00.000',3,13.55,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10368','ERNSH',2,'1996-11-29 00:00:00.000','1996-12-27 00:00:00.000','1996-12-02 00:00:00.000',2,101.95,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10369','SPLIR',8,'1996-12-02 00:00:00.000','1996-12-30 00:00:00.000','1996-12-09 00:00:00.000',2,195.68,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10370','CHOPS',6,'1996-12-03 00:00:00.000','1996-12-31 00:00:00.000','1996-12-27 00:00:00.000',2,1.17,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO orders  Values ('10371','LAMAI',1,'1996-12-03 00:00:00.000','1996-12-31 00:00:00.000','1996-12-24 00:00:00.000',1,0.45,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10372','QUEEN',5,'1996-12-04 00:00:00.000','1997-01-01 00:00:00.000','1996-12-09 00:00:00.000',2,890.78,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10373','HUNGO',4,'1996-12-05 00:00:00.000','1997-01-02 00:00:00.000','1996-12-11 00:00:00.000',3,124.12,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10374','WOLZA',1,'1996-12-05 00:00:00.000','1997-01-02 00:00:00.000','1996-12-09 00:00:00.000',3,3.94,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO orders  Values ('10375','HUNGC',3,'1996-12-06 00:00:00.000','1997-01-03 00:00:00.000','1996-12-09 00:00:00.000',2,20.12,'Hungry Coyote Import Store','city Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO orders  Values ('10376','MEREP',1,'1996-12-09 00:00:00.000','1997-01-06 00:00:00.000','1996-12-13 00:00:00.000',2,20.39,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10377','SEVES',1,'1996-12-09 00:00:00.000','1997-01-06 00:00:00.000','1996-12-13 00:00:00.000',3,22.21,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO orders  Values ('10378','FOLKO',5,'1996-12-10 00:00:00.000','1997-01-07 00:00:00.000','1996-12-19 00:00:00.000',3,5.44,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10379','QUEDE',2,'1996-12-11 00:00:00.000','1997-01-08 00:00:00.000','1996-12-13 00:00:00.000',1,45.03,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10380','HUNGO',8,'1996-12-12 00:00:00.000','1997-01-09 00:00:00.000','1997-01-16 00:00:00.000',3,35.03,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10381','LILAS',3,'1996-12-12 00:00:00.000','1997-01-09 00:00:00.000','1996-12-13 00:00:00.000',3,7.99,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10382','ERNSH',4,'1996-12-13 00:00:00.000','1997-01-10 00:00:00.000','1996-12-16 00:00:00.000',1,94.77,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10383','AROUT',8,'1996-12-16 00:00:00.000','1997-01-13 00:00:00.000','1996-12-18 00:00:00.000',3,34.24,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10384','BERGS',3,'1996-12-16 00:00:00.000','1997-01-13 00:00:00.000','1996-12-20 00:00:00.000',3,168.64,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10385','SPLIR',1,'1996-12-17 00:00:00.000','1997-01-14 00:00:00.000','1996-12-23 00:00:00.000',2,30.96,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10386','FAMIA',9,'1996-12-18 00:00:00.000','1997-01-01 00:00:00.000','1996-12-25 00:00:00.000',3,13.99,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10387','SANTG',1,'1996-12-18 00:00:00.000','1997-01-15 00:00:00.000','1996-12-20 00:00:00.000',2,93.63,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO orders  Values ('10388','SEVES',2,'1996-12-19 00:00:00.000','1997-01-16 00:00:00.000','1996-12-20 00:00:00.000',1,34.86,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO orders  Values ('10389','BOTTM',4,'1996-12-20 00:00:00.000','1997-01-17 00:00:00.000','1996-12-24 00:00:00.000',2,47.42,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO orders  Values ('10390','ERNSH',6,'1996-12-23 00:00:00.000','1997-01-20 00:00:00.000','1996-12-26 00:00:00.000',1,126.38,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10391','DRACD',3,'1996-12-23 00:00:00.000','1997-01-20 00:00:00.000','1996-12-31 00:00:00.000',3,5.45,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO orders  Values ('10392','PICCO',2,'1996-12-24 00:00:00.000','1997-01-21 00:00:00.000','1997-01-01 00:00:00.000',3,122.46,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10393','SAVEA',1,'1996-12-25 00:00:00.000','1997-01-22 00:00:00.000','1997-01-03 00:00:00.000',3,126.56,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10394','HUNGC',1,'1996-12-25 00:00:00.000','1997-01-22 00:00:00.000','1997-01-03 00:00:00.000',3,30.34,'Hungry Coyote Import Store','city Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO orders  Values ('10395','HILAA',6,'1996-12-26 00:00:00.000','1997-01-23 00:00:00.000','1997-01-03 00:00:00.000',1,184.41,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10396','FRANK',1,'1996-12-27 00:00:00.000','1997-01-10 00:00:00.000','1997-01-06 00:00:00.000',3,135.35,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10397','PRINI',5,'1996-12-27 00:00:00.000','1997-01-24 00:00:00.000','1997-01-02 00:00:00.000',1,60.26,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO orders  Values ('10398','SAVEA',2,'1996-12-30 00:00:00.000','1997-01-27 00:00:00.000','1997-01-09 00:00:00.000',3,89.16,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10399','VAFFE',8,'1996-12-31 00:00:00.000','1997-01-14 00:00:00.000','1997-01-08 00:00:00.000',3,27.36,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10400','EASTC',1,'1997-01-01 00:00:00.000','1997-01-29 00:00:00.000','1997-01-16 00:00:00.000',3,83.93,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO orders  Values ('10401','RATTC',1,'1997-01-01 00:00:00.000','1997-01-29 00:00:00.000','1997-01-10 00:00:00.000',1,12.51,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10402','ERNSH',8,'1997-01-02 00:00:00.000','1997-02-13 00:00:00.000','1997-01-10 00:00:00.000',2,67.88,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10403','ERNSH',4,'1997-01-03 00:00:00.000','1997-01-31 00:00:00.000','1997-01-09 00:00:00.000',3,73.79,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10404','MAGAA',2,'1997-01-03 00:00:00.000','1997-01-31 00:00:00.000','1997-01-08 00:00:00.000',1,155.97,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10405','LINOD',1,'1997-01-06 00:00:00.000','1997-02-03 00:00:00.000','1997-01-22 00:00:00.000',1,34.82,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO orders  Values ('10406','QUEEN',7,'1997-01-07 00:00:00.000','1997-02-18 00:00:00.000','1997-01-13 00:00:00.000',1,108.04,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10407','OTTIK',2,'1997-01-07 00:00:00.000','1997-02-04 00:00:00.000','1997-01-30 00:00:00.000',2,91.48,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10408','FOLIG',8,'1997-01-08 00:00:00.000','1997-02-05 00:00:00.000','1997-01-14 00:00:00.000',1,11.26,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO orders  Values ('10409','OCEAN',3,'1997-01-09 00:00:00.000','1997-02-06 00:00:00.000','1997-01-14 00:00:00.000',1,29.83,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO orders  Values ('10410','BOTTM',3,'1997-01-10 00:00:00.000','1997-02-07 00:00:00.000','1997-01-15 00:00:00.000',3,2.4,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO orders  Values ('10411','BOTTM',9,'1997-01-10 00:00:00.000','1997-02-07 00:00:00.000','1997-01-21 00:00:00.000',3,23.65,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO orders  Values ('10412','WARTH',8,'1997-01-13 00:00:00.000','1997-02-10 00:00:00.000','1997-01-15 00:00:00.000',2,3.77,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10413','LAMAI',3,'1997-01-14 00:00:00.000','1997-02-11 00:00:00.000','1997-01-16 00:00:00.000',2,95.66,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10414','FAMIA',2,'1997-01-14 00:00:00.000','1997-02-11 00:00:00.000','1997-01-17 00:00:00.000',3,21.48,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10415','HUNGC',3,'1997-01-15 00:00:00.000','1997-02-12 00:00:00.000','1997-01-24 00:00:00.000',1,0.2,'Hungry Coyote Import Store','city Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO orders  Values ('10416','WARTH',8,'1997-01-16 00:00:00.000','1997-02-13 00:00:00.000','1997-01-27 00:00:00.000',3,22.72,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10417','SIMOB',4,'1997-01-16 00:00:00.000','1997-02-13 00:00:00.000','1997-01-28 00:00:00.000',3,70.29,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO orders  Values ('10418','QUICK',4,'1997-01-17 00:00:00.000','1997-02-14 00:00:00.000','1997-01-24 00:00:00.000',1,17.55,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10419','RICSU',4,'1997-01-20 00:00:00.000','1997-02-17 00:00:00.000','1997-01-30 00:00:00.000',2,137.35,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO orders  Values ('10420','WELLI',3,'1997-01-21 00:00:00.000','1997-02-18 00:00:00.000','1997-01-27 00:00:00.000',1,44.12,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO orders  Values ('10421','QUEDE',8,'1997-01-21 00:00:00.000','1997-03-04 00:00:00.000','1997-01-27 00:00:00.000',1,99.23,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10422','FRANS',2,'1997-01-22 00:00:00.000','1997-02-19 00:00:00.000','1997-01-31 00:00:00.000',1,3.02,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO orders  Values ('10423','GOURL',6,'1997-01-23 00:00:00.000','1997-02-06 00:00:00.000','1997-02-24 00:00:00.000',3,24.5,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10424','MEREP',7,'1997-01-23 00:00:00.000','1997-02-20 00:00:00.000','1997-01-27 00:00:00.000',2,370.61,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10425','LAMAI',6,'1997-01-24 00:00:00.000','1997-02-21 00:00:00.000','1997-02-14 00:00:00.000',2,7.93,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10426','GALED',4,'1997-01-27 00:00:00.000','1997-02-24 00:00:00.000','1997-02-06 00:00:00.000',1,18.69,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO orders  Values ('10427','PICCO',4,'1997-01-27 00:00:00.000','1997-02-24 00:00:00.000','1997-03-03 00:00:00.000',2,31.29,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10428','REGGC',7,'1997-01-28 00:00:00.000','1997-02-25 00:00:00.000','1997-02-04 00:00:00.000',1,11.09,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10429','HUNGO',3,'1997-01-29 00:00:00.000','1997-03-12 00:00:00.000','1997-02-07 00:00:00.000',2,56.63,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10430','ERNSH',4,'1997-01-30 00:00:00.000','1997-02-13 00:00:00.000','1997-02-03 00:00:00.000',1,458.78,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10431','BOTTM',4,'1997-01-30 00:00:00.000','1997-02-13 00:00:00.000','1997-02-07 00:00:00.000',2,44.17,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO orders  Values ('10432','SPLIR',3,'1997-01-31 00:00:00.000','1997-02-14 00:00:00.000','1997-02-07 00:00:00.000',2,4.34,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10433','PRINI',3,'1997-02-03 00:00:00.000','1997-03-03 00:00:00.000','1997-03-04 00:00:00.000',3,73.83,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO orders  Values ('10434','FOLKO',3,'1997-02-03 00:00:00.000','1997-03-03 00:00:00.000','1997-02-13 00:00:00.000',2,17.92,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10435','CONSH',8,'1997-02-04 00:00:00.000','1997-03-18 00:00:00.000','1997-02-07 00:00:00.000',2,9.21,'Consolidated Holdings','Berkeley Gardens 12 Brewery','London',NULL,'WX1 6LT','UK');
INSERT INTO orders  Values ('10436','BLONP',3,'1997-02-05 00:00:00.000','1997-03-05 00:00:00.000','1997-02-11 00:00:00.000',2,156.66,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10437','WARTH',8,'1997-02-05 00:00:00.000','1997-03-05 00:00:00.000','1997-02-12 00:00:00.000',1,19.97,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10438','TOMSP',3,'1997-02-06 00:00:00.000','1997-03-06 00:00:00.000','1997-02-14 00:00:00.000',2,8.24,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO orders  Values ('10439','MEREP',6,'1997-02-07 00:00:00.000','1997-03-07 00:00:00.000','1997-02-10 00:00:00.000',3,4.07,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10440','SAVEA',4,'1997-02-10 00:00:00.000','1997-03-10 00:00:00.000','1997-02-28 00:00:00.000',2,86.53,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10441','OLDWO',3,'1997-02-10 00:00:00.000','1997-03-24 00:00:00.000','1997-03-14 00:00:00.000',2,73.02,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO orders  Values ('10442','ERNSH',3,'1997-02-11 00:00:00.000','1997-03-11 00:00:00.000','1997-02-18 00:00:00.000',2,47.94,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10443','REGGC',8,'1997-02-12 00:00:00.000','1997-03-12 00:00:00.000','1997-02-14 00:00:00.000',1,13.95,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10444','BERGS',3,'1997-02-12 00:00:00.000','1997-03-12 00:00:00.000','1997-02-21 00:00:00.000',3,3.5,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10445','BERGS',3,'1997-02-13 00:00:00.000','1997-03-13 00:00:00.000','1997-02-20 00:00:00.000',1,9.3,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10446','TOMSP',6,'1997-02-14 00:00:00.000','1997-03-14 00:00:00.000','1997-02-19 00:00:00.000',1,14.68,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO orders  Values ('10447','RICAR',4,'1997-02-14 00:00:00.000','1997-03-14 00:00:00.000','1997-03-07 00:00:00.000',2,68.66,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10448','RANCH',4,'1997-02-17 00:00:00.000','1997-03-17 00:00:00.000','1997-02-24 00:00:00.000',2,38.82,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO orders  Values ('10449','BLONP',3,'1997-02-18 00:00:00.000','1997-03-18 00:00:00.000','1997-02-27 00:00:00.000',2,53.3,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10450','VICTE',8,'1997-02-19 00:00:00.000','1997-03-19 00:00:00.000','1997-03-11 00:00:00.000',2,7.23,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO orders  Values ('10451','QUICK',4,'1997-02-19 00:00:00.000','1997-03-05 00:00:00.000','1997-03-12 00:00:00.000',3,189.09,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10452','SAVEA',8,'1997-02-20 00:00:00.000','1997-03-20 00:00:00.000','1997-02-26 00:00:00.000',1,140.26,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10453','AROUT',1,'1997-02-21 00:00:00.000','1997-03-21 00:00:00.000','1997-02-26 00:00:00.000',2,25.36,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10454','LAMAI',4,'1997-02-21 00:00:00.000','1997-03-21 00:00:00.000','1997-02-25 00:00:00.000',3,2.74,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10455','WARTH',8,'1997-02-24 00:00:00.000','1997-04-07 00:00:00.000','1997-03-03 00:00:00.000',2,180.45,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10456','KOENE',8,'1997-02-25 00:00:00.000','1997-04-08 00:00:00.000','1997-02-28 00:00:00.000',2,8.12,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10457','KOENE',2,'1997-02-25 00:00:00.000','1997-03-25 00:00:00.000','1997-03-03 00:00:00.000',1,11.57,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10458','SUPRD',7,'1997-02-26 00:00:00.000','1997-03-26 00:00:00.000','1997-03-04 00:00:00.000',3,147.06,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO orders  Values ('10459','VICTE',4,'1997-02-27 00:00:00.000','1997-03-27 00:00:00.000','1997-02-28 00:00:00.000',2,25.09,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO orders  Values ('10460','FOLKO',8,'1997-02-28 00:00:00.000','1997-03-28 00:00:00.000','1997-03-03 00:00:00.000',1,16.27,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10461','LILAS',1,'1997-02-28 00:00:00.000','1997-03-28 00:00:00.000','1997-03-05 00:00:00.000',3,148.61,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10462','CONSH',2,'1997-03-03 00:00:00.000','1997-03-31 00:00:00.000','1997-03-18 00:00:00.000',1,6.17,'Consolidated Holdings','Berkeley Gardens 12 Brewery','London',NULL,'WX1 6LT','UK');
INSERT INTO orders  Values ('10463','SUPRD',5,'1997-03-04 00:00:00.000','1997-04-01 00:00:00.000','1997-03-06 00:00:00.000',3,14.78,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO orders  Values ('10464','FURIB',4,'1997-03-04 00:00:00.000','1997-04-01 00:00:00.000','1997-03-14 00:00:00.000',2,89,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10465','VAFFE',1,'1997-03-05 00:00:00.000','1997-04-02 00:00:00.000','1997-03-14 00:00:00.000',3,145.04,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10466','COMMI',4,'1997-03-06 00:00:00.000','1997-04-03 00:00:00.000','1997-03-13 00:00:00.000',1,11.93,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO orders  Values ('10467','MAGAA',8,'1997-03-06 00:00:00.000','1997-04-03 00:00:00.000','1997-03-11 00:00:00.000',2,4.93,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10468','KOENE',3,'1997-03-07 00:00:00.000','1997-04-04 00:00:00.000','1997-03-12 00:00:00.000',3,44.12,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10469','WHITC',1,'1997-03-10 00:00:00.000','1997-04-07 00:00:00.000','1997-03-14 00:00:00.000',1,60.18,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10470','BONAP',4,'1997-03-11 00:00:00.000','1997-04-08 00:00:00.000','1997-03-14 00:00:00.000',2,64.56,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10471','BSBEV',2,'1997-03-11 00:00:00.000','1997-04-08 00:00:00.000','1997-03-18 00:00:00.000',3,45.59,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10472','SEVES',8,'1997-03-12 00:00:00.000','1997-04-09 00:00:00.000','1997-03-19 00:00:00.000',1,4.2,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO orders  Values ('10473','ISLAT',1,'1997-03-13 00:00:00.000','1997-03-27 00:00:00.000','1997-03-21 00:00:00.000',3,16.37,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10474','PERIC',5,'1997-03-13 00:00:00.000','1997-04-10 00:00:00.000','1997-03-21 00:00:00.000',2,83.49,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10475','SUPRD',9,'1997-03-14 00:00:00.000','1997-04-11 00:00:00.000','1997-04-04 00:00:00.000',1,68.52,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO orders  Values ('10476','HILAA',8,'1997-03-17 00:00:00.000','1997-04-14 00:00:00.000','1997-03-24 00:00:00.000',3,4.41,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10477','PRINI',5,'1997-03-17 00:00:00.000','1997-04-14 00:00:00.000','1997-03-25 00:00:00.000',2,13.02,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO orders  Values ('10478','VICTE',2,'1997-03-18 00:00:00.000','1997-04-01 00:00:00.000','1997-03-26 00:00:00.000',3,4.81,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO orders  Values ('10479','RATTC',3,'1997-03-19 00:00:00.000','1997-04-16 00:00:00.000','1997-03-21 00:00:00.000',3,708.95,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10480','FOLIG',6,'1997-03-20 00:00:00.000','1997-04-17 00:00:00.000','1997-03-24 00:00:00.000',2,1.35,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO orders  Values ('10481','RICAR',8,'1997-03-20 00:00:00.000','1997-04-17 00:00:00.000','1997-03-25 00:00:00.000',2,64.33,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10482','LAZYK',1,'1997-03-21 00:00:00.000','1997-04-18 00:00:00.000','1997-04-10 00:00:00.000',3,7.48,'Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','WA','99362','USA');
INSERT INTO orders  Values ('10483','WHITC',7,'1997-03-24 00:00:00.000','1997-04-21 00:00:00.000','1997-04-25 00:00:00.000',2,15.28,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10484','BSBEV',3,'1997-03-24 00:00:00.000','1997-04-21 00:00:00.000','1997-04-01 00:00:00.000',3,6.88,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10485','LINOD',4,'1997-03-25 00:00:00.000','1997-04-08 00:00:00.000','1997-03-31 00:00:00.000',2,64.45,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO orders  Values ('10486','HILAA',1,'1997-03-26 00:00:00.000','1997-04-23 00:00:00.000','1997-04-02 00:00:00.000',2,30.53,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10487','QUEEN',2,'1997-03-26 00:00:00.000','1997-04-23 00:00:00.000','1997-03-28 00:00:00.000',2,71.07,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10488','FRANK',8,'1997-03-27 00:00:00.000','1997-04-24 00:00:00.000','1997-04-02 00:00:00.000',2,4.93,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10489','PICCO',6,'1997-03-28 00:00:00.000','1997-04-25 00:00:00.000','1997-04-09 00:00:00.000',2,5.29,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10490','HILAA',7,'1997-03-31 00:00:00.000','1997-04-28 00:00:00.000','1997-04-03 00:00:00.000',2,210.19,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10491','FURIB',8,'1997-03-31 00:00:00.000','1997-04-28 00:00:00.000','1997-04-08 00:00:00.000',3,16.96,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10492','BOTTM',3,'1997-04-01 00:00:00.000','1997-04-29 00:00:00.000','1997-04-11 00:00:00.000',1,62.89,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO orders  Values ('10493','LAMAI',4,'1997-04-02 00:00:00.000','1997-04-30 00:00:00.000','1997-04-10 00:00:00.000',3,10.64,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10494','COMMI',4,'1997-04-02 00:00:00.000','1997-04-30 00:00:00.000','1997-04-09 00:00:00.000',2,65.99,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO orders  Values ('10495','LAUGB',3,'1997-04-03 00:00:00.000','1997-05-01 00:00:00.000','1997-04-11 00:00:00.000',3,4.65,'Laughing Bacchus Wine Cellars','2319 Elm St.','Vancouver','BC','V3F 2K1','Canada');
INSERT INTO orders  Values ('10496','TRADH',7,'1997-04-04 00:00:00.000','1997-05-02 00:00:00.000','1997-04-07 00:00:00.000',2,46.77,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO orders  Values ('10497','LEHMS',7,'1997-04-04 00:00:00.000','1997-05-02 00:00:00.000','1997-04-07 00:00:00.000',1,36.21,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10498','HILAA',8,'1997-04-07 00:00:00.000','1997-05-05 00:00:00.000','1997-04-11 00:00:00.000',2,29.75,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10499','LILAS',4,'1997-04-08 00:00:00.000','1997-05-06 00:00:00.000','1997-04-16 00:00:00.000',2,102.02,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10500','LAMAI',6,'1997-04-09 00:00:00.000','1997-05-07 00:00:00.000','1997-04-17 00:00:00.000',1,42.68,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10501','BLAUS',9,'1997-04-09 00:00:00.000','1997-05-07 00:00:00.000','1997-04-16 00:00:00.000',3,8.85,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO orders  Values ('10502','PERIC',2,'1997-04-10 00:00:00.000','1997-05-08 00:00:00.000','1997-04-29 00:00:00.000',1,69.32,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10503','HUNGO',6,'1997-04-11 00:00:00.000','1997-05-09 00:00:00.000','1997-04-16 00:00:00.000',2,16.74,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10504','WHITC',4,'1997-04-11 00:00:00.000','1997-05-09 00:00:00.000','1997-04-18 00:00:00.000',3,59.13,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10505','MEREP',3,'1997-04-14 00:00:00.000','1997-05-12 00:00:00.000','1997-04-21 00:00:00.000',3,7.13,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10506','KOENE',9,'1997-04-15 00:00:00.000','1997-05-13 00:00:00.000','1997-05-02 00:00:00.000',2,21.19,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10507','ANTON',7,'1997-04-15 00:00:00.000','1997-05-13 00:00:00.000','1997-04-22 00:00:00.000',1,47.45,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO orders  Values ('10508','OTTIK',1,'1997-04-16 00:00:00.000','1997-05-14 00:00:00.000','1997-05-13 00:00:00.000',2,4.99,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10509','BLAUS',4,'1997-04-17 00:00:00.000','1997-05-15 00:00:00.000','1997-04-29 00:00:00.000',1,0.15,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO orders  Values ('10510','SAVEA',6,'1997-04-18 00:00:00.000','1997-05-16 00:00:00.000','1997-04-28 00:00:00.000',3,367.63,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10511','BONAP',4,'1997-04-18 00:00:00.000','1997-05-16 00:00:00.000','1997-04-21 00:00:00.000',3,350.64,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10512','FAMIA',7,'1997-04-21 00:00:00.000','1997-05-19 00:00:00.000','1997-04-24 00:00:00.000',2,3.53,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10513','WANDK',7,'1997-04-22 00:00:00.000','1997-06-03 00:00:00.000','1997-04-28 00:00:00.000',1,105.65,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10514','ERNSH',3,'1997-04-22 00:00:00.000','1997-05-20 00:00:00.000','1997-05-16 00:00:00.000',2,789.95,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10515','QUICK',2,'1997-04-23 00:00:00.000','1997-05-07 00:00:00.000','1997-05-23 00:00:00.000',1,204.47,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10516','HUNGO',2,'1997-04-24 00:00:00.000','1997-05-22 00:00:00.000','1997-05-01 00:00:00.000',3,62.78,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10517','NORTS',3,'1997-04-24 00:00:00.000','1997-05-22 00:00:00.000','1997-04-29 00:00:00.000',3,32.07,'North/South','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK');
INSERT INTO orders  Values ('10518','TORTU',4,'1997-04-25 00:00:00.000','1997-05-09 00:00:00.000','1997-05-05 00:00:00.000',2,218.15,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10519','CHOPS',6,'1997-04-28 00:00:00.000','1997-05-26 00:00:00.000','1997-05-01 00:00:00.000',3,91.76,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO orders  Values ('10520','SANTG',7,'1997-04-29 00:00:00.000','1997-05-27 00:00:00.000','1997-05-01 00:00:00.000',1,13.37,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO orders  Values ('10521','CACTU',8,'1997-04-29 00:00:00.000','1997-05-27 00:00:00.000','1997-05-02 00:00:00.000',2,17.22,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO orders  Values ('10522','LEHMS',4,'1997-04-30 00:00:00.000','1997-05-28 00:00:00.000','1997-05-06 00:00:00.000',1,45.33,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10523','SEVES',7,'1997-05-01 00:00:00.000','1997-05-29 00:00:00.000','1997-05-30 00:00:00.000',2,77.63,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO orders  Values ('10524','BERGS',1,'1997-05-01 00:00:00.000','1997-05-29 00:00:00.000','1997-05-07 00:00:00.000',2,244.79,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10525','BONAP',1,'1997-05-02 00:00:00.000','1997-05-30 00:00:00.000','1997-05-23 00:00:00.000',2,11.06,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10526','WARTH',4,'1997-05-05 00:00:00.000','1997-06-02 00:00:00.000','1997-05-15 00:00:00.000',2,58.59,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10527','QUICK',7,'1997-05-05 00:00:00.000','1997-06-02 00:00:00.000','1997-05-07 00:00:00.000',1,41.9,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10528','GREAL',6,'1997-05-06 00:00:00.000','1997-05-20 00:00:00.000','1997-05-09 00:00:00.000',2,3.35,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO orders  Values ('10529','MAISD',5,'1997-05-07 00:00:00.000','1997-06-04 00:00:00.000','1997-05-09 00:00:00.000',2,66.69,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO orders  Values ('10530','PICCO',3,'1997-05-08 00:00:00.000','1997-06-05 00:00:00.000','1997-05-12 00:00:00.000',2,339.22,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10531','OCEAN',7,'1997-05-08 00:00:00.000','1997-06-05 00:00:00.000','1997-05-19 00:00:00.000',1,8.12,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO orders  Values ('10532','EASTC',7,'1997-05-09 00:00:00.000','1997-06-06 00:00:00.000','1997-05-12 00:00:00.000',3,74.46,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO orders  Values ('10533','FOLKO',8,'1997-05-12 00:00:00.000','1997-06-09 00:00:00.000','1997-05-22 00:00:00.000',1,188.04,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10534','LEHMS',8,'1997-05-12 00:00:00.000','1997-06-09 00:00:00.000','1997-05-14 00:00:00.000',2,27.94,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10535','ANTON',4,'1997-05-13 00:00:00.000','1997-06-10 00:00:00.000','1997-05-21 00:00:00.000',1,15.64,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO orders  Values ('10536','LEHMS',3,'1997-05-14 00:00:00.000','1997-06-11 00:00:00.000','1997-06-06 00:00:00.000',2,58.88,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10537','RICSU',1,'1997-05-14 00:00:00.000','1997-05-28 00:00:00.000','1997-05-19 00:00:00.000',1,78.85,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO orders  Values ('10538','BSBEV',9,'1997-05-15 00:00:00.000','1997-06-12 00:00:00.000','1997-05-16 00:00:00.000',3,4.87,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10539','BSBEV',6,'1997-05-16 00:00:00.000','1997-06-13 00:00:00.000','1997-05-23 00:00:00.000',3,12.36,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10540','QUICK',3,'1997-05-19 00:00:00.000','1997-06-16 00:00:00.000','1997-06-13 00:00:00.000',3,1007.64,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10541','HANAR',2,'1997-05-19 00:00:00.000','1997-06-16 00:00:00.000','1997-05-29 00:00:00.000',1,68.65,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10542','KOENE',1,'1997-05-20 00:00:00.000','1997-06-17 00:00:00.000','1997-05-26 00:00:00.000',3,10.95,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10543','LILAS',8,'1997-05-21 00:00:00.000','1997-06-18 00:00:00.000','1997-05-23 00:00:00.000',2,48.17,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10544','LONEP',4,'1997-05-21 00:00:00.000','1997-06-18 00:00:00.000','1997-05-30 00:00:00.000',1,24.91,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO orders  Values ('10545','LAZYK',8,'1997-05-22 00:00:00.000','1997-06-19 00:00:00.000','1997-06-26 00:00:00.000',2,11.92,'Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','WA','99362','USA');
INSERT INTO orders  Values ('10546','VICTE',1,'1997-05-23 00:00:00.000','1997-06-20 00:00:00.000','1997-05-27 00:00:00.000',3,194.72,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO orders  Values ('10547','SEVES',3,'1997-05-23 00:00:00.000','1997-06-20 00:00:00.000','1997-06-02 00:00:00.000',2,178.43,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO orders  Values ('10548','TOMSP',3,'1997-05-26 00:00:00.000','1997-06-23 00:00:00.000','1997-06-02 00:00:00.000',2,1.43,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO orders  Values ('10549','QUICK',5,'1997-05-27 00:00:00.000','1997-06-10 00:00:00.000','1997-05-30 00:00:00.000',1,171.24,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10550','GODOS',7,'1997-05-28 00:00:00.000','1997-06-25 00:00:00.000','1997-06-06 00:00:00.000',3,4.32,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO orders  Values ('10551','FURIB',4,'1997-05-28 00:00:00.000','1997-07-09 00:00:00.000','1997-06-06 00:00:00.000',3,72.95,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10552','HILAA',2,'1997-05-29 00:00:00.000','1997-06-26 00:00:00.000','1997-06-05 00:00:00.000',1,83.22,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10553','WARTH',2,'1997-05-30 00:00:00.000','1997-06-27 00:00:00.000','1997-06-03 00:00:00.000',2,149.49,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10554','OTTIK',4,'1997-05-30 00:00:00.000','1997-06-27 00:00:00.000','1997-06-05 00:00:00.000',3,120.97,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10555','SAVEA',6,'1997-06-02 00:00:00.000','1997-06-30 00:00:00.000','1997-06-04 00:00:00.000',3,252.49,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10556','SIMOB',2,'1997-06-03 00:00:00.000','1997-07-15 00:00:00.000','1997-06-13 00:00:00.000',1,9.8,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO orders  Values ('10557','LEHMS',9,'1997-06-03 00:00:00.000','1997-06-17 00:00:00.000','1997-06-06 00:00:00.000',2,96.72,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10558','AROUT',1,'1997-06-04 00:00:00.000','1997-07-02 00:00:00.000','1997-06-10 00:00:00.000',2,72.97,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10559','BLONP',6,'1997-06-05 00:00:00.000','1997-07-03 00:00:00.000','1997-06-13 00:00:00.000',1,8.05,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10560','FRANK',8,'1997-06-06 00:00:00.000','1997-07-04 00:00:00.000','1997-06-09 00:00:00.000',1,36.65,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10561','FOLKO',2,'1997-06-06 00:00:00.000','1997-07-04 00:00:00.000','1997-06-09 00:00:00.000',2,242.21,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10562','REGGC',1,'1997-06-09 00:00:00.000','1997-07-07 00:00:00.000','1997-06-12 00:00:00.000',1,22.95,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10563','RICAR',2,'1997-06-10 00:00:00.000','1997-07-22 00:00:00.000','1997-06-24 00:00:00.000',2,60.43,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10564','RATTC',4,'1997-06-10 00:00:00.000','1997-07-08 00:00:00.000','1997-06-16 00:00:00.000',3,13.75,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10565','MEREP',8,'1997-06-11 00:00:00.000','1997-07-09 00:00:00.000','1997-06-18 00:00:00.000',2,7.15,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10566','BLONP',9,'1997-06-12 00:00:00.000','1997-07-10 00:00:00.000','1997-06-18 00:00:00.000',1,88.4,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10567','HUNGO',1,'1997-06-12 00:00:00.000','1997-07-10 00:00:00.000','1997-06-17 00:00:00.000',1,33.97,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10568','GALED',3,'1997-06-13 00:00:00.000','1997-07-11 00:00:00.000','1997-07-09 00:00:00.000',3,6.54,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO orders  Values ('10569','RATTC',5,'1997-06-16 00:00:00.000','1997-07-14 00:00:00.000','1997-07-11 00:00:00.000',1,58.98,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10570','MEREP',3,'1997-06-17 00:00:00.000','1997-07-15 00:00:00.000','1997-06-19 00:00:00.000',3,188.99,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10571','ERNSH',8,'1997-06-17 00:00:00.000','1997-07-29 00:00:00.000','1997-07-04 00:00:00.000',3,26.06,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10572','BERGS',3,'1997-06-18 00:00:00.000','1997-07-16 00:00:00.000','1997-06-25 00:00:00.000',2,116.43,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10573','ANTON',7,'1997-06-19 00:00:00.000','1997-07-17 00:00:00.000','1997-06-20 00:00:00.000',3,84.84,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO orders  Values ('10574','TRAIH',4,'1997-06-19 00:00:00.000','1997-07-17 00:00:00.000','1997-06-30 00:00:00.000',2,37.6,'Trail-s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','WA','98034','USA');
INSERT INTO orders  Values ('10575','MORGK',5,'1997-06-20 00:00:00.000','1997-07-04 00:00:00.000','1997-06-30 00:00:00.000',1,127.34,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO orders  Values ('10576','TORTU',3,'1997-06-23 00:00:00.000','1997-07-07 00:00:00.000','1997-06-30 00:00:00.000',3,18.56,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10577','TRAIH',9,'1997-06-23 00:00:00.000','1997-08-04 00:00:00.000','1997-06-30 00:00:00.000',2,25.41,'Trail-s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','WA','98034','USA');
INSERT INTO orders  Values ('10578','BSBEV',4,'1997-06-24 00:00:00.000','1997-07-22 00:00:00.000','1997-07-25 00:00:00.000',3,29.6,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10579','LETSS',1,'1997-06-25 00:00:00.000','1997-07-23 00:00:00.000','1997-07-04 00:00:00.000',2,13.73,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO orders  Values ('10580','OTTIK',4,'1997-06-26 00:00:00.000','1997-07-24 00:00:00.000','1997-07-01 00:00:00.000',3,75.89,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10581','FAMIA',3,'1997-06-26 00:00:00.000','1997-07-24 00:00:00.000','1997-07-02 00:00:00.000',1,3.01,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10582','BLAUS',3,'1997-06-27 00:00:00.000','1997-07-25 00:00:00.000','1997-07-14 00:00:00.000',2,27.71,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO orders  Values ('10583','WARTH',2,'1997-06-30 00:00:00.000','1997-07-28 00:00:00.000','1997-07-04 00:00:00.000',2,7.28,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10584','BLONP',4,'1997-06-30 00:00:00.000','1997-07-28 00:00:00.000','1997-07-04 00:00:00.000',1,59.14,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10585','WELLI',7,'1997-07-01 00:00:00.000','1997-07-29 00:00:00.000','1997-07-10 00:00:00.000',1,13.41,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO orders  Values ('10586','REGGC',9,'1997-07-02 00:00:00.000','1997-07-30 00:00:00.000','1997-07-09 00:00:00.000',1,0.48,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10587','QUEDE',1,'1997-07-02 00:00:00.000','1997-07-30 00:00:00.000','1997-07-09 00:00:00.000',1,62.52,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10588','QUICK',2,'1997-07-03 00:00:00.000','1997-07-31 00:00:00.000','1997-07-10 00:00:00.000',3,194.67,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10589','GREAL',8,'1997-07-04 00:00:00.000','1997-08-01 00:00:00.000','1997-07-14 00:00:00.000',2,4.42,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO orders  Values ('10590','MEREP',4,'1997-07-07 00:00:00.000','1997-08-04 00:00:00.000','1997-07-14 00:00:00.000',3,44.77,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10591','VAFFE',1,'1997-07-07 00:00:00.000','1997-07-21 00:00:00.000','1997-07-16 00:00:00.000',1,55.92,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10592','LEHMS',3,'1997-07-08 00:00:00.000','1997-08-05 00:00:00.000','1997-07-16 00:00:00.000',1,32.1,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10593','LEHMS',7,'1997-07-09 00:00:00.000','1997-08-06 00:00:00.000','1997-08-13 00:00:00.000',2,174.2,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10594','OLDWO',3,'1997-07-09 00:00:00.000','1997-08-06 00:00:00.000','1997-07-16 00:00:00.000',2,5.24,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO orders  Values ('10595','ERNSH',2,'1997-07-10 00:00:00.000','1997-08-07 00:00:00.000','1997-07-14 00:00:00.000',1,96.78,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10596','WHITC',8,'1997-07-11 00:00:00.000','1997-08-08 00:00:00.000','1997-08-12 00:00:00.000',1,16.34,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10597','PICCO',7,'1997-07-11 00:00:00.000','1997-08-08 00:00:00.000','1997-07-18 00:00:00.000',3,35.12,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10598','RATTC',1,'1997-07-14 00:00:00.000','1997-08-11 00:00:00.000','1997-07-18 00:00:00.000',3,44.42,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10599','BSBEV',6,'1997-07-15 00:00:00.000','1997-08-26 00:00:00.000','1997-07-21 00:00:00.000',3,29.98,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO orders  Values ('10600','HUNGC',4,'1997-07-16 00:00:00.000','1997-08-13 00:00:00.000','1997-07-21 00:00:00.000',1,45.13,'Hungry Coyote Import Store','city Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO orders  Values ('10601','HILAA',7,'1997-07-16 00:00:00.000','1997-08-27 00:00:00.000','1997-07-22 00:00:00.000',1,58.3,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10602','VAFFE',8,'1997-07-17 00:00:00.000','1997-08-14 00:00:00.000','1997-07-22 00:00:00.000',2,2.92,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10603','SAVEA',8,'1997-07-18 00:00:00.000','1997-08-15 00:00:00.000','1997-08-08 00:00:00.000',2,48.77,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10604','FURIB',1,'1997-07-18 00:00:00.000','1997-08-15 00:00:00.000','1997-07-29 00:00:00.000',1,7.46,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10605','MEREP',1,'1997-07-21 00:00:00.000','1997-08-18 00:00:00.000','1997-07-29 00:00:00.000',2,379.13,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10606','TRADH',4,'1997-07-22 00:00:00.000','1997-08-19 00:00:00.000','1997-07-31 00:00:00.000',3,79.4,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO orders  Values ('10607','SAVEA',5,'1997-07-22 00:00:00.000','1997-08-19 00:00:00.000','1997-07-25 00:00:00.000',1,200.24,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10608','TOMSP',4,'1997-07-23 00:00:00.000','1997-08-20 00:00:00.000','1997-08-01 00:00:00.000',2,27.79,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO orders  Values ('10609','DUMON',7,'1997-07-24 00:00:00.000','1997-08-21 00:00:00.000','1997-07-30 00:00:00.000',2,1.85,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO orders  Values ('10610','LAMAI',8,'1997-07-25 00:00:00.000','1997-08-22 00:00:00.000','1997-08-06 00:00:00.000',1,26.78,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10611','WOLZA',6,'1997-07-25 00:00:00.000','1997-08-22 00:00:00.000','1997-08-01 00:00:00.000',2,80.65,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO orders  Values ('10612','SAVEA',1,'1997-07-28 00:00:00.000','1997-08-25 00:00:00.000','1997-08-01 00:00:00.000',2,544.08,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10613','HILAA',4,'1997-07-29 00:00:00.000','1997-08-26 00:00:00.000','1997-08-01 00:00:00.000',2,8.11,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10614','BLAUS',8,'1997-07-29 00:00:00.000','1997-08-26 00:00:00.000','1997-08-01 00:00:00.000',3,1.93,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO orders  Values ('10615','WILMK',2,'1997-07-30 00:00:00.000','1997-08-27 00:00:00.000','1997-08-06 00:00:00.000',3,0.75,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO orders  Values ('10616','GREAL',1,'1997-07-31 00:00:00.000','1997-08-28 00:00:00.000','1997-08-05 00:00:00.000',2,116.53,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO orders  Values ('10617','GREAL',4,'1997-07-31 00:00:00.000','1997-08-28 00:00:00.000','1997-08-04 00:00:00.000',2,18.53,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO orders  Values ('10618','MEREP',1,'1997-08-01 00:00:00.000','1997-09-12 00:00:00.000','1997-08-08 00:00:00.000',1,154.68,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10619','MEREP',3,'1997-08-04 00:00:00.000','1997-09-01 00:00:00.000','1997-08-07 00:00:00.000',3,91.05,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10620','LAUGB',2,'1997-08-05 00:00:00.000','1997-09-02 00:00:00.000','1997-08-14 00:00:00.000',3,0.94,'Laughing Bacchus Wine Cellars','2319 Elm St.','Vancouver','BC','V3F 2K1','Canada');
INSERT INTO orders  Values ('10621','ISLAT',4,'1997-08-05 00:00:00.000','1997-09-02 00:00:00.000','1997-08-11 00:00:00.000',2,23.73,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10622','RICAR',4,'1997-08-06 00:00:00.000','1997-09-03 00:00:00.000','1997-08-11 00:00:00.000',3,50.97,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10623','FRANK',8,'1997-08-07 00:00:00.000','1997-09-04 00:00:00.000','1997-08-12 00:00:00.000',2,97.18,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10624','THECR',4,'1997-08-07 00:00:00.000','1997-09-04 00:00:00.000','1997-08-19 00:00:00.000',2,94.8,'The Cracker Box','55 Grizzly Peak Rd.','Butte','MT','59801','USA');
INSERT INTO orders  Values ('10625','ANATR',3,'1997-08-08 00:00:00.000','1997-09-05 00:00:00.000','1997-08-14 00:00:00.000',1,43.9,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO orders  Values ('10626','BERGS',1,'1997-08-11 00:00:00.000','1997-09-08 00:00:00.000','1997-08-20 00:00:00.000',2,138.69,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10627','SAVEA',8,'1997-08-11 00:00:00.000','1997-09-22 00:00:00.000','1997-08-21 00:00:00.000',3,107.46,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10628','BLONP',4,'1997-08-12 00:00:00.000','1997-09-09 00:00:00.000','1997-08-20 00:00:00.000',3,30.36,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10629','GODOS',4,'1997-08-12 00:00:00.000','1997-09-09 00:00:00.000','1997-08-20 00:00:00.000',3,85.46,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO orders  Values ('10630','KOENE',1,'1997-08-13 00:00:00.000','1997-09-10 00:00:00.000','1997-08-19 00:00:00.000',2,32.35,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10631','LAMAI',8,'1997-08-14 00:00:00.000','1997-09-11 00:00:00.000','1997-08-15 00:00:00.000',1,0.87,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10632','WANDK',8,'1997-08-14 00:00:00.000','1997-09-11 00:00:00.000','1997-08-19 00:00:00.000',1,41.38,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10633','ERNSH',7,'1997-08-15 00:00:00.000','1997-09-12 00:00:00.000','1997-08-18 00:00:00.000',3,477.9,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10634','FOLIG',4,'1997-08-15 00:00:00.000','1997-09-12 00:00:00.000','1997-08-21 00:00:00.000',3,487.38,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO orders  Values ('10635','MAGAA',8,'1997-08-18 00:00:00.000','1997-09-15 00:00:00.000','1997-08-21 00:00:00.000',3,47.46,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10636','WARTH',4,'1997-08-19 00:00:00.000','1997-09-16 00:00:00.000','1997-08-26 00:00:00.000',1,1.15,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10637','QUEEN',6,'1997-08-19 00:00:00.000','1997-09-16 00:00:00.000','1997-08-26 00:00:00.000',1,201.29,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10638','LINOD',3,'1997-08-20 00:00:00.000','1997-09-17 00:00:00.000','1997-09-01 00:00:00.000',1,158.44,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO orders  Values ('10639','SANTG',7,'1997-08-20 00:00:00.000','1997-09-17 00:00:00.000','1997-08-27 00:00:00.000',3,38.64,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO orders  Values ('10640','WANDK',4,'1997-08-21 00:00:00.000','1997-09-18 00:00:00.000','1997-08-28 00:00:00.000',1,23.55,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10641','HILAA',4,'1997-08-22 00:00:00.000','1997-09-19 00:00:00.000','1997-08-26 00:00:00.000',2,179.61,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10642','SIMOB',7,'1997-08-22 00:00:00.000','1997-09-19 00:00:00.000','1997-09-05 00:00:00.000',3,41.89,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO orders  Values ('10643','ALFKI',6,'1997-08-25 00:00:00.000','1997-09-22 00:00:00.000','1997-09-02 00:00:00.000',1,29.46,'Alfreds Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO orders  Values ('10644','WELLI',3,'1997-08-25 00:00:00.000','1997-09-22 00:00:00.000','1997-09-01 00:00:00.000',2,0.14,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO orders  Values ('10645','HANAR',4,'1997-08-26 00:00:00.000','1997-09-23 00:00:00.000','1997-09-02 00:00:00.000',1,12.41,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10646','HUNGO',9,'1997-08-27 00:00:00.000','1997-10-08 00:00:00.000','1997-09-03 00:00:00.000',3,142.33,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10647','QUEDE',4,'1997-08-27 00:00:00.000','1997-09-10 00:00:00.000','1997-09-03 00:00:00.000',2,45.54,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10648','RICAR',5,'1997-08-28 00:00:00.000','1997-10-09 00:00:00.000','1997-09-09 00:00:00.000',2,14.25,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO orders  Values ('10649','MAISD',5,'1997-08-28 00:00:00.000','1997-09-25 00:00:00.000','1997-08-29 00:00:00.000',3,6.2,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO orders  Values ('10650','FAMIA',5,'1997-08-29 00:00:00.000','1997-09-26 00:00:00.000','1997-09-03 00:00:00.000',3,176.81,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10651','WANDK',8,'1997-09-01 00:00:00.000','1997-09-29 00:00:00.000','1997-09-11 00:00:00.000',2,20.6,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10652','GOURL',4,'1997-09-01 00:00:00.000','1997-09-29 00:00:00.000','1997-09-08 00:00:00.000',2,7.14,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10653','FRANK',1,'1997-09-02 00:00:00.000','1997-09-30 00:00:00.000','1997-09-19 00:00:00.000',1,93.25,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10654','BERGS',5,'1997-09-02 00:00:00.000','1997-09-30 00:00:00.000','1997-09-11 00:00:00.000',1,55.26,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10655','REGGC',1,'1997-09-03 00:00:00.000','1997-10-01 00:00:00.000','1997-09-11 00:00:00.000',2,4.41,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10656','GREAL',6,'1997-09-04 00:00:00.000','1997-10-02 00:00:00.000','1997-09-10 00:00:00.000',1,57.15,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO orders  Values ('10657','SAVEA',2,'1997-09-04 00:00:00.000','1997-10-02 00:00:00.000','1997-09-15 00:00:00.000',2,352.69,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10658','QUICK',4,'1997-09-05 00:00:00.000','1997-10-03 00:00:00.000','1997-09-08 00:00:00.000',1,364.15,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10659','QUEEN',7,'1997-09-05 00:00:00.000','1997-10-03 00:00:00.000','1997-09-10 00:00:00.000',2,105.81,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10660','HUNGC',8,'1997-09-08 00:00:00.000','1997-10-06 00:00:00.000','1997-10-15 00:00:00.000',1,111.29,'Hungry Coyote Import Store','city Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO orders  Values ('10661','HUNGO',7,'1997-09-09 00:00:00.000','1997-10-07 00:00:00.000','1997-09-15 00:00:00.000',3,17.55,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10662','LONEP',3,'1997-09-09 00:00:00.000','1997-10-07 00:00:00.000','1997-09-18 00:00:00.000',2,1.28,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO orders  Values ('10663','BONAP',2,'1997-09-10 00:00:00.000','1997-09-24 00:00:00.000','1997-10-03 00:00:00.000',2,113.15,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10664','FURIB',1,'1997-09-10 00:00:00.000','1997-10-08 00:00:00.000','1997-09-19 00:00:00.000',3,1.27,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO orders  Values ('10665','LONEP',1,'1997-09-11 00:00:00.000','1997-10-09 00:00:00.000','1997-09-17 00:00:00.000',2,26.31,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO orders  Values ('10666','RICSU',7,'1997-09-12 00:00:00.000','1997-10-10 00:00:00.000','1997-09-22 00:00:00.000',2,232.42,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO orders  Values ('10667','ERNSH',7,'1997-09-12 00:00:00.000','1997-10-10 00:00:00.000','1997-09-19 00:00:00.000',1,78.09,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10668','WANDK',1,'1997-09-15 00:00:00.000','1997-10-13 00:00:00.000','1997-09-23 00:00:00.000',2,47.22,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO orders  Values ('10669','SIMOB',2,'1997-09-15 00:00:00.000','1997-10-13 00:00:00.000','1997-09-22 00:00:00.000',1,24.39,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO orders  Values ('10670','FRANK',4,'1997-09-16 00:00:00.000','1997-10-14 00:00:00.000','1997-09-18 00:00:00.000',1,203.48,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10671','FRANR',1,'1997-09-17 00:00:00.000','1997-10-15 00:00:00.000','1997-09-24 00:00:00.000',1,30.34,'France restauration','54, rue Royale','Nantes',NULL,'44000','France');
INSERT INTO orders  Values ('10672','BERGS',9,'1997-09-17 00:00:00.000','1997-10-01 00:00:00.000','1997-09-26 00:00:00.000',2,95.75,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10673','WILMK',2,'1997-09-18 00:00:00.000','1997-10-16 00:00:00.000','1997-09-19 00:00:00.000',1,22.76,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO orders  Values ('10674','ISLAT',4,'1997-09-18 00:00:00.000','1997-10-16 00:00:00.000','1997-09-30 00:00:00.000',2,0.9,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10675','FRANK',5,'1997-09-19 00:00:00.000','1997-10-17 00:00:00.000','1997-09-23 00:00:00.000',2,31.85,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10676','TORTU',2,'1997-09-22 00:00:00.000','1997-10-20 00:00:00.000','1997-09-29 00:00:00.000',2,2.01,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO orders  Values ('10677','ANTON',1,'1997-09-22 00:00:00.000','1997-10-20 00:00:00.000','1997-09-26 00:00:00.000',3,4.03,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO orders  Values ('10678','SAVEA',7,'1997-09-23 00:00:00.000','1997-10-21 00:00:00.000','1997-10-16 00:00:00.000',3,388.98,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10679','BLONP',8,'1997-09-23 00:00:00.000','1997-10-21 00:00:00.000','1997-09-30 00:00:00.000',3,27.94,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO orders  Values ('10680','OLDWO',1,'1997-09-24 00:00:00.000','1997-10-22 00:00:00.000','1997-09-26 00:00:00.000',1,26.61,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO orders  Values ('10681','GREAL',3,'1997-09-25 00:00:00.000','1997-10-23 00:00:00.000','1997-09-30 00:00:00.000',3,76.13,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO orders  Values ('10682','ANTON',3,'1997-09-25 00:00:00.000','1997-10-23 00:00:00.000','1997-10-01 00:00:00.000',2,36.13,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO orders  Values ('10683','DUMON',2,'1997-09-26 00:00:00.000','1997-10-24 00:00:00.000','1997-10-01 00:00:00.000',1,4.4,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO orders  Values ('10684','OTTIK',3,'1997-09-26 00:00:00.000','1997-10-24 00:00:00.000','1997-09-30 00:00:00.000',1,145.63,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10685','GOURL',4,'1997-09-29 00:00:00.000','1997-10-13 00:00:00.000','1997-10-03 00:00:00.000',2,33.75,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10686','PICCO',2,'1997-09-30 00:00:00.000','1997-10-28 00:00:00.000','1997-10-08 00:00:00.000',1,96.5,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10687','HUNGO',9,'1997-09-30 00:00:00.000','1997-10-28 00:00:00.000','1997-10-30 00:00:00.000',2,296.43,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10688','VAFFE',4,'1997-10-01 00:00:00.000','1997-10-15 00:00:00.000','1997-10-07 00:00:00.000',2,299.09,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10689','BERGS',1,'1997-10-01 00:00:00.000','1997-10-29 00:00:00.000','1997-10-07 00:00:00.000',2,13.42,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10690','HANAR',1,'1997-10-02 00:00:00.000','1997-10-30 00:00:00.000','1997-10-03 00:00:00.000',1,15.8,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10691','QUICK',2,'1997-10-03 00:00:00.000','1997-11-14 00:00:00.000','1997-10-22 00:00:00.000',2,810.05,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10692','ALFKI',4,'1997-10-03 00:00:00.000','1997-10-31 00:00:00.000','1997-10-13 00:00:00.000',2,61.02,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO orders  Values ('10693','WHITC',3,'1997-10-06 00:00:00.000','1997-10-20 00:00:00.000','1997-10-10 00:00:00.000',3,139.34,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10694','QUICK',8,'1997-10-06 00:00:00.000','1997-11-03 00:00:00.000','1997-10-09 00:00:00.000',3,398.36,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10695','WILMK',7,'1997-10-07 00:00:00.000','1997-11-18 00:00:00.000','1997-10-14 00:00:00.000',1,16.72,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO orders  Values ('10696','WHITC',8,'1997-10-08 00:00:00.000','1997-11-19 00:00:00.000','1997-10-14 00:00:00.000',3,102.55,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10697','LINOD',3,'1997-10-08 00:00:00.000','1997-11-05 00:00:00.000','1997-10-14 00:00:00.000',1,45.52,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO orders  Values ('10698','ERNSH',4,'1997-10-09 00:00:00.000','1997-11-06 00:00:00.000','1997-10-17 00:00:00.000',1,272.47,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10699','MORGK',3,'1997-10-09 00:00:00.000','1997-11-06 00:00:00.000','1997-10-13 00:00:00.000',3,0.58,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO orders  Values ('10700','SAVEA',3,'1997-10-10 00:00:00.000','1997-11-07 00:00:00.000','1997-10-16 00:00:00.000',1,65.1,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10701','HUNGO',6,'1997-10-13 00:00:00.000','1997-10-27 00:00:00.000','1997-10-15 00:00:00.000',3,220.31,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10702','ALFKI',4,'1997-10-13 00:00:00.000','1997-11-24 00:00:00.000','1997-10-21 00:00:00.000',1,23.94,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO orders  Values ('10703','FOLKO',6,'1997-10-14 00:00:00.000','1997-11-11 00:00:00.000','1997-10-20 00:00:00.000',2,152.3,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10704','QUEEN',6,'1997-10-14 00:00:00.000','1997-11-11 00:00:00.000','1997-11-07 00:00:00.000',1,4.78,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10705','HILAA',9,'1997-10-15 00:00:00.000','1997-11-12 00:00:00.000','1997-11-18 00:00:00.000',2,3.52,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10706','OLDWO',8,'1997-10-16 00:00:00.000','1997-11-13 00:00:00.000','1997-10-21 00:00:00.000',3,135.63,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO orders  Values ('10707','AROUT',4,'1997-10-16 00:00:00.000','1997-10-30 00:00:00.000','1997-10-23 00:00:00.000',3,21.74,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10708','THEBI',6,'1997-10-17 00:00:00.000','1997-11-28 00:00:00.000','1997-11-05 00:00:00.000',2,2.96,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO orders  Values ('10709','GOURL',1,'1997-10-17 00:00:00.000','1997-11-14 00:00:00.000','1997-11-20 00:00:00.000',3,210.8,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10710','FRANS',1,'1997-10-20 00:00:00.000','1997-11-17 00:00:00.000','1997-10-23 00:00:00.000',1,4.98,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO orders  Values ('10711','SAVEA',5,'1997-10-21 00:00:00.000','1997-12-02 00:00:00.000','1997-10-29 00:00:00.000',2,52.41,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10712','HUNGO',3,'1997-10-21 00:00:00.000','1997-11-18 00:00:00.000','1997-10-31 00:00:00.000',1,89.93,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10713','SAVEA',1,'1997-10-22 00:00:00.000','1997-11-19 00:00:00.000','1997-10-24 00:00:00.000',1,167.05,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10714','SAVEA',5,'1997-10-22 00:00:00.000','1997-11-19 00:00:00.000','1997-10-27 00:00:00.000',3,24.49,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10715','BONAP',3,'1997-10-23 00:00:00.000','1997-11-06 00:00:00.000','1997-10-29 00:00:00.000',1,63.2,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10716','RANCH',4,'1997-10-24 00:00:00.000','1997-11-21 00:00:00.000','1997-10-27 00:00:00.000',2,22.57,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO orders  Values ('10717','FRANK',1,'1997-10-24 00:00:00.000','1997-11-21 00:00:00.000','1997-10-29 00:00:00.000',2,59.25,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10718','KOENE',1,'1997-10-27 00:00:00.000','1997-11-24 00:00:00.000','1997-10-29 00:00:00.000',3,170.88,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10719','LETSS',8,'1997-10-27 00:00:00.000','1997-11-24 00:00:00.000','1997-11-05 00:00:00.000',2,51.44,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO orders  Values ('10720','QUEDE',8,'1997-10-28 00:00:00.000','1997-11-11 00:00:00.000','1997-11-05 00:00:00.000',2,9.53,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10721','QUICK',5,'1997-10-29 00:00:00.000','1997-11-26 00:00:00.000','1997-10-31 00:00:00.000',3,48.92,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10722','SAVEA',8,'1997-10-29 00:00:00.000','1997-12-10 00:00:00.000','1997-11-04 00:00:00.000',1,74.58,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10723','WHITC',3,'1997-10-30 00:00:00.000','1997-11-27 00:00:00.000','1997-11-25 00:00:00.000',1,21.72,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10724','MEREP',8,'1997-10-30 00:00:00.000','1997-12-11 00:00:00.000','1997-11-05 00:00:00.000',2,57.75,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO orders  Values ('10725','FAMIA',4,'1997-10-31 00:00:00.000','1997-11-28 00:00:00.000','1997-11-05 00:00:00.000',3,10.83,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO orders  Values ('10726','EASTC',4,'1997-11-03 00:00:00.000','1997-11-17 00:00:00.000','1997-12-05 00:00:00.000',1,16.56,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO orders  Values ('10727','REGGC',2,'1997-11-03 00:00:00.000','1997-12-01 00:00:00.000','1997-12-05 00:00:00.000',1,89.9,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO orders  Values ('10728','QUEEN',4,'1997-11-04 00:00:00.000','1997-12-02 00:00:00.000','1997-11-11 00:00:00.000',2,58.33,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10729','LINOD',8,'1997-11-04 00:00:00.000','1997-12-16 00:00:00.000','1997-11-14 00:00:00.000',3,141.06,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO orders  Values ('10730','BONAP',5,'1997-11-05 00:00:00.000','1997-12-03 00:00:00.000','1997-11-14 00:00:00.000',1,20.12,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10731','CHOPS',7,'1997-11-06 00:00:00.000','1997-12-04 00:00:00.000','1997-11-14 00:00:00.000',1,96.65,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO orders  Values ('10732','BONAP',3,'1997-11-06 00:00:00.000','1997-12-04 00:00:00.000','1997-11-07 00:00:00.000',1,16.97,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10733','BERGS',1,'1997-11-07 00:00:00.000','1997-12-05 00:00:00.000','1997-11-10 00:00:00.000',3,110.11,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10734','GOURL',2,'1997-11-07 00:00:00.000','1997-12-05 00:00:00.000','1997-11-12 00:00:00.000',3,1.63,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10735','LETSS',6,'1997-11-10 00:00:00.000','1997-12-08 00:00:00.000','1997-11-21 00:00:00.000',2,45.97,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO orders  Values ('10736','HUNGO',9,'1997-11-11 00:00:00.000','1997-12-09 00:00:00.000','1997-11-21 00:00:00.000',2,44.1,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO orders  Values ('10737','VINET',2,'1997-11-11 00:00:00.000','1997-12-09 00:00:00.000','1997-11-18 00:00:00.000',2,7.79,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO orders  Values ('10738','SPECD',2,'1997-11-12 00:00:00.000','1997-12-10 00:00:00.000','1997-11-18 00:00:00.000',1,2.91,'Spcialits du monde','25, rue Lauriston','Paris',NULL,'75016','France');
INSERT INTO orders  Values ('10739','VINET',3,'1997-11-12 00:00:00.000','1997-12-10 00:00:00.000','1997-11-17 00:00:00.000',3,11.08,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO orders  Values ('10740','WHITC',4,'1997-11-13 00:00:00.000','1997-12-11 00:00:00.000','1997-11-25 00:00:00.000',2,81.88,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO orders  Values ('10741','AROUT',4,'1997-11-14 00:00:00.000','1997-11-28 00:00:00.000','1997-11-18 00:00:00.000',3,10.96,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10742','BOTTM',3,'1997-11-14 00:00:00.000','1997-12-12 00:00:00.000','1997-11-18 00:00:00.000',3,243.73,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO orders  Values ('10743','AROUT',1,'1997-11-17 00:00:00.000','1997-12-15 00:00:00.000','1997-11-21 00:00:00.000',2,23.72,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10744','VAFFE',6,'1997-11-17 00:00:00.000','1997-12-15 00:00:00.000','1997-11-24 00:00:00.000',1,69.19,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10745','QUICK',9,'1997-11-18 00:00:00.000','1997-12-16 00:00:00.000','1997-11-27 00:00:00.000',1,3.52,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10746','CHOPS',1,'1997-11-19 00:00:00.000','1997-12-17 00:00:00.000','1997-11-21 00:00:00.000',3,31.43,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO orders  Values ('10747','PICCO',6,'1997-11-19 00:00:00.000','1997-12-17 00:00:00.000','1997-11-26 00:00:00.000',1,117.33,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO orders  Values ('10748','SAVEA',3,'1997-11-20 00:00:00.000','1997-12-18 00:00:00.000','1997-11-28 00:00:00.000',1,232.55,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10749','ISLAT',4,'1997-11-20 00:00:00.000','1997-12-18 00:00:00.000','1997-12-19 00:00:00.000',2,61.53,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10750','WARTH',9,'1997-11-21 00:00:00.000','1997-12-19 00:00:00.000','1997-11-24 00:00:00.000',1,79.3,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10751','RICSU',3,'1997-11-24 00:00:00.000','1997-12-22 00:00:00.000','1997-12-03 00:00:00.000',3,130.79,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO orders  Values ('10752','NORTS',2,'1997-11-24 00:00:00.000','1997-12-22 00:00:00.000','1997-11-28 00:00:00.000',3,1.39,'North/South','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK');
INSERT INTO orders  Values ('10753','FRANS',3,'1997-11-25 00:00:00.000','1997-12-23 00:00:00.000','1997-11-27 00:00:00.000',1,7.7,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO orders  Values ('10754','MAGAA',6,'1997-11-25 00:00:00.000','1997-12-23 00:00:00.000','1997-11-27 00:00:00.000',3,2.38,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10755','BONAP',4,'1997-11-26 00:00:00.000','1997-12-24 00:00:00.000','1997-11-28 00:00:00.000',2,16.71,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO orders  Values ('10756','SPLIR',8,'1997-11-27 00:00:00.000','1997-12-25 00:00:00.000','1997-12-02 00:00:00.000',2,73.21,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO orders  Values ('10757','SAVEA',6,'1997-11-27 00:00:00.000','1997-12-25 00:00:00.000','1997-12-15 00:00:00.000',1,8.19,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO orders  Values ('10758','RICSU',3,'1997-11-28 00:00:00.000','1997-12-26 00:00:00.000','1997-12-04 00:00:00.000',3,138.17,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO orders  Values ('10759','ANATR',3,'1997-11-28 00:00:00.000','1997-12-26 00:00:00.000','1997-12-12 00:00:00.000',3,11.99,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO orders  Values ('10760','MAISD',4,'1997-12-01 00:00:00.000','1997-12-29 00:00:00.000','1997-12-10 00:00:00.000',1,155.64,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO orders  Values ('10761','RATTC',5,'1997-12-02 00:00:00.000','1997-12-30 00:00:00.000','1997-12-08 00:00:00.000',2,18.66,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO orders  Values ('10762','FOLKO',3,'1997-12-02 00:00:00.000','1997-12-30 00:00:00.000','1997-12-09 00:00:00.000',1,328.74,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10763','FOLIG',3,'1997-12-03 00:00:00.000','1997-12-31 00:00:00.000','1997-12-08 00:00:00.000',3,37.35,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO orders  Values ('10764','ERNSH',6,'1997-12-03 00:00:00.000','1997-12-31 00:00:00.000','1997-12-08 00:00:00.000',3,145.45,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10765','QUICK',3,'1997-12-04 00:00:00.000','1998-01-01 00:00:00.000','1997-12-09 00:00:00.000',3,42.74,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10766','OTTIK',4,'1997-12-05 00:00:00.000','1998-01-02 00:00:00.000','1997-12-09 00:00:00.000',1,157.55,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO orders  Values ('10767','SUPRD',4,'1997-12-05 00:00:00.000','1998-01-02 00:00:00.000','1997-12-15 00:00:00.000',3,1.59,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO orders  Values ('10768','AROUT',3,'1997-12-08 00:00:00.000','1998-01-05 00:00:00.000','1997-12-15 00:00:00.000',2,146.32,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10769','VAFFE',3,'1997-12-08 00:00:00.000','1998-01-05 00:00:00.000','1997-12-12 00:00:00.000',1,65.06,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO orders  Values ('10770','HANAR',8,'1997-12-09 00:00:00.000','1998-01-06 00:00:00.000','1997-12-17 00:00:00.000',3,5.32,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10771','ERNSH',9,'1997-12-10 00:00:00.000','1998-01-07 00:00:00.000','1998-01-02 00:00:00.000',2,11.19,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10772','LEHMS',3,'1997-12-10 00:00:00.000','1998-01-07 00:00:00.000','1997-12-19 00:00:00.000',2,91.28,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO orders  Values ('10773','ERNSH',1,'1997-12-11 00:00:00.000','1998-01-08 00:00:00.000','1997-12-16 00:00:00.000',3,96.43,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10774','FOLKO',4,'1997-12-11 00:00:00.000','1997-12-25 00:00:00.000','1997-12-12 00:00:00.000',1,48.2,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO orders  Values ('10775','THECR',7,'1997-12-12 00:00:00.000','1998-01-09 00:00:00.000','1997-12-26 00:00:00.000',1,20.25,'The Cracker Box','55 Grizzly Peak Rd.','Butte','MT','59801','USA');
INSERT INTO orders  Values ('10776','ERNSH',1,'1997-12-15 00:00:00.000','1998-01-12 00:00:00.000','1997-12-18 00:00:00.000',3,351.53,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10777','GOURL',7,'1997-12-15 00:00:00.000','1997-12-29 00:00:00.000','1998-01-21 00:00:00.000',2,3.01,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10778','BERGS',3,'1997-12-16 00:00:00.000','1998-01-13 00:00:00.000','1997-12-24 00:00:00.000',1,6.79,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO orders  Values ('10779','MORGK',3,'1997-12-16 00:00:00.000','1998-01-13 00:00:00.000','1998-01-14 00:00:00.000',2,58.13,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO orders  Values ('10780','LILAS',2,'1997-12-16 00:00:00.000','1997-12-30 00:00:00.000','1997-12-25 00:00:00.000',1,42.13,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO orders  Values ('10781','WARTH',2,'1997-12-17 00:00:00.000','1998-01-14 00:00:00.000','1997-12-19 00:00:00.000',3,73.16,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO orders  Values ('10782','CACTU',9,'1997-12-17 00:00:00.000','1998-01-14 00:00:00.000','1997-12-22 00:00:00.000',3,1.1,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO orders  Values ('10783','HANAR',4,'1997-12-18 00:00:00.000','1998-01-15 00:00:00.000','1997-12-19 00:00:00.000',2,124.98,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO orders  Values ('10784','MAGAA',4,'1997-12-18 00:00:00.000','1998-01-15 00:00:00.000','1997-12-22 00:00:00.000',3,70.09,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO orders  Values ('10785','GROSR',1,'1997-12-18 00:00:00.000','1998-01-15 00:00:00.000','1997-12-24 00:00:00.000',3,1.51,'GROSELLA-Restaurante','5 Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela');
INSERT INTO orders  Values ('10786','QUEEN',8,'1997-12-19 00:00:00.000','1998-01-16 00:00:00.000','1997-12-23 00:00:00.000',1,110.87,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO orders  Values ('10787','LAMAI',2,'1997-12-19 00:00:00.000','1998-01-02 00:00:00.000','1997-12-26 00:00:00.000',1,249.93,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO orders  Values ('10788','QUICK',1,'1997-12-22 00:00:00.000','1998-01-19 00:00:00.000','1998-01-19 00:00:00.000',2,42.7,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO orders  Values ('10789','FOLIG',1,'1997-12-22 00:00:00.000','1998-01-19 00:00:00.000','1997-12-31 00:00:00.000',2,100.6,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO orders  Values ('10790','GOURL',6,'1997-12-22 00:00:00.000','1998-01-19 00:00:00.000','1997-12-26 00:00:00.000',1,28.23,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO orders  Values ('10791','FRANK',6,'1997-12-23 00:00:00.000','1998-01-20 00:00:00.000','1998-01-01 00:00:00.000',2,16.85,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO orders  Values ('10792','WOLZA',1,'1997-12-23 00:00:00.000','1998-01-20 00:00:00.000','1997-12-31 00:00:00.000',3,23.79,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO orders  Values ('10793','AROUT',3,'1997-12-24 00:00:00.000','1998-01-21 00:00:00.000','1998-01-08 00:00:00.000',3,4.52,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO orders  Values ('10794','QUEDE',6,'1997-12-24 00:00:00.000','1998-01-21 00:00:00.000','1998-01-02 00:00:00.000',1,21.49,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO orders  Values ('10795','ERNSH',8,'1997-12-24 00:00:00.000','1998-01-21 00:00:00.000','1998-01-20 00:00:00.000',2,126.66,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO orders  Values ('10796','HILAA',3,'1997-12-25 00:00:00.000','1998-01-22 00:00:00.000','1998-01-14 00:00:00.000',1,26.52,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO orders  Values ('10797','DRACD',7,'1997-12-25 00:00:00.000','1998-01-22 00:00:00.000','1998-01-05 00:00:00.000',2,33.35,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO orders  Values ('10798','ISLAT',2,'1997-12-26 00:00:00.000','1998-01-23 00:00:00.000','1998-01-05 00:00:00.000',1,2.33,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO orders  Values ('10799','KOENE',9,'1997-12-26 00:00:00.000','1998-02-06 00:00:00.000','1998-01-05 00:00:00.000',3,30.76,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO orders  Values ('10800','SEVES',1,'1997-12-26 00:00:00.000','1998-01-23 00:00:00.000','1998-01-05 00:00:00.000',3,137.44,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');

-- ---------------------------------------------------------------------- --
-- Add info into "order_details"                                          -- -- ---------------------------------------------------------------------- --

INSERT INTO order_details Values (10248, 11, 14, 12);
INSERT INTO order_details Values (10248, 42, 9.8, 10);
INSERT INTO order_details Values (10248, 72, 34.8, 5);
INSERT INTO order_details Values (10249, 14, 18.6, 9);
INSERT INTO order_details Values (10249, 51, 42.4, 40);
INSERT INTO order_details Values (10250, 41, 7.7, 10);
INSERT INTO order_details Values (10250, 51, 42.4, 35);
INSERT INTO order_details Values (10250, 65, 16.8, 15);
INSERT INTO order_details Values (10251, 22, 16.8, 6);
INSERT INTO order_details Values (10251, 57, 15.6, 15);
INSERT INTO order_details Values (10251, 65, 16.8, 20);
INSERT INTO order_details Values (10252, 20, 64.8, 40);
INSERT INTO order_details Values (10252, 33, 2, 25);
INSERT INTO order_details Values (10252, 60, 27.2, 40);
INSERT INTO order_details Values (10253, 31, 10, 20);
INSERT INTO order_details Values (10253, 39, 14.4, 42);
INSERT INTO order_details Values (10253, 49, 16, 40);
INSERT INTO order_details Values (10254, 24, 3.6, 15);
INSERT INTO order_details Values (10254, 55, 19.2, 21);
INSERT INTO order_details Values (10254, 74, 8, 21);
INSERT INTO order_details Values (10255, 2, 15.2, 20);
INSERT INTO order_details Values (10255, 16, 13.9, 35);
INSERT INTO order_details Values (10255, 36, 15.2, 25);
INSERT INTO order_details Values (10255, 59, 44, 30);
INSERT INTO order_details Values (10256, 53, 26.2, 15);
INSERT INTO order_details Values (10256, 77, 10.4, 12);
INSERT INTO order_details Values (10257, 27, 35.1, 25);
INSERT INTO order_details Values (10257, 39, 14.4, 6);
INSERT INTO order_details Values (10257, 77, 10.4, 15);
INSERT INTO order_details Values (10258, 5, 17, 65);
INSERT INTO order_details Values (10258, 32, 25.6, 6);
INSERT INTO order_details Values (10259, 21, 8, 10);
INSERT INTO order_details Values (10259, 37, 20.8, 1);
INSERT INTO order_details Values (10260, 41, 7.7, 16);
INSERT INTO order_details Values (10260, 57, 15.6, 50);
INSERT INTO order_details Values (10260, 62, 39.4, 15);
INSERT INTO order_details Values (10261, 21, 8, 20);
INSERT INTO order_details Values (10261, 35, 14.4, 20);
INSERT INTO order_details Values (10262, 5, 17, 12);
INSERT INTO order_details Values (10262, 7, 24, 15);
INSERT INTO order_details Values (10262, 56, 30.4, 2);
INSERT INTO order_details Values (10263, 16, 13.9, 60);
INSERT INTO order_details Values (10263, 24, 3.6, 28);
INSERT INTO order_details Values (10263, 74, 8, 36);
INSERT INTO order_details Values (10264, 2, 15.2, 35);
INSERT INTO order_details Values (10264, 41, 7.7, 25);
INSERT INTO order_details Values (10265, 17, 31.2, 30);
INSERT INTO order_details Values (10265, 70, 12, 20);
INSERT INTO order_details Values (10266, 12, 30.4, 12);
INSERT INTO order_details Values (10267, 40, 14.7, 50);
INSERT INTO order_details Values (10267, 59, 44, 70);
INSERT INTO order_details Values (10267, 76, 14.4, 15);
INSERT INTO order_details Values (10268, 29, 99, 10);
INSERT INTO order_details Values (10268, 72, 27.8, 4);
INSERT INTO order_details Values (10269, 33, 2, 60);
INSERT INTO order_details Values (10269, 72, 27.8, 20);
INSERT INTO order_details Values (10270, 36, 15.2, 30);
INSERT INTO order_details Values (10270, 43, 36.8, 25);
INSERT INTO order_details Values (10271, 33, 2, 24);
INSERT INTO order_details Values (10272, 20, 64.8, 6);
INSERT INTO order_details Values (10272, 31, 10, 40);
INSERT INTO order_details Values (10272, 72, 27.8, 24);
INSERT INTO order_details Values (10273, 10, 24.8, 24);
INSERT INTO order_details Values (10273, 31, 10, 15);
INSERT INTO order_details Values (10273, 33, 2, 20);
INSERT INTO order_details Values (10273, 40, 14.7, 60);
INSERT INTO order_details Values (10273, 76, 14.4, 33);
INSERT INTO order_details Values (10274, 71, 17.2, 20);
INSERT INTO order_details Values (10274, 72, 27.8, 7);
INSERT INTO order_details Values (10275, 24, 3.6, 12);
INSERT INTO order_details Values (10275, 59, 44, 6);
INSERT INTO order_details Values (10276, 10, 24.8, 15);
INSERT INTO order_details Values (10276, 13, 4.8, 10);
INSERT INTO order_details Values (10277, 28, 36.4, 20);
INSERT INTO order_details Values (10277, 62, 39.4, 12);
INSERT INTO order_details Values (10278, 44, 15.5, 16);
INSERT INTO order_details Values (10278, 59, 44, 15);
INSERT INTO order_details Values (10278, 63, 35.1, 8);
INSERT INTO order_details Values (10278, 73, 12, 25);
INSERT INTO order_details Values (10279, 17, 31.2, 15);
INSERT INTO order_details Values (10280, 24, 3.6, 12);
INSERT INTO order_details Values (10280, 55, 19.2, 20);
INSERT INTO order_details Values (10280, 75, 6.2, 30);
INSERT INTO order_details Values (10281, 19, 7.3, 1);
INSERT INTO order_details Values (10281, 24, 3.6, 6);
INSERT INTO order_details Values (10281, 35, 14.4, 4);
INSERT INTO order_details Values (10282, 30, 20.7, 6);
INSERT INTO order_details Values (10282, 57, 15.6, 2);
INSERT INTO order_details Values (10283, 15, 12.4, 20);
INSERT INTO order_details Values (10283, 19, 7.3, 18);
INSERT INTO order_details Values (10283, 60, 27.2, 35);
INSERT INTO order_details Values (10283, 72, 27.8, 3);
INSERT INTO order_details Values (10284, 27, 35.1, 15);
INSERT INTO order_details Values (10284, 44, 15.5, 21);
INSERT INTO order_details Values (10284, 60, 27.2, 20);
INSERT INTO order_details Values (10284, 67, 11.2, 5);
INSERT INTO order_details Values (10285, 1, 14.4, 45);
INSERT INTO order_details Values (10285, 40, 14.7, 40);
INSERT INTO order_details Values (10285, 53, 26.2, 36);
INSERT INTO order_details Values (10286, 35, 14.4, 100);
INSERT INTO order_details Values (10286, 62, 39.4, 40);
INSERT INTO order_details Values (10287, 16, 13.9, 40);
INSERT INTO order_details Values (10287, 34, 11.2, 20);
INSERT INTO order_details Values (10287, 46, 9.6, 15);
INSERT INTO order_details Values (10288, 54, 5.9, 10);
INSERT INTO order_details Values (10288, 68, 10, 3);
INSERT INTO order_details Values (10289, 3, 8, 30);
INSERT INTO order_details Values (10289, 64, 26.6, 9);
INSERT INTO order_details Values (10290, 5, 17, 20);
INSERT INTO order_details Values (10290, 29, 99, 15);
INSERT INTO order_details Values (10290, 49, 16, 15);
INSERT INTO order_details Values (10290, 77, 10.4, 10);
INSERT INTO order_details Values (10291, 13, 4.8, 20);
INSERT INTO order_details Values (10291, 44, 15.5, 24);
INSERT INTO order_details Values (10291, 51, 42.4, 2);
INSERT INTO order_details Values (10292, 20, 64.8, 20);
INSERT INTO order_details Values (10293, 18, 50, 12);
INSERT INTO order_details Values (10293, 24, 3.6, 10);
INSERT INTO order_details Values (10293, 63, 35.1, 5);
INSERT INTO order_details Values (10293, 75, 6.2, 6);
INSERT INTO order_details Values (10294, 1, 14.4, 18);
INSERT INTO order_details Values (10294, 17, 31.2, 15);
INSERT INTO order_details Values (10294, 43, 36.8, 15);
INSERT INTO order_details Values (10294, 60, 27.2, 21);
INSERT INTO order_details Values (10294, 75, 6.2, 6);
INSERT INTO order_details Values (10295, 56, 30.4, 4);
INSERT INTO order_details Values (10296, 11, 16.8, 12);
INSERT INTO order_details Values (10296, 16, 13.9, 30);
INSERT INTO order_details Values (10296, 69, 28.8, 15);
INSERT INTO order_details Values (10297, 39, 14.4, 60);
INSERT INTO order_details Values (10297, 72, 27.8, 20);
INSERT INTO order_details Values (10298, 2, 15.2, 40);
INSERT INTO order_details Values (10298, 36, 15.2, 40);
INSERT INTO order_details Values (10298, 59, 44, 30);
INSERT INTO order_details Values (10298, 62, 39.4, 15);
INSERT INTO order_details Values (10299, 19, 7.3, 15);
INSERT INTO order_details Values (10299, 70, 12, 20);
INSERT INTO order_details Values (10300, 66, 13.6, 30);
INSERT INTO order_details Values (10300, 68, 10, 20);
INSERT INTO order_details Values (10301, 40, 14.7, 10);
INSERT INTO order_details Values (10301, 56, 30.4, 20);
INSERT INTO order_details Values (10302, 17, 31.2, 40);
INSERT INTO order_details Values (10302, 28, 36.4, 28);
INSERT INTO order_details Values (10302, 43, 36.8, 12);
INSERT INTO order_details Values (10303, 40, 14.7, 40);
INSERT INTO order_details Values (10303, 65, 16.8, 30);
INSERT INTO order_details Values (10303, 68, 10, 15);
INSERT INTO order_details Values (10304, 49, 16, 30);
INSERT INTO order_details Values (10304, 59, 44, 10);
INSERT INTO order_details Values (10304, 71, 17.2, 2);
INSERT INTO order_details Values (10305, 18, 50, 25);
INSERT INTO order_details Values (10305, 29, 99, 25);
INSERT INTO order_details Values (10305, 39, 14.4, 30);
INSERT INTO order_details Values (10306, 30, 20.7, 10);
INSERT INTO order_details Values (10306, 53, 26.2, 10);
INSERT INTO order_details Values (10306, 54, 5.9, 5);
INSERT INTO order_details Values (10307, 62, 39.4, 10);
INSERT INTO order_details Values (10307, 68, 10, 3);
INSERT INTO order_details Values (10308, 69, 28.8, 1);
INSERT INTO order_details Values (10308, 70, 12, 5);
INSERT INTO order_details Values (10309, 4, 17.6, 20);
INSERT INTO order_details Values (10309, 6, 20, 30);
INSERT INTO order_details Values (10309, 42, 11.2, 2);
INSERT INTO order_details Values (10309, 43, 36.8, 20);
INSERT INTO order_details Values (10309, 71, 17.2, 3);
INSERT INTO order_details Values (10310, 16, 13.9, 10);
INSERT INTO order_details Values (10310, 62, 39.4, 5);
INSERT INTO order_details Values (10311, 42, 11.2, 6);
INSERT INTO order_details Values (10311, 69, 28.8, 7);
INSERT INTO order_details Values (10312, 28, 36.4, 4);
INSERT INTO order_details Values (10312, 43, 36.8, 24);
INSERT INTO order_details Values (10312, 53, 26.2, 20);
INSERT INTO order_details Values (10312, 75, 6.2, 10);
INSERT INTO order_details Values (10313, 36, 15.2, 12);
INSERT INTO order_details Values (10314, 32, 25.6, 40);
INSERT INTO order_details Values (10314, 58, 10.6, 30);
INSERT INTO order_details Values (10314, 62, 39.4, 25);
INSERT INTO order_details Values (10315, 34, 11.2, 14);
INSERT INTO order_details Values (10315, 70, 12, 30);
INSERT INTO order_details Values (10316, 41, 7.7, 10);
INSERT INTO order_details Values (10316, 62, 39.4, 70);
INSERT INTO order_details Values (10317, 1, 14.4, 20);
INSERT INTO order_details Values (10318, 41, 7.7, 20);
INSERT INTO order_details Values (10318, 76, 14.4, 6);
INSERT INTO order_details Values (10319, 17, 31.2, 8);
INSERT INTO order_details Values (10319, 28, 36.4, 14);
INSERT INTO order_details Values (10319, 76, 14.4, 30);
INSERT INTO order_details Values (10320, 71, 17.2, 30);
INSERT INTO order_details Values (10321, 35, 14.4, 10);
INSERT INTO order_details Values (10322, 52, 5.6, 20);
INSERT INTO order_details Values (10323, 15, 12.4, 5);
INSERT INTO order_details Values (10323, 25, 11.2, 4);
INSERT INTO order_details Values (10323, 39, 14.4, 4);
INSERT INTO order_details Values (10324, 16, 13.9, 21);
INSERT INTO order_details Values (10324, 35, 14.4, 70);
INSERT INTO order_details Values (10324, 46, 9.6, 30);
INSERT INTO order_details Values (10324, 59, 44, 40);
INSERT INTO order_details Values (10324, 63, 35.1, 80);
INSERT INTO order_details Values (10325, 6, 20, 6);
INSERT INTO order_details Values (10325, 13, 4.8, 12);
INSERT INTO order_details Values (10325, 14, 18.6, 9);
INSERT INTO order_details Values (10325, 31, 10, 4);
INSERT INTO order_details Values (10325, 72, 27.8, 40);
INSERT INTO order_details Values (10326, 4, 17.6, 24);
INSERT INTO order_details Values (10326, 57, 15.6, 16);
INSERT INTO order_details Values (10326, 75, 6.2, 50);
INSERT INTO order_details Values (10327, 2, 15.2, 25);
INSERT INTO order_details Values (10327, 11, 16.8, 50);
INSERT INTO order_details Values (10327, 30, 20.7, 35);
INSERT INTO order_details Values (10327, 58, 10.6, 30);
INSERT INTO order_details Values (10328, 59, 44, 9);
INSERT INTO order_details Values (10328, 65, 16.8, 40);
INSERT INTO order_details Values (10328, 68, 10, 10);
INSERT INTO order_details Values (10329, 19, 7.3, 10);
INSERT INTO order_details Values (10329, 30, 20.7, 8);
INSERT INTO order_details Values (10329, 38, 210.8, 20);
INSERT INTO order_details Values (10329, 56, 30.4, 12);
INSERT INTO order_details Values (10330, 26, 24.9, 50);
INSERT INTO order_details Values (10330, 72, 27.8, 25);
INSERT INTO order_details Values (10331, 54, 5.9, 15);
INSERT INTO order_details Values (10332, 18, 50, 40);
INSERT INTO order_details Values (10332, 42, 11.2, 10);
INSERT INTO order_details Values (10332, 47, 7.6, 16);
INSERT INTO order_details Values (10333, 14, 18.6, 10);
INSERT INTO order_details Values (10333, 21, 8, 10);
INSERT INTO order_details Values (10333, 71, 17.2, 40);
INSERT INTO order_details Values (10334, 52, 5.6, 8);
INSERT INTO order_details Values (10342, 36, 15.2, 40);
INSERT INTO order_details Values (10342, 55, 19.2, 40);
INSERT INTO order_details Values (10343, 64, 26.6, 50);
INSERT INTO order_details Values (10343, 68, 10, 4);
INSERT INTO order_details Values (10343, 76, 14.4, 15);
INSERT INTO order_details Values (10344, 4, 17.6, 35);
INSERT INTO order_details Values (10344, 8, 32, 70);
INSERT INTO order_details Values (10345, 8, 32, 70);
INSERT INTO order_details Values (10345, 19, 7.3, 80);
INSERT INTO order_details Values (10345, 42, 11.2, 9);
INSERT INTO order_details Values (10346, 17, 31.2, 36);
INSERT INTO order_details Values (10346, 56, 30.4, 20);
INSERT INTO order_details Values (10347, 25, 11.2, 10);
INSERT INTO order_details Values (10347, 39, 14.4, 50);
INSERT INTO order_details Values (10347, 40, 14.7, 4);
INSERT INTO order_details Values (10347, 75, 6.2, 6);
INSERT INTO order_details Values (10348, 1, 14.4, 15);
INSERT INTO order_details Values (10348, 23, 7.2, 25);
INSERT INTO order_details Values (10349, 54, 5.9, 24);
INSERT INTO order_details Values (10350, 50, 13, 15);
INSERT INTO order_details Values (10350, 69, 28.8, 18);
INSERT INTO order_details Values (10351, 38, 210.8, 20);
INSERT INTO order_details Values (10351, 41, 7.7, 13);
INSERT INTO order_details Values (10351, 44, 15.5, 77);
INSERT INTO order_details Values (10351, 65, 16.8, 10);
INSERT INTO order_details Values (10359, 31, 10, 70);
INSERT INTO order_details Values (10359, 60, 27.2, 80);
INSERT INTO order_details Values (10360, 28, 36.4, 30);
INSERT INTO order_details Values (10360, 29, 99, 35);
INSERT INTO order_details Values (10360, 38, 210.8, 10);
INSERT INTO order_details Values (10360, 49, 16, 35);
INSERT INTO order_details Values (10360, 54, 5.9, 28);
INSERT INTO order_details Values (10361, 39, 14.4, 54);
INSERT INTO order_details Values (10361, 60, 27.2, 55);
INSERT INTO order_details Values (10362, 25, 11.2, 50);
INSERT INTO order_details Values (10362, 51, 42.4, 20);
INSERT INTO order_details Values (10362, 54, 5.9, 24);
INSERT INTO order_details Values (10363, 31, 10, 20);
INSERT INTO order_details Values (10363, 75, 6.2, 12);
INSERT INTO order_details Values (10363, 76, 14.4, 12);
INSERT INTO order_details Values (10364, 69, 28.8, 30);
INSERT INTO order_details Values (10364, 71, 17.2, 5);
INSERT INTO order_details Values (10365, 11, 16.8, 24);
INSERT INTO order_details Values (10366, 65, 16.8, 5);
INSERT INTO order_details Values (10366, 77, 10.4, 5);
INSERT INTO order_details Values (10367, 34, 11.2, 36);
INSERT INTO order_details Values (10367, 54, 5.9, 18);
INSERT INTO order_details Values (10367, 65, 16.8, 15);
INSERT INTO order_details Values (10367, 77, 10.4, 7);
INSERT INTO order_details Values (10368, 21, 8, 5);
INSERT INTO order_details Values (10368, 28, 36.4, 13);
INSERT INTO order_details Values (10368, 57, 15.6, 25);
INSERT INTO order_details Values (10368, 64, 26.6, 35);
INSERT INTO order_details Values (10369, 29, 99, 20);
INSERT INTO order_details Values (10369, 56, 30.4, 18);


-- ---------------------------------------------------------------------- --
-- Add info into "products"                                               -- -- ---------------------------------------------------------------------- --

INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(1, 'Chai', 1, 1, '10 boxes x 20 bags', 18, 39, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 15.5, 39, 0, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.45, 29, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.2, 25, 0, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(22, 'Gustaf''s Knckebrd', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(23, 'Tunnbrd', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(24, 'Guaran Fantstica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(25, 'NuNuCa Nu-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(26, 'Gumbr Gummibrchen', 11, 3, '100 - 250 g bags', 31.23, 15, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9, 49, 0, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(28, 'Rssle Sauerkraut', 12, 7, '25 - 825 g cans', 45.6, 26, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(29, 'Thringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.79, 0, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.89, 10, 0, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(33, 'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(36, 'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(38, 'Cte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.4, 123, 0, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.65, 85, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.45, 27, 0, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(45, 'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(46, 'Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(48, 'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(53, 'Perth Pasties', 24, 6, '48 pieces', 32.8, 0, 0, 0, true);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(54, 'Tourtire', 25, 6, '16 pies', 7.45, 21, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(55, 'Pt chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(61, 'Sirop d''rable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(62, 'Tarte au sucre', 29, 3, '48 pies', 49.3, 17, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.9, 24, 0, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(64, 'Wimmers gute Semmelkndel', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.05, 76, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(71, 'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.8, 14, 0, 0, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(73, 'Rd Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(75, 'Rhnbru Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(76, 'Lakkalikri', 23, 1, '500 ml', 18, 57, 0, 20, false);
INSERT INTO products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES(77, 'Original Frankfurter grne Soe', 12, 2, '12 boxes', 13, 32, 0, 15, false);

-- ---------------------------------------------------------------------- --
-- Add info into "shippers"                                               -- -- ---------------------------------------------------------------------- --

INSERT INTO shippers (shipper_id, company_name, phone)
VALUES(1, 'Speedy Express', '(503) 555-9831');
INSERT INTO shippers (shipper_id, company_name, phone)
VALUES(2, 'United Package', '(503) 555-3199');
INSERT INTO shippers (shipper_id, company_name, phone)
VALUES(3, 'Federal Shipping', '(503) 555-9931');

-- ---------------------------------------------------------------------- --
-- Add info into "suppliers"                                              -- -- ---------------------------------------------------------------------- --

INSERT INTO suppliers VALUES(1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gilbert St.','London',NULL,'EC1 4SD','UK','(171) 555-2222',NULL);
INSERT INTO suppliers VALUES(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822',NULL);
INSERT INTO suppliers VALUES(3,'Grandma Kelly''s Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735','(313) 555-3349');
INSERT INTO suppliers VALUES(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager','9-8 Sekimai
Musashino-shi','Tokyo',NULL,'100','Japan','(03) 3555-5011',NULL);
INSERT INTO suppliers VALUES(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra ','Export Administrator','Calle del Rosal 4','Oviedo','Asturias','33007','Spain','(98) 598 76 54',NULL);
INSERT INTO suppliers VALUES(6,'Mayumi''s','Mayumi Ohno','Marketing Representative','92 Setsuko
Chuo-ku','Osaka',NULL,'545','Japan','(06) 431-7877',NULL);
INSERT INTO suppliers VALUES(7,'Pavlova, Ltd.','Ian Devling','Marketing Manager','74 Rose St.
Moonie Ponds','Melbourne','Victoria','3058','Australia','(03) 444-2343','(03) 444-6588');
INSERT INTO suppliers VALUES(8,'Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative','29 King''s Way','Manchester',NULL,'M14 GSD','UK','(161) 555-4448',NULL);
INSERT INTO suppliers VALUES(9,'PB Knckebrd AB','Lars Peterson','Sales Agent','Kaloadagatan 13','Gteborg',NULL,'S-345 67','Sweden ','031-987 65 43','031-987 65 91');
INSERT INTO suppliers VALUES(10,'Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager','Av. das Americanas 12.890','So Paulo',NULL,'5442','Brazil','(11) 555 4640',NULL);
INSERT INTO suppliers VALUES(11,'Heli Swaren GmbH & Co. KG','Petra Winkler','Sales Manager','Tiergartenstrae 5','Berlin',NULL,'10785','Germany','(010) 9984510',NULL);
INSERT INTO suppliers VALUES(12,'Plutzer Lebensmittelgromrkte AG','Martin Bein','International Marketing Mgr.','Bogenallee 51','Frankfurt',NULL,'60439','Germany','(069) 992755',NULL);
INSERT INTO suppliers VALUES(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coordinator Foreign Markets','Frahmredder 112a','Cuxhaven',NULL,'27478','Germany','(04721) 8713','(04721) 8714');
INSERT INTO suppliers VALUES(14,'Formaggi Fortini s.r.l.','Elio Rossi','Sales Representative','Viale Dante, 75','Ravenna',NULL,'48100','Italy','(0544) 60323','(0544) 60603');
INSERT INTO suppliers VALUES(15,'Norske Meierier','Beate Vileid','Marketing Manager','Hatlevegen 5','Sandvika',NULL,'1320','Norway','(0)2-953010',NULL);
INSERT INTO suppliers VALUES(16,'Bigfoot Breweries','Cheryl Saylor','regional Account Rep.','3400 - 8th Avenue
Suite 210','Bend','OR','97101','USA','(503) 555-9931',NULL);
INSERT INTO suppliers VALUES(17,'Svensk Sjfda AB','Michael Bjrn','Sales Representative','Brovallavgen 231','Stockholm',NULL,'S-123 45','Sweden','08-123 45 67',NULL);
INSERT INTO suppliers VALUES(18,'Aux joyeux ecclsiastiques','Guylne Nodier','Sales Manager','203, Rue des Francs-Bourgeois','Paris',NULL,'75004','France','(1) 03.83.00.68','(1) 03.83.00.62');
INSERT INTO suppliers VALUES(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent','Order Processing Dept.
2100 Paul Revere Blvd.','Boston','MA','02134','USA','(617) 555-3267','(617) 555-3389');
INSERT INTO suppliers VALUES(20,'Leka Trading','Chandra Leka','Owner','471 Serangoon Loop, Suite #402','Singapore',NULL,'0512','Singapore','555-8787',NULL);
INSERT INTO suppliers VALUES(21,'Lyngbysild','Niels Petersen','Sales Manager','Lyngbysild
Fiskebakken 10','Lyngby',NULL,'2800','Denmark','43844108','43844115');
INSERT INTO suppliers VALUES(22,'Zaanse Snoepfabriek','Dirk Luchte','Accounting Manager','Verkoop
Rijnweg 22','Zaandam',NULL,'9999 ZZ','Netherlands','(12345) 1212','(12345) 1210');
INSERT INTO suppliers VALUES(23,'Karkki Oy','Anne Heikkonen','Product Manager','Valtakatu 12','Lappeenranta',NULL,'53120','Finland','(953) 10956',NULL);
INSERT INTO suppliers VALUES(24,'G''day, Mate','Wendy Mackenzie','Sales Representative','170 Prince Edward Parade
Hunter''s Hill','Sydney','NSW','2042','Australia','(02) 555-5914','(02) 555-4873');
INSERT INTO suppliers VALUES(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager','2960 Rue St. Laurent','Montral','Qubec','H1J 1C3','Canada','(514) 555-9022',NULL);
INSERT INTO suppliers VALUES(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Order Administrator','Via dei Gelsomini, 153','Salerno',NULL,'84100','Italy','(089) 6547665','(089) 6547667');
INSERT INTO suppliers VALUES(27,'Escargots Nouveaux','Marie Delamare','Sales Manager','22, rue H. Voiron','Montceau',NULL,'71300','France','85.57.00.07',NULL);
INSERT INTO suppliers VALUES(28,'Gai pturage','Eliane Noz','Sales Representative','Bat. B
3, rue des Alpes','Annecy',NULL,'74000','France','38.76.98.06','38.76.98.58');
INSERT INTO suppliers VALUES(29,'Forts d''rables','Chantal Goulet','Accounting Manager','148 rue Chasseur','Ste-Hyacinthe','Qubec','J2S 7S8','Canada','(514) 555-2955','(514) 555-2921');