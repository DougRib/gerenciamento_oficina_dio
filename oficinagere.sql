create database mechanicalWorkshop;
use mechanicalWorkshop;
show tables;

create table clients(
	idClient int auto_increment primary key,
    CName varchar(100) not null,
    CPF char(11) not null unique,
    Address varchar(200),
    Telefone char(11)
);
desc clients;

create table vehicle(
	idVehicle int auto_increment primary key,
	idClient int not null,
    Model varchar(100) not null,
    Mark varchar(30) not null,
    YearCar int not null,
    Color varchar(100) not null,
    constraint fk_vehicle_client foreign key(idClient) references clients(idClient)
);
desc vehicle;

create table mechanic(
	idMechanic int auto_increment primary key,
    Mname varchar(100) not null,
    Specialty varchar(30)
);
desc mechanic;

create table vehicleMechanic(
	idVehicle int,
    idMechanic int,
    StartDate date not null,
    EndDate date not null,
    ServiceDescription varchar(255),
    constraint fk_vehiclemechanic_vehicle foreign key(idVehicle) references vehicle(idVehicle),
	constraint fk_vehiclemechanic_mechanic foreign key(idMechanic) references mechanic(idMechanic)
);
desc vehicleMechanic;

create table serviceOrder(
	idServiceOrder int auto_increment primary key,
    idClient int,
    idVehicle int,
    idMechanic int,
    ServiceType enum('Conserto', 'Revisão'),
    EntryDate date,
    DepartureDate datetime null,
    ServiceBudget decimal(10, 2),
    Payment bool default false,
    StatusOs enum('Aberto', 'Em Execução', 'Concluído', 'Cancelado') default 'Aberto',
    constraint fk_os_client foreign key(idClient) references clients(idClient),
    constraint fk_os_vehicle foreign key(idVehicle) references vehicle(idVehicle),
    constraint fk_serviceorder_mechanic foreign key (idMechanic) references mechanic(idMechanic)
);
desc serviceOrder;

create table serviceExecution(
	idServiceExecution int auto_increment primary key,
    idClient int not null,
    idVehicle int not null,
    idServiceOrder int not null,
    idMechanic int not null,
    ExecutionDescription varchar(255),
    ExecutionDate datetime not null default current_timestamp,
    StatusExecution enum('Aberto', 'Autorizado', 'Não Autorizado') default 'Aberto',
    constraint fk_serviceExecution_client foreign key(idClient) references clients(idClient),
    constraint fk_serviceExecution_vehicle foreign key(idVehicle) references vehicle(idVehicle),
    constraint fk_serviceExecution_order foreign key(idServiceOrder) references serviceOrder(idServiceOrder),
    constraint fk_serviceExecution_mechanic foreign key(idMechanic) references mechanic(idMechanic)
);
desc serviceExecution;

create table parts(
	idParts int auto_increment primary key,
    idServiceOrder int,
    PartsName varchar(100),
    Quantity int,
    PriceParts decimal(10, 2),
    constraint fk_parts_os foreign key(idServiceOrder) references serviceOrder(idServiceOrder)
);
desc parts;

create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(60) not null,
    CNPJ char(14) not null unique,
    Contact char(11) not null,
    Address varchar(150)
); 
desc supplier;

create table supplierParts(
	idSupplier int,
    idParts int,
    AvailableStock int,
    PurchaseDate date,
    PiecePrice decimal(10, 2),
    constraint fk_supplierParts_client foreign key(idSupplier) references supplier(idSupplier),
    constraint fk_supplierParts_parts foreign key(idParts) references parts(idParts)
);
desc supplierParts;

create table repairCar(
	idRepairCar int auto_increment primary key,
    idServiceOrder int,
    idMechanic int,
    RepairDescription varchar(255),
    PpartsRepair decimal(10, 2),
    LaborValue decimal(10, 2),
    RepairDate date,
    constraint fk_repaircar_os foreign key(idServiceOrder) references serviceOrder(idServiceOrder),
    constraint fk_repaircar_mechanic foreign key (idMechanic) references mechanic(idMechanic)
);
desc repairCar;

create table revision(
	idRevision int auto_increment primary key,
    idServiceOrder int,
    idMechanic int,
    ItemsChecked  varchar(255) not null,
    RevisionDate date,
    ReviewValue decimal(10, 2),
	constraint fk_revision_os foreign key(idServiceOrder) references serviceOrder(idServiceOrder),
    constraint fk_revision_mechanic foreign key (idMechanic) references mechanic(idMechanic)
);
desc revision;

create table payments(
	idPayments int auto_increment primary key,
    idServiceOrder int,
    TypePayment enum('Dinheiro', 'Cartao', 'Boleto'),
    TotalValue decimal(10, 2),
    DatePayment datetime,
    constraint fk_payment_os foreign key(idServiceOrder) references serviceOrder(idServiceOrder)
);
desc payments;

--

-- Busca pelo id do veiculo, modelo e ano do veículo
select idVehicle, model, yearcar from vehicle;

-- Ano veiculo
select * from vehicle where yearcar > 2022;

-- Orden de serviço de um cliente 1 - 5
select * from serviceOrder where idClient = 1;

-- Ordens de serviço pela data criação mais recente
select * from serviceOrder order by EntryDate desc;

-- Quantas ordens cada cliente tem 
select idClient, count(*) as TotalOrdens from serviceOrder group by idClient;

-- Total de conserto por mecânico
select idMechanic, count(*) as TotalConserto 
from repairCar 
group by idMechanic 
having TotalConserto >= 1;

-- Total de revisão por mecânico
select idMechanic, count(*) as TotalRevisão 
from revision 
group by idMechanic 
having TotalRevisão >= 1;

-- Lista as ordens de serviço com os dados do cliente
select 
	serviceOrder.idServiceOrder as OrdemServiço, 
    serviceOrder.EntryDate as DataEntrada, 
    clients.Cname as Nome
from serviceOrder
join clients on serviceOrder.idClient = clients.idClient;

-- Lista os veículos junto dos mecânicos responsáveis pelos serviços
select 
	vehicle.Model as Modelo, 
    vehicle.yearCar as Ano, 
    mechanic.Mname as NomeMecânico,
    mechanic.Specialty as Especialidade
from vehicle
join serviceOrder on vehicle.idVehicle = serviceOrder.idVehicle
join mechanic on serviceOrder.idMechanic = mechanic.idMechanic;

-- Lista as revisões e os detalhes do cliente e veículo
select 
	revision.idRevision,
    revision.ItemsChecked as ItemsChecados,
    clients.Cname as Cliente,
    vehicle.Model as Veículo,
    vehicle.YearCar as Ano,
    vehicle.Color as Cor
from revision
join serviceOrder on revision.idServiceOrder = serviceOrder.idServiceOrder
join clients on serviceOrder.idClient = clients.idClient
join vehicle on serviceOrder.idVehicle = vehicle.idVehicle








