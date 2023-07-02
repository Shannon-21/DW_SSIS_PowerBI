-- This table must be named TRADEProd_DW

CREATE TABLE DIM_CLIENTES (
ClienteKey int IDENTITY(1, 1) Not null Primary key,
ClienteId nvarchar(255) not null,
Nombre nvarchar(255) not null, 
Apellido nvarchar(255) not null,
Edad int not null,
EstadoCivil nvarchar(255) not null,
Residencia nvarchar(255) not null,
Origen nvarchar(255) not null,
);
go

CREATE TABLE DIM_PRODUCTOS (
ProductoKey int IDENTITY(1, 1) Not null Primary key,
ProductoCodigo nvarchar(255) not null,
Nombre nvarchar(255) not null, 
Categoria nvarchar(255) not null,
PrecioUnitario int not null,
CostoUnitario int not null,
);
go

CREATE TABLE DIM_SUCURSALES (
SucursalKey int IDENTITY(1, 1) Not null Primary key,
SucursalId int not null,
ComunaId int not null,
ProvinciaId int not null,
RegionId int not null,
SucursalNombre nvarchar(255) not null, 
ComunaNombre nvarchar(255) not null, 
ProvinciaNombre nvarchar(255) not null, 
RegionNombre nvarchar(255) not null, 
);
go

CREATE TABLE DIM_VENDEDORES (
VendedorKey int IDENTITY(1, 1) Not null Primary key,
Nombre nvarchar(255) not null, 
Apellido nvarchar(255) not null, 
TipoCapacitacion nvarchar(255) not null, 
HorasCapacitacion int not null,
);
go

CREATE TABLE DIM_TIEMPO (
TiempoKey int IDENTITY(1, 1) Not null Primary key,
Fecha datetime not null, 
Año int not null, 
Mes int not null, 
Dia int not null,
);
go

CREATE TABLE FACT_VENTAS (
Documento nvarchar(255) Not null Primary key,
ProductoKey int not null references DIM_PRODUCTOS(ProductoKey), 
ClienteKey int not null references DIM_CLIENTES(ClienteKey), 
VendedorKey int not null references DIM_VENDEDORES(VendedorKey), 
SucursalKey int not null references DIM_SUCURSALES(SucursalKey), 
TiempoKey int not null references DIM_TIEMPO(TiempoKey),
DocumentoTipo nvarchar(255) not null,
Cantidad int not null,
TotalNeto int not null,
TotalDocumento int not null,
);
go


