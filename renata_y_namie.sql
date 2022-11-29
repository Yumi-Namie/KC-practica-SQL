-- Enunciado
--En KeepCoding queremos gestionar la flota de vehículos de empresa, controlando los modelos de los coches, las marcas y el grupo empresarial de la marca (por ejemplo VW SEAT, Audi etc. pertenecen al grupo VAN)
--De los coches también necesitamos saber el color del coche, su matrícula, el número total de kilómetros que tiene, la compañía aseguradora ( Mapfre, MMT, AXA etc), el número de póliza, fecha de compra etc.
--A demás queremos controlar de cada coche las revisiones que se ha pasado al coche sabiendo los Kms que tenía en el momento de la revisión, la fecha de la revisión y el importe de la revisión.

--Nota: Los importes se debe controlar la moneda (EURO, DÓLAR etc.).


create schema renata_y_namie authorization uhwcqusy;



--- | TABLE: COMPANY | ---
create table renata_y_namie.company(
company_id varchar (20) not null, --PK
company_name varchar (200) not null
);
-- PK
alter table renata_y_namie.company
add constraint company_PK primary key (company_id);

-- Compruebo la tabla
select * from renata_y_namie.company;

--->>> DATOS (COMPANY) <<<---
-- insertamos TESLA (GP01)
-- insertamos Volkswagen (GP02)
-- insertamos BMW group (GP03)
-- insertamos Mercedes-Benz (GP04)

insert into renata_y_namie.company 
(company_id, company_name) 
values('GP01', 'Tesla');

insert into renata_y_namie.company 
(company_id, company_name) 
values('GP02', 'Volkswagen');

insert into renata_y_namie.company 
(company_id, company_name) 
values('GP03', 'BMW group');

insert into renata_y_namie.company 
(company_id, company_name) 
values('GP04', 'Mercedes-Benz');



--- | TABLE: BRAND | ---
create table renata_y_namie.brand(
brand_id varchar (20) not null, -- PK
company_id varchar (20) not null, -- FK 
brand_name varchar (200) not null
);
-- PK
alter table renata_y_namie.brand
add constraint brand_PK primary key (brand_id);
-- FK 
alter table renata_y_namie.brand
add constraint  brand_company_FK foreign key (company_id) 
references renata_y_namie.company(company_id);

--->>> DATOS (BRAND) <<<---
-- insertamos TESLA (TES01)
-- insertamos PORSCHE (VKS01)
-- insertamos AUDI (VKS02)
-- insertamos MINI (BMW01)
-- insertamos BMW (BMW02)
-- insertamos SMART (MER01)
-- insertamos MERCEDES-BENZS (MER02)

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('TES01', 'GP01', 'Tesla');

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('VKS01', 'GP02', 'Porsche');

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('VKS02', 'GP02', 'Audi');

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('BMW01', 'GP03', 'Mini');

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('BMW02', 'GP03', 'BMW');

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('MER01', 'GP04', 'Smart');

insert into renata_y_namie.brand 
(brand_id, company_id, brand_name) 
values('MER02', 'GP04', 'Mercedes-Benz');

-- Compruebo la tabla
select * from renata_y_namie.brand;



--- | TABLE: MODEL | ---
create table renata_y_namie.model(
model_id varchar (20) not null, -- PK 
brand_id varchar (20) not null, -- FK 
model_name varchar (200) not null
);
-- PK
alter table renata_y_namie.model
add constraint model_PK primary key (model_id);
-- FK 
alter table renata_y_namie.model
add constraint  model_brand_FK foreign key (brand_id) 
references renata_y_namie.brand(brand_id);

