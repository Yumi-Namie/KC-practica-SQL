--Aparte del script, habrá que entregar una consulta SQL para sacar el siguiente listado de coches activos que hay en KeepCoding:

-- Nombre modelo, marca y grupo de coches (los nombre de todos)
-- Fecha de compra
-- Matricula
-- Nombre del color del coche
-- Total kilómetros
-- Nombre empresa que esta asegurado el coche
-- Numero de póliza




create schema renata_y_namie_consulta authorization uhwcqusy;

-- SELECT CON JOIN ---

select m.model_name,
b.brand_name,
cia.company_name, 
car.dt_purchase, 
car.license_plate,
cl.color_name, 
car.km_total, 
ic.name, 
ip.policy_number

from renata_y_namie.car car inner join renata_y_namie.model m
on m.model_id = car.model_id 
inner join renata_y_namie.insurance_policy ip
on car.car_id = ip.car_id 
inner join renata_y_namie.insurance_company ic 
on ip.insurance_id = ic.insurance_id 
inner join renata_y_namie.brand b 
on b.brand_id = m.brand_id
inner join renata_y_namie.company cia 
on cia.company_id = b.company_id 
inner join renata_y_namie.color cl 
on cl.color = car.color 




