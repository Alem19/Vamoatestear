--Ingresar a postgresql

sudo -u postgres psql 

--Para la base de datos Netjer

--Crear usuario 
CREATE USER luis_p WITH PASSWORD 'abc123.';

--Crear base de datos con user

CREATE DATABASE crmdb WITH OWNER luis_p;

--Cambia a base de datos

\c crmdb;

--Crear tabla login en Postgresql

CREATE TABLE Login(
   IdLogin serial NOT NULL,
   Usuario VARCHAR(50) NOT NULL,
   Contrasenia VARCHAR(150) NOT NULL
);

--PK Login
alter table Login
  add constraint Login_PK primary key (IdLogin);

-- Create table
create table Role
(
  IdRole serial not null,
  Nombre VARCHAR(30) not null
) ;

--  PK Role
alter table Role
  add constraint Role_PK primary key (IdRole);

-- Create table Account
create TABLE Account(
    idAccount VARCHAR(250) not null,
    isDeleted VARCHAR(2) not null,
    name VARCHAR(150) not null,
    type VARCHAR(150),
    site VARCHAR(150),
    phone VARCHAR(150),
    fax VARCHAR(150),
    webSite VARCHAR(150),
    billingStreet VARCHAR(200),
    billingCity VARCHAR(150),
    billingState VARCHAR(150),
    billingPostalCode VARCHAR(50),
    billingCountry VARCHAR(150),
    shippingStreet VARCHAR(200),
    shippingCity VARCHAR(150),
    shippingState VARCHAR(150),
    shippingPostalCode VARCHAR(150),
    shippingCountry VARCHAR(150),
    rating VARCHAR(150),
    description VARCHAR(150),
    industry VARCHAR(150),
    accountSource VARCHAR(150)
);

-- PK Account
alter table Account
  add constraint Account_PK primary key (idAccount);
  
-- Create table Contact
create TABLE Contact(
    idContact VARCHAR(250) not null,
    isDeleted VARCHAR(2) not null,
    idAccount VARCHAR(250) not null,
    firstName VARCHAR(150) not null,
    lastName VARCHAR(150) not null,
    accountName VARCHAR(150) not null,
    title VARCHAR(150),
    supervisor VARCHAR(150),
    supervisorPhone VARCHAR(150),
    contactOwner VARCHAR(150),
    departament VARCHAR(150),
    email VARCHAR(150),
    celphone VARCHAR(150),
    localphone VARCHAR(150),
    fax VARCHAR(150),
    twitter VARCHAR(200),
    linkedin VARCHAR(200),
    country VARCHAR(150),
    state VARCHAR(150),
    delegation VARCHAR(150),
    street VARCHAR(200),
    suburb VARCHAR(150),
    edifice VARCHAR(150),
    postalCode VARCHAR(150),
    description VARCHAR(200),
    otherCountry VARCHAR(150),
    otherState VARCHAR(150),
    otherDelegation VARCHAR(150),
    otherStreet VARCHAR(200),
    otherSuburb VARCHAR(150),
    otherEdifice VARCHAR(150),
    otherPostalCode VARCHAR(150),
    otherPhone VARCHAR(150),
    treatment VARCHAR(150),
    candidateOrigin VARCHAR(150)
);

-- PK Contact
alter table Contact
  add constraint Contact_PK primary key (idContact);
  
-- FK Contact to Account
alter table Contact
  add constraint Contact_FK foreign key (idAccount)
  references Account (idAccount);
  
-- Create table Opportunity
create table Opportunity(
    idOpportunity VARCHAR(250) not null,
    isDeleted VARCHAR(2) not null,
    idAccount VARCHAR(250) not null,
    name VARCHAR(150),
    contract VARCHAR(150),
    amount VARCHAR(150),
    product VARCHAR(150),
    deadline date,
    type VARCHAR(150),
    stageName VARCHAR(150),
    stageSortOrder VARCHAR(100),
    isClosed VARCHAR(2),
    isWon VARCHAR(2),
    nextStep VARCHAR(150),
    expectedAmount VARCHAR(150),
    description VARCHAR(150),
    isPrivate VARCHAR(2),
    fiscalYear VARCHAR(4),
    fiscalQuarter VARCHAR(4),
    opportunityOwner VARCHAR(150),
    probability VARCHAR(150)
);