--->>> DATOS (MODEL) <<<---
-- insertamos  'S AWD' (TS01)
-- insertamos 'X Plaid 4WD' (TS02)
-- insertamos 'Cayenne' (PC01)
-- insertamos 'Macan' (PC02)
-- insertamos 'Panamera' (PC03)
-- insertamos 'A4' (AU01)
-- insertamos 'A6' (AU02)
-- insertamos 'Q3' (AU03)
-- insertamos 'Mini Electric' (MI01)
-- insertamos 'Mini Cabrio' (MI02)
-- insertamos 'Mini John Cooper' (MI03)
-- insertamos 'BMW X1' (BM01)
-- insertamos 'BMW X3' (BM02)
-- insertamos 'BMW X5' (BM03)
-- insertamos 'EQ fortwo' (SM01)
-- insertamos 'Brabus' (SM01)
-- insertamos 'GLB' (MB01)
-- insertamos 'CLS' (MB02)

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('TS01', 'TES01', 'S AWD');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('TS02', 'TES01', 'X Plaid 4WD');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('PC01', 'VKS01', 'Cayenne');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('PC02', 'VKS01', 'Macan');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('PC03', 'VKS01', 'Panamera');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('AU01', 'VKS02', 'A4');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('AU02', 'VKS02', 'A6');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('AU03', 'VKS02', 'Q3');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('MI01', 'BMW01', 'Mini Electric');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('MI02', 'BMW01', 'Mini Cabrio');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('MI03', 'BMW01', 'Mini John Cooper');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('BM01', 'BMW02', 'BMW X1');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('BM02', 'BMW02', 'BMW X3');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('BM03', 'BMW02', 'BMW X5');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('SM01', 'MER01', 'EQ fortwo');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('SM02', 'MER01', 'Brabus');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('MB01', 'MER02', 'GLB');

insert into renata_y_namie.model
(model_id, brand_id, model_name) 
values('MB02', 'MER02', 'CLS');

-- Compruebo la tabla
select * from renata_y_namie.model;


--- | TABLE: COLOR | ---
create table renata_y_namie.color(
color varchar (20) not null, --PK
color_name varchar (20) not null
); 
-- PK
alter table renata_y_namie.color
add constraint color_PK primary key (color);

--->>> DATOS (color) <<<---
insert into renata_y_namie.color
values ('c1', 'black');

insert into renata_y_namie.color
values ('c2', 'red');

insert into renata_y_namie.color
values ('c3', 'yellow');

insert into renata_y_namie.color
values ('c4', 'green');

insert into renata_y_namie.color
values ('c5', 'white');

insert into renata_y_namie.color
values ('c6', 'silver');

insert into renata_y_namie.color
values ('c7', 'blue');


--- | TABLE: CAR | ---
create table renata_y_namie.car(
car_id varchar (20) not null, --PK 
model_id varchar (20) not null, -- FK
color varchar (20) not null, -- FK
license_plate varchar (20) not null,
km_total numeric (10,2) not null,
dt_purchase date not null, 
description varchar (512) null
); 
-- PK
alter table renata_y_namie.car
add constraint car_PK primary key (car_id);
-- FK 
alter table renata_y_namie.car
add constraint  car_model_FK foreign key (model_id) 
references renata_y_namie.model(model_id);
alter table renata_y_namie.car
add constraint  car_color_FK foreign key (color) 
references renata_y_namie.color(color);

