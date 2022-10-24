create database inventario;
use inventario;

CREATE TABLE `inventario`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `activo` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idusuarios`));
CREATE TABLE `inventario`.`proveedores` (
  `idproveedores` INT NOT NULL,
  `nombreProveedor` VARCHAR(45) NOT NULL,
  `direccionProveedor` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `activo` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idproveedores`));
CREATE TABLE `inventario`.`clientes` (
  `idClientes` INT NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `direccionCliente` VARCHAR(45) NOT NULL,
  `correoElectronicoC` VARCHAR(45) NOT NULL,
  `telefonoCliente` VARCHAR(45) NOT NULL,
  `activo` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`idClientes`));
  CREATE TABLE `inventario`.`articulod` (
  `idarticulod` INT NOT NULL,
  `nombreArticulo` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `cantidad` INT(4) NOT NULL,
  `proveedor` INT NOT NULL,
  `usuarioIncorpora` INT NOT NULL,
  PRIMARY KEY (`idarticulod`),
  INDEX `fk_proveedores_idx` (`proveedor` ASC) VISIBLE,
  INDEX `fk_usuarioIncorpora_idx` (`usuarioIncorpora` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores`
    FOREIGN KEY (`proveedor`)
    REFERENCES `inventario`.`proveedores` (`idproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioIncorpora`
    FOREIGN KEY (`usuarioIncorpora`)
    REFERENCES `inventario`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `inventario`.`prestamos` (
  `idprestamos` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `usuarioPresta` INT NOT NULL,
  `fechaPrestamo` DATE NOT NULL,
  `fechaEntrega` DATE NULL,
  PRIMARY KEY (`idprestamos`),
  INDEX `fk_cliente_idx` (`idcliente` ASC) VISIBLE,
  INDEX `fk_usuarioPresta_idx` (`usuarioPresta` ASC) VISIBLE,
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `inventario`.`clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioPresta`
    FOREIGN KEY (`usuarioPresta`)
    REFERENCES `inventario`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
