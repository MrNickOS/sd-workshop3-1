DROP DATABASE IF EXISTS my_database;

CREATE database my_database; 
USE my_database;
CREATE TABLE curso (
	numero_curso INT NOT NULL,
	nombre_curso VARCHAR(50) NOT NULL,
	profesor VARCHAR(100) NOT NULL,
	intensidad NUMERIC NOT NULL,
	horario VARCHAR(100) NOT NULL,
	salon VARCHAR(10) NOT NULL
);

INSERT INTO curso (numero_curso,nombre_curso,profesor,intensidad,horario,salon) VALUES (09736,'Sistemas Distribuidos','Daniel Barragan',3,'Lun 18:00-20:30; Mie 18:00-20:00','307C');
INSERT INTO curso (numero_curso,nombre_curso,profesor,intensidad,horario,salon) VALUES (09737,'Redes Convergentes','Julian Etayo; Juan Felipe Gomez',3,'Mar 18:00-21:00','306C');
INSERT INTO curso (numero_curso,nombre_curso,profesor,intensidad,horario,salon) VALUES (09664,'Proyecto de Grado II','Gonzalo Ulloa',2,'Mie 11:00-13:00','306L');
INSERT INTO curso (numero_curso,nombre_curso,profesor,intensidad,horario,salon) VALUES (24051,'Etica y Economia','Juan Jose Fernandez',3,'Jue 19:00-22:00','102D');

set global validate_password_check_user_name=OFF;
set global validate_password_dictionary_file=NO;
set global validate_password_length=8;
set global validate_password_mixed_case_count=0;
set global validate_password_number_count=0;
set global validate_password_policy=STRONG;
set global validate_password_special_char_count=0;

GRANT ALL PRIVILEGES ON * . * TO 'usuario'@'172.17.0.3' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
