SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portsapp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `portsapp` ;

-- -----------------------------------------------------
-- Schema portsapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portsapp` DEFAULT CHARACTER SET utf8 ;
USE `portsapp` ;

-- -----------------------------------------------------
-- Table `portsapp`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portsapp`.`locations` ;

CREATE TABLE IF NOT EXISTS `portsapp`.`locations` (
  `uuid` BINARY(16) NOT NULL,
  `lat` DECIMAL(10,8) NULL,
  `lng` DECIMAL(11,8) NULL,
  PRIMARY KEY (`uuid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portsapp`.`ports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portsapp`.`ports` ;

CREATE TABLE IF NOT EXISTS `portsapp`.`ports` (
  `uuid` BINARY(16) NOT NULL,
  `uuid_location` BINARY(16) NOT NULL,
  `name` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`uuid`),
  INDEX `fk_ports_locations_idx` (`uuid_location` ASC) VISIBLE,
  CONSTRAINT `fk_ports_locations`
    FOREIGN KEY (`uuid_location`)
    REFERENCES `portsapp`.`locations` (`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portsapp`.`docks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portsapp`.`docks` ;

CREATE TABLE IF NOT EXISTS `portsapp`.`docks` (
  `uuid` BINARY(16) NOT NULL,
  `uuid_location` BINARY(16) NOT NULL,
  `uuid_port` BINARY(16) NOT NULL,
  `status` VARCHAR(20) NULL,
  PRIMARY KEY (`uuid`),
  INDEX `fk_docks_locations_idx` (`uuid_location` ASC) INVISIBLE,
  INDEX `fk_docks_ports_idx` (`uuid_port` ASC) VISIBLE,
  CONSTRAINT `fk_docks_locations`
    FOREIGN KEY (`uuid_location`)
    REFERENCES `portsapp`.`locations` (`uuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ports_docks`
    FOREIGN KEY (`uuid_port`)
    REFERENCES `portsapp`.`ports` (`uuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portsapp`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portsapp`.`payments` ;

CREATE TABLE IF NOT EXISTS `portsapp`.`payments` (
  `uuid` BINARY(16) NOT NULL,
  `status` VARCHAR(20) NULL,
  `cost` INT(8) NULL,
  PRIMARY KEY (`uuid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portsapp`.`ships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portsapp`.`ships` ;

CREATE TABLE IF NOT EXISTS `portsapp`.`ships` (
  `uuid` BINARY(16) NOT NULL,
  `name` VARCHAR(256) NULL,
  `beam` DECIMAL(5,2) NULL,
  `length` DECIMAL(6,2) NULL,
  `draft` DECIMAL(4,2) NULL,
  `capacity` INT(5) NULL,
  `tonnage` INT(6) NULL,
  PRIMARY KEY (`uuid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portsapp`.`bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portsapp`.`bookings` ;

CREATE TABLE IF NOT EXISTS `portsapp`.`bookings` (
  `uuid` BINARY(16) NOT NULL,
  `uuid_ship` BINARY(16) NOT NULL,
  `uuid_payment` BINARY(16) NULL,
  `uuid_dock` BINARY(16) NOT NULL,
  `start_date_time` DATETIME NULL,
  `end_date_time` DATETIME NULL,
  `booking_date_time` DATETIME NULL,
  `tide_time` DATETIME NULL,
  `tide_height` INT(3) NULL,
  `status` VARCHAR(20) NULL,
  `bookingscol` VARCHAR(45) NULL,
  PRIMARY KEY (`uuid`),
  INDEX `fk_bookings_payments_idx` (`uuid_payment` ASC) VISIBLE,
  INDEX `fk_bookings_ships_idx` (`uuid_ship` ASC) VISIBLE,
  INDEX `fk_bookings_docks_idx` (`uuid_dock` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_payments`
    FOREIGN KEY (`uuid_payment`)
    REFERENCES `portsapp`.`payments` (`uuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_ships`
    FOREIGN KEY (`uuid_ship`)
    REFERENCES `portsapp`.`ships` (`uuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_docks`
    FOREIGN KEY (`uuid_dock`)
    REFERENCES `portsapp`.`docks` (`uuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