-- PK Opportunity
alter table Opportunity
  add constraint Opportunity_PK primary key (idOpportunity);
  
-- FK Opportunity to Account
alter table Opportunity
  add constraint Opportunity_FK foreign key (idAccount)
  references Account (idAccount);

-- Grant permissions to database and tables
  
GRANT ALL PRIVILEGES ON DATABASE crmdb TO luis_p;

GRANT ALL PRIVILEGES ON TABLE Login TO luis_p;

GRANT ALL PRIVILEGES ON TABLE Role TO luis_p;

GRANT ALL PRIVILEGES ON TABLE Account TO luis_p;

GRANT ALL PRIVILEGES ON TABLE Contact TO luis_p;

GRANT ALL PRIVILEGES ON TABLE Opportunity TO luis_p;


-- Insert to first record

--Login
insert into Login (IdLogin, Usuario,Contrasenia)
values (0, 'admin', 'Admin123.');

--Role
insert into Role (IdRole, Nombre)
values (0, 'ADMIN');

-- Account
insert into Account(idAccount,isDeleted,name,type,site,phone,fax,webSite,billingStreet,billingCity,billingState,billingPostalCode,billingCountry,shippingStreet,shippingCity,shippingState,shippingPostalCode,shippingCountry,rating,description,industry,accountSource) values ('0018000000Z9xsbAAB','0','Herdez','Cliente Final (End User)','Mexico','5201-5663','','http://www.grupoherdez.com.mx/','Monte Pelvoux # 215 col. Lomas de Chapultepec','Mexico D.F','Mexico D.F','11000','Mexico','','','','','','Tibio','','Alimentos y bebidas','');

-- Contact1
insert into Contact(idContact,isDeleted,idAccount,firstName,lastName,accountName,title,supervisor,supervisorPhone,contactOwner,departament,email,celphone,localphone,fax,twitter,linkedin,country,state,delegation,street,suburb,edifice,postalCode,description,otherCountry,otherState,otherDelegation,otherStreet,otherSuburb,otherEdifice,otherPostalCode,otherPhone,treatment,candidateOrigin) values ('0038000000mUwDSAA0','0','0018000000Z9xsbAAB','Juan Carlos','Martinez Valencia','Herdez','GERENTE DE COMUNICACIONES','','','','Sistemas','jcmartinez@herdezdelfuerte.com','5559691928','555201-5655','','','','Mexico','Mexico D.F','Mexico D.F','Monte Pelvoux # 215 col. Lomas de Chapultepec','Mexico D.F','','11000','','','','','','','','','','','');

-- Contact2
insert into Contact(idContact,isDeleted,idAccount,firstName,lastName,accountName,title,supervisor,supervisorPhone,contactOwner,departament,email,celphone,localphone,fax,twitter,linkedin,country,state,delegation,street,suburb,edifice,postalCode,description,otherCountry,otherState,otherDelegation,otherStreet,otherSuburb,otherEdifice,otherPostalCode,otherPhone,treatment,candidateOrigin) values ('0038000000nnVHCAA2','0','0018000000Z9xsbAAB','Gustavo','Mercado Valencia','Herdez','GERENTE DE COMUNICACIONES','','','','','gmv@herdezdelfuerte.com','','52015655 ext 1098','52015784','','','Mexico','Mexico D.F','Mexico D.F','Monte Pelvoux # 215 col. Lomas de Chapultepec','Mexico D.F','','11000','Jefe de Juan Carlos','','','','','','','','','','');

-- Contact3
insert into Contact(idContact,isDeleted,idAccount,firstName,lastName,accountName,title,supervisor,supervisorPhone,contactOwner,departament,email,celphone,localphone,fax,twitter,linkedin,country,state,delegation,street,suburb,edifice,postalCode,description,otherCountry,otherState,otherDelegation,otherStreet,otherSuburb,otherEdifice,otherPostalCode,otherPhone,treatment,candidateOrigin) values ('003C0000014Q2EaIAK','0','0018000000Z9xsbAAB','Israel','De los Ríos Cedillo','Herdez','Coordinador de Soporte Técnico','','','','','idriosc@herdezdelfuerte.com','445539333324','52016412','','','','Mexico','Mexico D.F','Mexico D.F','Monte Pelvoux # 215 col. Lomas de Chapultepec','Mexico D.F','','11000','','','','','','','','','','','');

