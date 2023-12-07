DROP DATABASE IF EXISTS ARTMUSEUM;
CREATE DATABASE ARTMUSEUM; 
USE ARTMUSEUM;


DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST (
	NAME			varchar(50)	not null,
	DATE_BORN		varchar(20),
	DATE_DIED			varchar(20),
	COUNTRY_OF_ORIGIN	varchar(20),
	Epoch				varchar(20),
	MAIN_STYLE			varchar(20),
	DESCRIPTION			mediumtext,
	primary key (NAME)
);

INSERT INTO ARTIST(NAME, DATE_BORN, DATE_DIED, COUNTRY_OF_ORIGIN, Epoch, MAIN_STYLE, DESCRIPTION)
VALUES
('Hans Holbein the Younger','1497','1543','Germany','Renaissance','Realistic', 'Considered one of the greatest portratists of the 16th century'),
('George Gower','1540','1596','England', 'Renaissance', 'Realistic', 'Serjeant Painter to Queen Elizabeth I'),
('Benedetto da Rovezzano','1474','1554','Italy','Renaissance', 'Realistic', 'Italian architect and sculptor'),
('John Shute',null,'1563','England', 'Renaissance', 'Realistic', 'English ARTIST and architect'),
('Juan Fernández',null,'1657','Spain', 'Post-Renaissance','Realistic', 'Specialized in still life painting'),
('Pablo Picasso','October 25, 1881','April 8, 1973', 'Spain', 'Modern', 'Abstract', 'One of the most influential ARTISTs of the 20th century'),
('Isidore Leroy','1842',null, 'France', 'Modern', 'Pattern', 'French wallpaper house'),
('Robert Pruitt','1975',null, 'American', 'Modern', 'Realistic', 'Known for his figurative drawings'),
('Simone Leigh','1967',null, 'American', 'Modern', 'Abstract', 'American ARTIST concerned with the marginilzation of women of colour'),
('Theaster Gates','1973',null, 'American', 'Modern', 'Abstract', 'American social practice ARTIST'),
('Woody de Othello','1991',null, 'American', 'Modern', 'Abstract', 'American ceramicist and painter'),
('Robert Campin','1375',"April 26, 1444", 'Netherlands', 'Renaissance', 'Realistic', 'First great master of Early Netherlandish painting'),
('Anonymous',null, null, null, null,null,'Used when the ARTIST could not be identified.'),
('Antoine-Louis Barye','September 24, 1795', 'June 25, 1875', 'France', 'Modern','Realistic','Famous for his work as an animalier');

DROP TABLE IF EXISTS EXHIBITION;
CREATE TABLE EXHIBITION (
	NAME			varchar(100)	not null,
	START_DATE			varchar(20),
	END_DATE			varchar(20),
	primary key (NAME)
);

