-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `DoctorID` INT NOT NULL,
  `Doctor_Name` VARCHAR(45) NULL,
  `Doctor_Adress` VARCHAR(45) NULL,
  `Doctor_Phone_number` VARCHAR(45) NULL,
  `Doctor_Date_of_birth` DATE NULL,
  PRIMARY KEY (`DoctorID`),
  UNIQUE INDEX `DoctorID_UNIQUE` (`DoctorID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `ID` INT NOT NULL,
  `Overtime_rate` VARCHAR(45) NULL,
  `DoctorID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `DoctorID_UNIQUE` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `Med-Doc`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `mydb`.`Doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `ID` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  `DoctorID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `DoctorID_UNIQUE` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `Spec-Doc`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `mydb`.`Doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `Patient_ID` INT NOT NULL,
  `Patient_Name` VARCHAR(45) NULL,
  `Patient_Adress` VARCHAR(45) NULL,
  `Patient_Phone_number` VARCHAR(45) NULL,
  `Patient_Date_of_birth` DATE NULL,
  PRIMARY KEY (`Patient_ID`),
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `Appointment_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Time` TIME NULL,
  `Patient_ID` INT NOT NULL,
  `Doctor_ID` INT NOT NULL,
  `Bill_ID` INT NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  UNIQUE INDEX `Doctor_ID_UNIQUE` (`Doctor_ID` ASC) VISIBLE,
  UNIQUE INDEX `Appointment_ID_UNIQUE` (`Appointment_ID` ASC) VISIBLE,
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  CONSTRAINT `App-Doc`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `mydb`.`Doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `App-Pat`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `mydb`.`Patients` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `Bill_ID` INT NOT NULL,
  `DoctorID` INT NOT NULL,
  `Total` DECIMAL NOT NULL,
  PRIMARY KEY (`Bill_ID`),
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  UNIQUE INDEX `Appointment_ID_UNIQUE` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `Doc-Bill`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `mydb`.`Doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `Payment_ID` INT NOT NULL,
  `Bill_ID` INT NOT NULL,
  `Patient_ID` INT NOT NULL,
  `Details` VARCHAR(45) NULL,
  PRIMARY KEY (`Payment_ID`),
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  UNIQUE INDEX `Patient_ID_UNIQUE` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `Pat-Pay`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `mydb`.`Patients` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bill-Pay`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `mydb`.`Bill` (`Bill_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
