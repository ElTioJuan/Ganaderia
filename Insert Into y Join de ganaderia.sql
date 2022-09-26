USE ganaderia;

                                    -- Razas--
INSERT INTO breed Values(null,'Cebú'),(null,'Brahmán'),(null,'Pardo Suizo'),
(null,'Brangus'),(null,'Simental');

Insert into breedcow values(1,1),(3,2);

                                     -- Vacas --
INSERT INTO cow Values
(null,'Lola','Lechera', true , false,'HEMBRA',false,true,750,1.50,'2 acetominofen','Vaca ingresada por gripe'),
(null,'Lolo','Carne', true , false,'MACHO',false,true,950,1.60,'3 paracetamol','Vaca ingresada por dolor de rodilla'),
(null,'PEPA','Lechera', true , false,'HEMBRA',false,true,730,1.55,'chequeo medico','Vaca en excelente salud');

                                    -- vaccine -- 
INSERT INTO vaccine Values
(null,'Bacterina','Doble, triple u octavalente desde los 3 meses hasta 3 años de edad'),
(null,'Ántrax','Vacunar todo el ganado a partir de los  6 meses de edad hasta el sacrificio o descarte');

									-- Lotes --
INSERT INTO lot Values(null,'De donde fué Danilds night club 2km al Oeste',2),
(null,'Night Club Galileos,Contiguo donde la mimi',0);

INSERT INTO lotcow Values(1,1),(1,2);

                                     -- INVENTARIO --
INSERT INTO inventory Values(null,1,1),
(null,2,1);

                                      -- JOINS --

 -- Join y vista de Razas--
Create view breed_view as 
Select
    cow_name,
    breed_name,
    periodic_weight,
    periodic_height
    From breed
    Right join cow
    on id_cow = id_breed;
    
    -- Join y vista de Vacunas--
create view vaccine_view as
Select
    v.id_vaccine,
    vaccine_name,
    amount, 
    vaccine_desc
    From inventory i
	right join vaccine v
    on i.id_vaccine = v.id_vaccine;
    
-- Vista y Join de Lotes--
create view lot_view as
SELECT
lot.id_lot,
 cow.cow_name,
lot.lot_address
FROM cow
JOIN lotcow
  ON cow.id_cow = lotcow.id_cow
JOIN lot
  ON lot.id_lot = lotcow.id_lot;