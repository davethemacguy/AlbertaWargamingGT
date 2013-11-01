SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `linds14sr20det`.`UserData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `linds14sr20det`.`UserData` ;

CREATE  TABLE IF NOT EXISTS `linds14sr20det`.`UserData` (
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
-- Table `linds14sr20det`.`Tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `linds14sr20det`.`Tournaments` ;

CREATE  TABLE IF NOT EXISTS `linds14sr20det`.`Tournaments` (
  `tournamentName` VARCHAR(45) NOT NULL ,
  `tournamentDate` VARCHAR(45) NOT NULL ,
  `system` VARCHAR(45) NOT NULL ,
  `bestOverall` VARCHAR(45) NOT NULL ,
  `bestGeneral` VARCHAR(45) NOT NULL ,
  `bestPainted` VARCHAR(45) NOT NULL ,
  `bestSport` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`tournamentName`, `tournamentDate`, `system`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linds14sr20det`.`TournamentResults`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `linds14sr20det`.`TournamentResults` ;

CREATE  TABLE IF NOT EXISTS `linds14sr20det`.`TournamentResults` (
  `fk_tournamentName` VARCHAR(45) NOT NULL ,
  `fk_tournamentDate` VARCHAR(45) NOT NULL ,
  `playerName` VARCHAR(45) NOT NULL ,
  `fk_system` VARCHAR(45) NULL ,
  `score` INT NULL ,
  `army` VARCHAR(45) NULL ,
  `optOut` VARCHAR(45) NULL ,
  PRIMARY KEY (`fk_tournamentName`, `fk_tournamentDate`, `playerName`) ,
  INDEX `fk_tournaments` (`fk_tournamentName` ASC, `fk_tournamentDate` ASC, `fk_system` ASC) ,
  CONSTRAINT `fk_tournaments`
    FOREIGN KEY (`fk_tournamentName` , `fk_tournamentDate` , `fk_system` )
    REFERENCES `linds14sr20det`.`Tournaments` (`tournamentName` , `tournamentDate` , `system` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linds14sr20det`.`webPageStrings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `linds14sr20det`.`webPageStrings` ;

CREATE  TABLE IF NOT EXISTS `linds14sr20det`.`webPageStrings` (
  `stringID` LONGTEXT NULL ,
  `text` LONGTEXT NULL )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
