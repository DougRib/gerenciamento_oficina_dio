use mechanicalWorkshop;

insert into clients (CName, CPF, Address, Telefone) values 
	('Douglas R', '16374826371', 'Rua das araras, 254 - Porto alegre - RS', '51836484732'),
    ('Daniel R', '16374824371', 'Rua liberta, 211 - Canoas - RS', '51835364732'),
    ('Andressa ana', '16378826371', 'Rua das alcacias, 1254 - Novo hamburgo - RS', '51836482232'),
    ('Daniele claser', '18974826371', 'Rua Marcirio da silva, 257 - Porto alegre - RS', '51906484732'),
    ('João silva', '16374906371', 'Rua dos andradas, 2900 - Porto alegre - RS', '51836484732')
;
select * from clients;

insert into vehicle (idClient, Model, Mark, YearCar, Color) values
	(1, 'Lancer V 2.0 turbo', 'Mitsubishi', '2021', 'Preto'),
    (2, 'Civic 1.6 turbo', 'Honda', '2022', 'Azul'),
    (3, 'Onix 1.4 turbo', 'Chevrolet', '2020', 'Branco'),
    (4, 'Creta 1.0 turbo', 'Hyunday', '2023', 'Prata'),
    (5, 'Hillux 2.2 turbo 4x4', 'Toyota', '2021', 'Vermelho')
;
select * from vehicle;

insert into mechanic (Mname, Specialty) values
	('Roberto andrade', 'Motor'),
    ('André silva', 'Chapeção'),
    ('Ataídes ramos', 'Freios e Suspenção'),
    ('Leonardo ramos', 'Revisão')
;
select * from mechanic;

insert into parts (idServiceOrder, PartsName, Quantity, PriceParts) values
	( 1, 'Disco e Pastilha de freio', 4, 950.00),
    ( 2, 'Suspensão', 4, 1250.00),
    ( 3, 'Òleo do motor, filtro do A/C, filtro motor, anel vedação, filtro óleo', 8, 670.00),
    ( 4, 'Óleo motor, filtro óleo, filtro motor', 6, 780.00),
    ( 5, 'Comando de vávulas', 8, 3250.00)
;
select * from parts;

insert into supplier (SocialName, CNPJ, Contact, Address) values
	('Auto peças LTDA', '28465837491035', '11835475869', 'Rua comercial, 234 - Guarulhos - SP'),
    ('Fornecedora x LTDA', '28461137491035', '11835222869', 'Rua das patas, 884 - Caxias do sul - RS'),
    ('Monra comercial', '28465837422235', '11839995869', 'Rua Luther king, 1234 - Leme - RJ')
;
select * from supplier;

insert into vehicleMechanic (idVehicle, idMechanic, StartDate, EndDate, ServiceDescription) values
	(1, 3, '2023-01-10', '2023-01-13', 'Troca e limpeza de disco e freio dianteiro e traseiro'),
    (2, 3, '2024-11-15', '2024-11-23', 'Troca da suspenção dianteiro e traseiro'),
    (3, 4, '2025-03-18', null, 'Revisão'),
    (4, 4, '2025-01-10', '2025-01-10', 'Revisão'),
    (5, 1, '2025-02-13', null, 'Troca do comando de válvulas')
;
select * from vehicleMechanic;

insert into supplierParts (idSupplier, idParts, AvailableStock, PurchaseDate, PiecePrice) values
	(1, 16, 20, '2022-01-12', 280.00),
    (3, 17, 3, '2023-01-12', 380.00),
    (1, 18, 4, '2023-10-12', 480.00),
    (2, 19, 7, '2024-01-22', 1280.00)
;
select * from supplierParts;

insert into serviceOrder (idClient, idVehicle, idMechanic, ServiceType, EntryDate, DepartureDate, ServiceBudget, Payment, StatusOs) values
	(1, 1, 3, 'Conserto',  '2023-01-09', '2023-01-14 18:00:00', 1200.00, true, 'Concluído'),
    (2, 2, 3, 'Conserto',  '2024-11-15', '2024-11-23 13:00:00', 1750.00, true, 'Concluído'),
    (3, 3, 4, 'Revisão',  '2025-03-18', null, 500.00, false, 'Em Execução'),
    (4, 4, 4, 'Revisão',  '2025-01-10', '2025-01-10 11:00:00', 700.00, true, 'Concluído'),
    (5, 5, 1, 'Conserto',  '2025-02-13', null, 4250.00, false, 'Em Execução')
;
select * from serviceOrder;

insert into serviceExecution (idClient, idVehicle, idServiceOrder, idMechanic, ExecutionDescription, ExecutionDate, StatusExecution) values
	(1, 1, 1, 3, 'Troca e limpeza do sistema de freio', '2023-01-13 18:00:00', 'Autorizado'),
    (2, 2, 2, 3, 'Troca da suspenção dianteiro e traseiro', '2024-11-21 15:00:00', 'Autorizado'),
    (3, 3, 3, 4, 'Revisão 30000 km', null, 'Aberto'),
    (4, 4, 4, 4, 'Revisão 20000 km', '2025-01-10 11:00:00', 'Autorizado'),
    (5, 5, 5, 1, 'Troca do comando de válvulas', null, 'Não Autorizado')
;
select * from serviceExecution;

insert into payments (idServiceOrder, TypePayment, TotalValue, DatePayment) values
	(1, 'Dinheiro', 1350.00, '2023-01-14 18:00:00'),
    (2, 'Cartao', 1400.00, '2024-11-23 17:00:00'),
    (3, 'Dinheiro', 500.00, null),
    (4, 'Cartao', 700.00, '2025-01-10 14:00:00'),
    (5, 'Dinheiro', 4250.00, null)
;
select * from payments;

insert into repairCar (idServiceOrder, idMechanic, RepairDescription, PpartsRepair, LaborValue, RepairDate) values
	(1, 3,'Troca e limpeza de disco e freio dianteiro e traseiro', 280.00, 150.00, '2023-01-13'),
    (2, 3, 'Troca da suspenção dianteiro e traseiro', 280.00, 150.00, '2024-11-23'),
    (5, 1,'Troca do comando de válvulas', 280.00, 1000.00, null)
;
select * from repairCar;

insert into revision (idServiceOrder, idMechanic, ItemsChecked,  RevisionDate, ReviewValue) values
	(3, 4, 'Óleo do motor, Filtro de ar, Filtro de combustível, Correia dentada, freios, velas ignição', '2025-03-18', 500.00),
    (4, 4, 'Óleo do motor, Filtro de ar, Filtro de combustível, freios, velas ignição', '2025-01-10', 700.00)
;
select * from revision;



