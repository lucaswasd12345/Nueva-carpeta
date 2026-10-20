-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema certificacion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema certificacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `certificacion` DEFAULT CHARACTER SET utf8mb3 ;
USE `certificacion` ;

-- -----------------------------------------------------
-- Table `certificacion`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacion`.`usuarios` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `certificacion`.`viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacion`.`viajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `destino` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_inicio` VARCHAR(255) NULL DEFAULT NULL,
  `fecha__fin` VARCHAR(255) NULL DEFAULT NULL,
  `Itinerario` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`, `usuarios_id`),
  INDEX `fk_viajes_usuarios_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_viajes_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `certificacion`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `certificacion`.`usuarios_has_viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacion`.`usuarios_has_viajes` (
  `usuarios_id` INT NOT NULL,
  `viajes_id` INT NOT NULL,
  `viajes_usuarios_id` INT NOT NULL,
  PRIMARY KEY (`usuarios_id`, `viajes_id`, `viajes_usuarios_id`),
  INDEX `fk_usuarios_has_viajes_viajes1_idx` (`viajes_id` ASC, `viajes_usuarios_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_viajes_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_viajes_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `certificacion`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_viajes_viajes1`
    FOREIGN KEY (`viajes_id` , `viajes_usuarios_id`)
    REFERENCES `certificacion`.`viajes` (`id` , `usuarios_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