-- Contact4
insert into Contact(idContact,isDeleted,idAccount,firstName,lastName,accountName,title,supervisor,supervisorPhone,contactOwner,departament,email,celphone,localphone,fax,twitter,linkedin,country,state,delegation,street,suburb,edifice,postalCode,description,otherCountry,otherState,otherDelegation,otherStreet,otherSuburb,otherEdifice,otherPostalCode,otherPhone,treatment,candidateOrigin) values ('003C000001b7p7YIAQ','0','0018000000Z9xsbAAB','Roberto','Juarez Socorro','Herdez','Gerente de Tecnologìas','','','','','rsj@herdezdelfuerte.com','04455 52015694','520115600','','','','Mexico','Mexico D.F','Mexico D.F','Monte Pelvoux # 215 col. Lomas de Chapultepec','Mexico D.F','','11000','','','','','','','','','52015694','','');

-- Opportunity1
insert into Opportunity(idOpportunity,isDeleted,idAccount,name,contract,amount,product,deadline,type,stageName,stageSortOrder,isClosed,isWon,nextStep,expectedAmount,description,isPrivate,fiscalYear,fiscalQuarter,opportunityOwner,probability) values ('0060h000018MNdvAAG','0','0018000000Z9xsbAAB','Amplicacion acceso Benefit','En firma con el cliente','800','','2019/04/04','Current Customer','End Users PO or Contract Signed','1','1','1','Cerrado','800','Summint220-12p','0','2019','2','','100');

-- Opportunity2
insert into Opportunity(idOpportunity,isDeleted,idAccount,name,contract,amount,product,deadline,type,stageName,stageSortOrder,isClosed,isWon,nextStep,expectedAmount,description,isPrivate,fiscalYear,fiscalQuarter,opportunityOwner,probability) values ('0060h000018MNeAAAW','0','0018000000Z9xsbAAB','Planta Chiapas','En firma con el cliente','','','2019/05/31','New Customer','Qualified Prospect','7','0','0','','','','0','2019','2','','20');

-- Opportunity3
insert into Opportunity(idOpportunity,isDeleted,idAccount,name,contract,amount,product,deadline,type,stageName,stageSortOrder,isClosed,isWon,nextStep,expectedAmount,description,isPrivate,fiscalYear,fiscalQuarter,opportunityOwner,probability) values ('0060h000018MNeKAAW','0','0018000000Z9xsbAAB','Amplicacion Zumpango','En firma con el cliente','','','2019/05/31','New Customer','Qualified Prospect','7','0','0','','','','0','2019','2','','20');


-- Opportunity4
insert into Opportunity(idOpportunity,isDeleted,idAccount,name,contract,amount,product,deadline,type,stageName,stageSortOrder,isClosed,isWon,nextStep,expectedAmount,description,isPrivate,fiscalYear,fiscalQuarter,opportunityOwner,probability) values ('0060h000018MNePAAW','0','0018000000Z9xsbAAB','RFID para el CEDIS','En firma con el cliente','','','2019/07/31','New Customer','Confirmed Lead','8','0','0','Buscar alianza o proveedor de soluciones de RFID','','','0','2019','3','','10');

-- Opportunity5
insert into Opportunity(idOpportunity,isDeleted,idAccount,name,contract,amount,product,deadline,type,stageName,stageSortOrder,isClosed,isWon,nextStep,expectedAmount,description,isPrivate,fiscalYear,fiscalQuarter,opportunityOwner,probability) values ('0068000000S8jW9AAJ','0','0018000000Z9xsbAAB','Mantenimiento Red de datos','En firma con el cliente','','','2019/05/31','Current Customer','Depende del seguimiento de Netjer','10','0','0','Normalizar la informacion del inventario y prepara la propuesta','','Proyecto de mmto de toda la base instalada de equipo Extreme','0','2019','2','','50');
