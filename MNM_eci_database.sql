/*******************************************************************************
   Author: Maria de los angeles Naranjo
********************************************************************************/
DROP DATABASE IF EXISTS departamentoCC;
CREATE DATABASE departamentoCC CHARACTER SET utf8mb4;
USE departamentoCC;
CREATE TABLE `Familias`
(
    `id_dpto` INT NOT NULL,
    `cod_familia` NVARCHAR(120) NOT NULL,
    `desc_familia` NVARCHAR(120) NOT NULL,
    CONSTRAINT `PK_Familias` PRIMARY KEY  (`cod_familia`)
);
CREATE TABLE `Departamentos`
(
    `Id_Dpto` INT NOT NULL,
    `Desc_Dpto` NVARCHAR(120) NOT NULL,
    CONSTRAINT `PK_Departamentos` PRIMARY KEY (`Id_Dpto`)
);

CREATE TABLE `Articulos`
(
    `Id_Dpto` INT NOT NULL,
    `Referencia` NVARCHAR(10) NOT NULL,
    `COD_Familia` NVARCHAR(20) NOT NULL,
    `Fecha_Alta` DATE,
    PRIMARY KEY  (`Referencia`)
);

CREATE TABLE `Campanias`
(
    `Id_Campania` NVARCHAR(20) NOT NULL,
    `Tipo` NVARCHAR(120) NOT NULL,
    `Fecha_Camp` DATETIME,
    PRIMARY KEY  (`Id_Campania`)
);

CREATE TABLE `Dpto_Campanias`
(
    `Id_Dpto` INT NOT NULL,
    `Id_Campania` NVARCHAR(80),
      PRIMARY KEY  (`Id_Dpto`,`Id_Campania`)
);

CREATE TABLE `Ventas`
(
    `Talon` INT NOT NULL,
    `Referencia` NVARCHAR(70) NOT NULL,
    `Precio` FLOAT NOT NULL,
    `Fecha_Venta` DATETIME,
    PRIMARY KEY  (`Talon`)
);
INSERT INTO `Familias` (`Id_dpto`, `Cod_familia`,`Desc_familia`) VALUES (1,'IF1','PULSERAS');
INSERT INTO `Familias` (`Id_dpto`, `Cod_familia`,`Desc_familia`) VALUES (1,'IF2','ANILLOS');
INSERT INTO `Familias` (`Id_dpto`, `Cod_familia`,`Desc_familia`) VALUES (2,'2F1','BOLSO DE MANO');
INSERT INTO `Familias` (`Id_dpto`, `Cod_familia`,`Desc_familia`) VALUES (3,'3F1','NAUTICO');
INSERT INTO `Familias` (`Id_dpto`, `Cod_familia`,`Desc_familia`) VALUES (3,'3F2','SANDALIAS');
INSERT INTO `Familias` (`Id_dpto`, `Cod_familia`,`Desc_familia`) VALUES (4,'4F1','BERMUDAS');

INSERT INTO `Departamentos` (`Id_dpto`,`Desc_dpto`) VALUES (1,'JOYERIA');
INSERT INTO `Departamentos` (`Id_dpto`,`Desc_dpto`) VALUES (2,'BOLSOS');
INSERT INTO `Departamentos` (`Id_dpto`,`Desc_dpto`) VALUES (3,'ZAPATERIA');
INSERT INTO `Departamentos` (`Id_dpto`,`Desc_dpto`) VALUES (4,'BANO CAB.');

INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('A', 1,'1F1', '2010/02/21');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('B', 2,'2F1', '2014/02/07');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('C', 2,'2F1', '2014/05/15');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('D', 2,'2F1', '2005/10/01');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('E', 2,'2F1', '2010/10/31');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('F', 3,'3F1', '2001/04/20');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('G', 3,'3F1', '2015/02/14');
INSERT INTO `articulos` (`Referencia`,`Id_dpto`,`Cod_familia`,`Fecha_alta`) VALUES ('H', 4,'4F1', '2009/03/25');


INSERT INTO `Campanias` (`Id_Campania`, `Tipo`,`Fecha_camp`) VALUES ('CA1','VENTA','2012/02/05');
INSERT INTO `Campanias` (`Id_Campania`, `Tipo`,`Fecha_camp`) VALUES ('CA2','VENTA','2012/02/04');
INSERT INTO `Campanias` (`Id_Campania`, `Tipo`,`Fecha_camp`) VALUES ('CA3','POSVENTA','2009/10/02');
INSERT INTO `Campanias` (`Id_Campania`, `Tipo`,`Fecha_camp`) VALUES ('CA4','VENTA','2010/05/06');
INSERT INTO `Campanias` (`Id_Campania`, `Tipo`,`Fecha_camp`) VALUES ('CA5','POSVENTA','2010/11/30');
INSERT INTO `Campanias` (`Id_Campania`, `Tipo`,`Fecha_camp`) VALUES ('CA6','POSVENTA','2015/02/07');

INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (01,'A','15','2012/02/11');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (02,'A','18','2012/02/15');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (03,'A','14','2013/02/10');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (04,'D','37.95','2010/08/06');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (05,'E','125.95','2010/11/30');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (06,'E','150','2011/02/05');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (07,'H','22.99','2010/04/11');
INSERT INTO `Ventas` (`Talon`,`Referencia`,`precio`,`Fecha_venta`) VALUES (08,'H','24','2011/08/08');

INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (1,'CA1');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (1,'CA4');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (2,'CA2');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (3,'CA2');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (3,'CA5');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (3,'CA6');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (4,'CA1');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (4,'CA2');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (4,'CA3');
INSERT INTO `dpto_campanias` (`ID_dpto`,`ID_campania`) VALUES (4,'CA6');
 
