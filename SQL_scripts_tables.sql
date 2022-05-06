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
-- Table `mydb`.`tbl_projetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_projetos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `id_atividades` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_ativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_ativo` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_sexo` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL,
  `cidade` VARCHAR(90) NULL,
  `bairro` VARCHAR(90) NULL,
  `rua` VARCHAR(90) NULL,
  `cep` VARCHAR(90) NULL,
  `numero` INT NULL,
  `latitude` FLOAT NULL,
  `longitude` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `login` VARCHAR(255) NULL,
  `id_ativo` INT NULL,
  `tbl_sexo_id` INT NULL,
  `tbl_endereco_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_usuarios_tbl_ativo1_idx` (`id_ativo` ASC) VISIBLE,
  INDEX `fk_tbl_usuarios_tbl_sexo1_idx` (`tbl_sexo_id` ASC) VISIBLE,
  INDEX `fk_tbl_usuarios_tbl_endereco1_idx` (`tbl_endereco_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_usuarios_tbl_ativo1`
    FOREIGN KEY (`id_ativo`)
    REFERENCES `mydb`.`tbl_ativo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usuarios_tbl_sexo1`
    FOREIGN KEY (`tbl_sexo_id`)
    REFERENCES `mydb`.`tbl_sexo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usuarios_tbl_endereco1`
    FOREIGN KEY (`tbl_endereco_id`)
    REFERENCES `mydb`.`tbl_endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_atividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_atividades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `id_projeto` INT NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_atividades_tbl_projetos1_idx` (`id_projeto` ASC) VISIBLE,
  INDEX `fk_tbl_atividades_tbl_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_atividades_tbl_projetos1`
    FOREIGN KEY (`id_projeto`)
    REFERENCES `mydb`.`tbl_projetos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_atividades_tbl_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`tbl_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_notas` (
  `id` INT NOT NULL,
  `nota1` INT NULL,
  `nota2` INT NULL,
  `nota3` INT NULL,
  `nota4` INT NULL,
  `nota_final` INT NULL,
  `tbl_atividades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_notas_tbl_atividades1_idx` (`tbl_atividades_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_notas_tbl_atividades1`
    FOREIGN KEY (`tbl_atividades_id`)
    REFERENCES `mydb`.`tbl_atividades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
