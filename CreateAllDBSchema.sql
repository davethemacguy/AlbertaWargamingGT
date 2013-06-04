SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `awgdata` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `awgdata` ;

-- -----------------------------------------------------
-- Table `awgdata`.`UserData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `awgdata`.`UserData` ;

CREATE  TABLE IF NOT EXISTS `awgdata`.`UserData` (
  `userID` INT NOT NULL AUTO_INCREMENT ,
  `userName` VARCHAR(45) NOT NULL ,
  `firstName` VARCHAR(45) NULL ,
  `lastName` VARCHAR(45) NULL ,
  `emailAddress` VARCHAR(45) NULL ,
  `userRole` VARCHAR(45) NULL ,
  `passWord` VARCHAR(45) NULL ,
  `userDelete` VARCHAR(45) NULL ,
  PRIMARY KEY (`userID`, `userName`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `awgdata`.`Tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `awgdata`.`Tournaments` ;

CREATE  TABLE IF NOT EXISTS `awgdata`.`Tournaments` (
  `tournamentName` VARCHAR(45) NOT NULL ,
  `tournamentDate` VARCHAR(45) NOT NULL ,
  `bestOverall` INT NOT NULL ,
  `bestGeneral` INT NOT NULL ,
  `bestPainted` INT NOT NULL ,
  `bestSport` INT NOT NULL ,
  PRIMARY KEY (`tournamentName`, `tournamentDate`) ,
  INDEX `fk_Tournaments_userdata` (`bestOverall` ASC) ,
  INDEX `fk_Tournaments_userdata1` (`bestGeneral` ASC) ,
  INDEX `fk_Tournaments_userdata2` (`bestPainted` ASC) ,
  INDEX `fk_Tournaments_userdata3` (`bestSport` ASC) ,
  CONSTRAINT `fk_Tournaments_userdata`
    FOREIGN KEY (`bestOverall` )
    REFERENCES `awgdata`.`UserData` (`userID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tournaments_userdata1`
    FOREIGN KEY (`bestGeneral` )
    REFERENCES `awgdata`.`UserData` (`userID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tournaments_userdata2`
    FOREIGN KEY (`bestPainted` )
    REFERENCES `awgdata`.`UserData` (`userID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tournaments_userdata3`
    FOREIGN KEY (`bestSport` )
    REFERENCES `awgdata`.`UserData` (`userID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `awgdata`.`TournamentResults`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `awgdata`.`TournamentResults` ;

CREATE  TABLE IF NOT EXISTS `awgdata`.`TournamentResults` (
  `fk_tournamentName` VARCHAR(45) NOT NULL ,
  `fk_tournamentDate` VARCHAR(45) NOT NULL ,
  `UserData_userID` VARCHAR(45) NOT NULL ,
  `score` INT NULL ,
  `army` VARCHAR(45) NULL ,
  PRIMARY KEY (`fk_tournamentName`, `fk_tournamentDate`, `UserData_userID`) ,
  INDEX `fk_tournamentName` (`fk_tournamentName` ASC) ,
  INDEX `fk_tournamentDate` (`fk_tournamentDate` ASC) ,
  CONSTRAINT `fk_tournamentName`
    FOREIGN KEY (`fk_tournamentName` )
    REFERENCES `awgdata`.`TournamentResults` (`fk_tournamentName` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tournamentDate`
    FOREIGN KEY (`fk_tournamentDate` )
    REFERENCES `awgdata`.`Tournaments` (`tournamentName` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