--->>> DATOS (car) <<<---
insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- S AWD
values('001', 'TS01',  'c1', 'TES123456', 100.30, '2022-10-10', 'new car');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- X Plaid 4WD
values('002', 'TS02',  'c1', 'TES654321', 900.50, '2022-05-06', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- Cayenne
values('003', 'PC01', 'c2', 'POR123456', 2000, '2021-03-20', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- Macan
values('004', 'PC02', 'c2', 'POR987654', 5000, '2020-03-20', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- Panamera
values('005', 'PC03', 'c2', 'PRC976543', 10000, '2019-05-15', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- A4
values('006', 'AU01', 'c3', 'AUD321236', 20000, '2020-03-15', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- A6
values('007', 'AU02', 'c3', 'AUD675322', 30000, '2020-02-20', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) --Q3
values('008', 'AU03', 'c3', 'AUD322564', 45000, '2019-03-20', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- mini electric
values('009', 'MI01', 'c4', 'MIN322564', 32500, '2019-03-06', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- mini electric
values('010', 'MI01', 'c2', 'MIN122301', 35500, '2019-03-06', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- mini cabrio
values('011', 'MI02', 'c2', 'MIN113432', 35500, '2019-03-06', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- Mini John Cooper
values('012', 'MI03', 'c2', 'MIN055432', 342145, '2019-03-26', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- BMW X1
values('013', 'BM01', 'c5', 'BMW055432', 362145, '2019-03-26', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- BMW X3
values('014', 'BM02', 'c5', 'BMW112487', 200343, '2020-08-04', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- BMW X5
values('015', 'BM03', 'c5', 'BMW002233', 1230050, '2018-08-23', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- EQ fortwo
values('016', 'SM01', 'c6', 'MCB002233', 30045012, '2018-10-22', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- Brabus
values('017', 'SM02', 'c7',  'BDZ003452',3305060, '2019-07-22', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- Brabus
values('018', 'SM02', 'c7', 'MCZ110023', 3002345, '2019-07-22', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- GLB
values('019', 'MB01', 'c1', 'MCZ001234', 50000050, '2019-07-20', '');

insert into renata_y_namie.car
(car_id, model_id, color, license_plate, km_total, dt_purchase, description) -- CLS
values('020', 'MB02', 'c1', 'MCZ332211', 100000, '2021-03-20', '');


-- Compruebo la tabla
select * from renata_y_namie.car;





---  | TABLE: INSURANCE_COMPANY | ---
create table renata_y_namie.insurance_company(
insurance_id varchar (20) not null, -- PK 
name varchar (200) not null
);
-- PK
alter table renata_y_namie.insurance_company
add constraint insurance_company_PK primary key (insurance_id);

--->>> DATOS (insurance_company) <<<---
-- insertamos  'Mapfre' (001)
-- insertamos  'Porto Seguro' (002)
-- insertamos  'AXA' (003)

insert into renata_y_namie.insurance_company
(insurance_id, name) -- CLS
values('001', 'Mapfre');
insert into renata_y_namie.insurance_company
(insurance_id, name) -- CLS
values('002', 'Porto Seguro');
insert into renata_y_namie.insurance_company
(insurance_id, name) -- CLS
values('003', 'AXA');

-- Compruebo la tabla
select * from renata_y_namie.insurance_company;





---  |TABLE: INSURANCE_POLICY | ---
create table renata_y_namie.insurance_policy(
car_id varchar (20) not null, -- PK, FK 
policy_id varchar (20) not null, -- PK
insurance_id varchar (20) not null, -- FK 
policy_number varchar (50) not null, 
dt_start date not null,
dt_end date not null default '4000-01-01',
description varchar (512) null
);
-- PK
alter table renata_y_namie.insurance_policy
add constraint insurance_policy_PK primary key (car_id, policy_id);
-- FK
alter table renata_y_namie.insurance_policy
add constraint  insurance_policy_car_FK foreign key (car_id) 
references renata_y_namie.car(car_id);
alter table renata_y_namie.insurance_policy
add constraint  insurance_company_car_FK foreign key (insurance_id) 
references renata_y_namie.insurance_company(insurance_id);

--->>> DATOS (insurance_policy) <<<---
-- insertamos el insurance de los 20 coches
insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('001', '10001', '001', '1000100' , '2022-10-15'); -- Mapfre

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('002', '10002', '001', '1000101' , '2022-05-16'); -- Mapfre

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('003', '10003', '002', '2000100' , '2021-03-25'); -- Porto Seguro

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('004', '10004', '002', '2000101' , '2020-03-26'); -- Porto Seguro

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('005', '10005', '002', '2000102' , '2019-05-21'); -- Porto Seguro

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('006', '10006', '002', '2000103' , '2020-03-27'); -- Porto Seguro

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('007', '10007', '002', '2000104' , '2020-02-22'); -- Porto Seguro

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('008', '10008', '002', '2000105' , '2019-03-26'); -- Porto Seguro

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('009', '10009', '003', '3000100' , '2019-03-16'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('010', '10010', '003', '3000101' , '2019-03-16'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('011', '10011', '003', '3000102' , '2019-03-16'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('012', '10012', '003', '3000103' , '2019-03-27'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('013', '10013', '003', '3000104' , '2019-03-27'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('014', '10014', '003', '3000105' , '2020-08-10'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('015', '10015', '003', '3000106' , '2018-09-10'); -- AXA

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('016', '10016', '001', '100102' , '2018-11-01'); -- Mapfre

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('017', '10017', '001', '100103' , '2019-08-01'); -- Mapfre

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('018', '10018', '001', '100104' , '2019-08-01'); -- Mapfre

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('019', '10019', '001', '100105' , '2019-08-01'); -- Mapfre

insert into renata_y_namie.insurance_policy 
(car_id, policy_id, insurance_id, policy_number, dt_start)
values('020', '10020', '001', '100106' , '2021-03-27'); -- Mapfre

-- Compruebo la tabla
select * from renata_y_namie.insurance_policy;




--- | TABLE: CURRENCY | ---
create table renata_y_namie.currency(
currency_id varchar (20) not null, -- PK 
currency_name varchar (20) not null default 'Euro'
);
-- PK
alter table renata_y_namie.currency
add constraint currency_PK primary key (currency_id);

--->>> DATOS (currency) <<<---
insert into renata_y_namie.currency 
(currency_id, currency_name )
values('01', 'Euro' ); 
insert into renata_y_namie.currency 
(currency_id, currency_name )
values('02', 'Dólar' );
insert into renata_y_namie.currency 
(currency_id, currency_name )
values('03', 'Real' );

-- Compruebo la tabla
select * from renata_y_namie.currency;



--- | TABLE: REVIEW | ---
create table renata_y_namie.review(
car_id varchar (20) not null, -- PK, FK
dt_review date not null, -- PK 
currency_id varchar (20) not null, -- FK
amount numeric (10,2) not null,
total_km numeric (10,2) not null,
description varchar (512) null
);
-- PK
alter table renata_y_namie.review
add constraint review_PK primary key (dt_review, car_id);
-- FK 
alter table renata_y_namie.review
add constraint  review_car_FK foreign key (car_id) 
references renata_y_namie.car(car_id);
alter table renata_y_namie.review
add constraint  review_currency_FK foreign key (currency_id) 
references renata_y_namie.currency(currency_id);

-- Compruebo la tabla
select * from renata_y_namie.review;

--->>> DATOS (review) <<<---
insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('003', '2022-04-20', '01', '900','2000', 'full review'); 

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('004', '2022-04-20', '01', '900','5000', 'full review' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('005', '2022-02-15', '01', '900','10000' , ' full review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('006', '2022-03-15', '01', '900','20000', 'full review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('007', '2022-02-20', '01', '900','30000', 'full review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('008', '2022-02-20', '01', '900','45000', 'full review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('009', '2022-03-06', '02', '650','32500', 'basic review'); 

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('010', '2022-03-06', '02', '650','35500', 'basic review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('011', '2022-03-06', '02', '650','35500', 'basic review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km, description)
values('012', '2022-03-06', '02', '650','342145', 'basic review');

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('013', '2022-03-20', '03', '4500','362145' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('014', '2022-08-04', '03', '5000','200343' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('015', '2022-08-10', '03', '4500','1230050' ); 

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('016', '2022-10-20', '01', '620','30045012' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('017', '2022-07-20', '01', '650','3305060' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('018', '2022-07-20', '01', '800','3002345' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('019', '2022-07-20', '01', '900','50000050' );

insert into renata_y_namie.review
(car_id, dt_review, currency_id, amount, total_km)
values('020', '2022-03-20', '01', '900','100' );





--drop schema renata_y_namie cascade


