INSERT INTO EXHIBITION(NAME, START_DATE, END_DATE)
VALUES
('The Tudors: Art and Majesty in Renaissance England','October 10, 2022','January 8, 2023'),
('Cubism and the Trompe l''Oeil Tradition','October 20, 2022','January 22, 2023'),
('Hear Me Now: The Black Potters of Old Edgefield, South Carolina','September 9, 2022','February 5, 2023'),
('''MNR'' Works At The Musée du Louvre',null,null),
('Masterpieces of The Louvre',null,null);

DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	ID_NUM					varchar(30)	not null,
	ARTIST				varchar(50),
	YEAR			varchar(10),
    TITLE			varchar(100),
	DESCRIPTION      mediumtext,
	CULTURE          varchar(20),
	Epoch             varchar(20),
	EXHIBITION           varchar(100),
	primary key (ID_NUM),
	foreign key (EXHIBITION) references EXHIBITION(NAME),
	foreign key (ARTIST) references ARTIST(NAME) 
);

INSERT INTO ART_OBJECT (ID_NUM, ARTIST, YEAR, TITLE, DESCRIPTION, CULTURE, Epoch, EXHIBITION)
VALUES
('P_00001','Hans Holbein the Younger','1537','Henry VIII', 'Portrait of Henry VIII', 'England', 'Renaissance', 'The Tudors: Art and Majesty in Renaissance England'),
('P_00002','George Gower','1567','Elizabeth I (The Hampden Portrait)','Portrait of Elizabeth I', 'England', 'Renaissance', 'The Tudors: Art and Majesty in Renaissance England'),
('P_00003','Benedetto da Rovezzano','1524-29','Angel Bearing Candlestick','An angel bearing a candlestick','Italy', 'Renaissance', 'The Tudors: Art and Majesty in Renaissance England'),
('P_00004','Benedetto da Rovezzano','1500','Candelabrum', 'A candelabrum', 'Italy', 'Renaissance', 'The Tudors: Art and Majesty in Renaissance England'),
('P_00005','Hans Holbein the Younger','1533-36','Anne Boleyn', 'Portrait of Anne Boleyn', 'England', 'Renaissance', 'The Tudors: Art and Majesty in Renaissance England'),
('P_00006','John Shute','1563','The First and Chief Groundes of Architecture Used in All the Auncient and Famous Monymentes...','Written Text', 'England', 'Renaissance','The Tudors: Art and Majesty in Renaissance England'),
('P_00007','Juan Fernández','1636','Still Life with Four Bunches of Grapes', 'Still-life painting emerged in the 1600s as a fully independent subject in European art, and grapes and curtains became popular motifs for ARTISTs aiming to vaunt their skills', 'Spain', 'Post-Renaissance', 'Cubism and the Trompe l''Oeil Tradition'),
('P_00008','Pablo Picasso','1912','Still Life with Chair Caning', 'Machine-printed to look like the textured rattan weave used in chairs, this piece of trumpery is MATERIALly real but patently fake.', 'Spain', 'Modern','Cubism and the Trompe l''Oeil Tradition'),
('P_00009','Pablo Picasso','1914','The Absinthe Glass','Picasso''s life-size rendering of a glass of alcohol was shocking for its banality.', 'Spanish', 'Modern', 'Cubism and the Trompe l''Oeil Tradition'),
('P_00010','Isidore Leroy','1908-09','Wallpaper: pattern 15292 R', 'The wallpapers and borders displayed here are similar or identical to those the Cubists used in their collages and pastiched in their paintings.', 'France', 'Modern', 'Cubism and the Trompe l''Oeil Tradition'),
('P_00011','Robert Pruitt','2019','Birth and Rebirth and Rebirth', 'Painting of woman', 'American', 'Modern', 'Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('P_00012','Simone Leigh','2019','108 (Face Jug Series)', 'Abstract painting of woman on mug', 'American', 'Modern', 'Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('P_00013','Simone Leigh','2021-22','Large Jug', 'Abstract mug', 'American', 'Modern', 'Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('P_00014','Theaster Gates','2020','Signature Study', 'Stoneware', 'American', 'Modern', 'Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('P_00015','Woody de Othello','2021','Applying Pressure', 'Vase on Table', 'American', 'Modern', 'Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('P_00016','Robert Campin','1400-1500','Vierge et Enfant', 'Virgin and Child', 'Netherlands', 'Renaissance', '''MNR'' Works At The Musée du Louvre'),
('P_00017','Anonymous','1900-35','Velours à losanges frappés à dominante rouge', 'Velvet with red diamonds', 'Unknown', 'Modern', '''MNR'' Works At The Musée du Louvre'),
('P_00018','Anonymous','1500-1900','Vase hispano-mauresque à quatre anses', 'Hispano-Moorish vase with four handles', 'Spain', 'Renaissance', '''MNR'' Works At The Musée du Louvre'),
('P_00019','Anonymous','525-550','Feuillet de diptyque en cinq parties : l''Empereur triomphant (Justinien?)', 'Diptych folio in five parts: the triumphant Emperor (Justinian?)', 'Constantinopole', 'Middle Ages', 'Masterpieces of The Louvre'),
('P_00020','Anonymous','100-150','portrait de momie ; L''Européenne', 'Portrait of a Mummy', 'Egypt', 'Roman Period', 'Masterpieces of The Louvre'),
('P_00021','Antoine-Louis Barye','1832','Lion au serpent', 'Lion with a snake', 'France', 'Modern', 'Masterpieces of The Louvre');

DROP TABLE IF EXISTS SCULPTURE_STATUE;
CREATE TABLE SCULPTURE_STATUE (
	ID_NUM		varchar(30) not null,
	MATERIAL				varchar(20),
	HEIGHT		varchar(20),
	WEIGHT		varchar(20),
	STYLE        varchar(20),
	primary key (ID_NUM),
	foreign key (ID_NUM) references ART_OBJECT(ID_NUM)
);

INSERT INTO SCULPTURE_STATUE (ID_NUM, MATERIAL, HEIGHT, WEIGHT, STYLE)
VALUES
('P_00003','Bronze','101cm','141kg','Realistic'),
('P_00004','Bronze','340cm','622kg', 'Realistic'),
('P_00009','Bronze','22.5cm',null,'Abstract'),
('P_00012','Porcelain','44.5cm',null, 'Abstract'),
('P_00013','Stoneware','158.8cm','346.5kg', 'Abstract'),
('P_00014','Stoneware','54.9cm','40.8kg', 'Abstract'),
('P_00015','Ceramic/Oak Wood','96.5cm',null, 'Abstract'),
('P_00018','Ceramic','48cm',null,'Realistic'),
('P_00021','Bronze','135cm',null, 'Realistic');

DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING (
	ID_NUM			varchar(30) not null,
	PAINT_TYPE				varchar(20),
	DRAWN				varchar(20),
	STYLE			varchar(20),
	primary key (ID_NUM),
	foreign key (ID_NUM) references ART_OBJECT(ID_NUM)
);

INSERT INTO PAINTING (ID_NUM, PAINT_TYPE, DRAWN, STYLE)
VALUES
('P_00001','Oil','Panel','Realistic'),
('P_00002','Oil','Canvas','Realistic'),
('P_00007','Oil','Canvas','Realistic'),
('P_00008','Oil','Oilcloth','Abstract'),
('P_00011','Conte',null,'Realistic'),
('P_00016',null,'Metal','Realistic'),
('P_00020','Leaf Gliding','Cedar','Realistic');

DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER (
	ID_NUM		varchar(30) not null,
	Type		varchar(20),
	STYLE		varchar(20),
	primary key (ID_NUM),
	foreign key (ID_NUM) references ART_OBJECT(ID_NUM)
);

INSERT INTO Other (ID_NUM, Type, STYLE)
VALUES
('P_00005','Sketch','Realistic'),
('P_00006','Text', 'Written'),
('P_00010','Wallpaper', 'Pattern'),
('P_00017','Textile', 'Pattern'),
('P_00019','Diptych Sheet', 'Realistic');


DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION (
	ID_NUM			varchar(30) not null,
	DATE_ACQUIRED			varchar(20),
	STATUS			varchar(10),
	COST			integer,
	primary key (ID_NUM),
	foreign key (ID_NUM) references ART_OBJECT(ID_NUM)
);

INSERT INTO PERMANENT_COLLECTION (ID_NUM, DATE_ACQUIRED, STATUS, COST)
VALUES
('P_00001',null,'On Display',null),
('P_00002',null,'On Display',null),
('P_00003',null,'On Display',null),
('P_00004',null,'On Display',null),
('P_00005',null,'On Display',null),
('P_00006',null,'On Display',null),
('P_00007',null,'On Display',null),
('P_00008',null,'On Display',null),
('P_00009',null,'On Display',null),
('P_00010',null,'On Display',null),
('P_00011',null,'On Display',null),
('P_00012',null,'On Display',null),
('P_00013',null,'On Display',null),
('P_00014',null,'On Display',null),
('P_00015',null,'On Display',null);


DROP TABLE IF EXISTS COLLECTION;
CREATE TABLE COLLECTION (
	NAME			varchar(100)	not null,
	Type		varchar(10),
	DESCRIPTION			mediumtext,
	ADDRESS				varchar(75),
	PHONE				varchar(25),
	CONTACT_PERSON		varchar(50),
	primary key (NAME)
);

INSERT INTO COLLECTION(NAME, Type, DESCRIPTION, ADDRESS, PHONE, CONTACT_PERSON)
VALUES
('The Met Fifth Avenue','Museum','The Metropolitan Museum of Art collects, studies, conserves, and presents significant works of art across time and CULTUREs in order to connect all people to creativity, knowledge, ideas, and one another.','1000 Fifth Avenue, New York, NY, 10028','212-535-7710',null),
('France','Country','Owned by the country.', null,null,null),
('National Museums Recovery','Recovery','A French state organization that manages the looted artworks recovered from Nazi Germany and returned to France after the Second World War.', null, null,null);


DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED (
	ID_NUM			varchar(15)	not null,
	Collection		varchar(100),
	DATE_BORROWED		varchar(20),
	DATE_RETURNED		varchar(20),
	primary key (ID_NUM),
	foreign key (ID_NUM) references ART_OBJECT(ID_NUM),
	foreign key (Collection) references COLLECTION(NAME)
);

INSERT INTO BORROWED (ID_NUM, Collection, DATE_BORROWED, DATE_RETURNED)
VALUES
('P_00016','National Museums Recovery','1950', null),
('P_00017','National Museums Recovery','1951', null),
('P_00018','National Museums Recovery','1999', null),
('P_00019','France','1899', null),
('P_00020','France','1951', null),
('P_00021','France','March 28, 1911', null);


DROP ROLE IF EXISTS db_admin@localhost, read_access@localhost, employee@localhost;
CREATE ROLE db_admin@localhost, read_access@localhost, employee@localhost;

GRANT ALL PRIVILEGES ON *.* TO db_admin@localhost;
GRANT select ON ARTMUSEUM.* TO read_access@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE ON ARTMUSEUM.* TO employee@localhost;

DROP USER IF EXISTS test_admin@localhost, guest@localhost, test_employee@localhost;

CREATE USER guest@localhost;
GRANT read_access@localhost TO guest@localhost;
SET DEFAULT ROLE ALL TO guest@localhost;

CREATE USER test_employee@localhost IDENTIFIED WITH mysql_native_password BY 'ENSF300';
GRANT employee@localhost TO test_employee@localhost;
SET DEFAULT ROLE ALL TO test_employee@localhost;

CREATE USER test_admin@localhost IDENTIFIED WITH mysql_native_password BY 'finalproject';
GRANT db_admin@localhost TO test_admin@localhost;
SET DEFAULT ROLE ALL TO test_admin@localhost;
