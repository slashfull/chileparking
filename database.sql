	CREATE DATABASE chileparking;

	use chileparking;

	CREATE TABLE keyquestions(
		id int auto_increment not null,
		question varchar(50) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_keyquestions PRIMARY KEY(id)
	)ENGINE=InnoDb;

	CREATE TABLE roles(
		id int auto_increment not null,
		name varchar(20) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_roles PRIMARY KEY(id)
	)ENGINE=InnoDb;

	CREATE TABLE persons(
		rut varchar(20) not null,
		name varchar(30) not null,
		lastname varchar(30) not null,
		phone varchar(20) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_persons PRIMARY KEY(rut)
	)ENGINE=InnoDb;

	CREATE TABLE users(
		rutPerson varchar(20) not null,
		email varchar(60) not null,
		password varchar(150) not null,
		idRole int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_users PRIMARY KEY(rutPerson),
		CONSTRAINT fk_users_persons FOREIGN KEY(rutPerson) REFERENCES persons(rut) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_users_roles FOREIGN KEY(idRole) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE accountrecovery(
		id int auto_increment not null,
		rutUser varchar(20) not null,
		idQuestion int not null,
		answer varchar(50) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_accountrecovery PRIMARY KEY(id),
		CONSTRAINT fk_accountrecovery_users FOREIGN KEY(rutUser) REFERENCES users(rutPerson) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_accountrecovery_keyquestions FOREIGN KEY(idQuestion) REFERENCES keyquestions(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE countries(
		id int auto_increment not null,
		name varchar(30) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_countries PRIMARY KEY(id)
	)ENGINE=InnoDb;

	CREATE TABLE cities(
		id int auto_increment not null,
		name varchar(30) not null,
		idCountry int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_cities PRIMARY KEY(id),
		CONSTRAINT fk_cities_countries FOREIGN KEY(idcountry) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE parkings(
		code int auto_increment not null,
		address varchar(100) not null,
		idcity int not null,
		latitude varchar(20) not null,
		longitude varchar(20) not null,
		horaryStart int not null,
		horaryEnd int not null,
		rate int not null,
		capacity int not null,
		availability int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_parkings PRIMARY KEY(code),
		CONSTRAINT fk_parkings_cities FOREIGN KEY(idcity) REFERENCES cities(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE operators(
		id int auto_increment not null,
		rutUser varchar(20) not null,
		codeParking int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_parkinguser PRIMARY KEY(id),
		CONSTRAINT fk_parkinguser_users FOREIGN KEY(rutUser) REFERENCES users(rutPerson) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_parkinguser_parkings FOREIGN KEY(codeParking) REFERENCES parkings(code) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE statespaces(
		id int auto_increment not null,
		name varchar(30) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_statespaces PRIMARY KEY(id)
	)ENGINE=InnoDb;

	CREATE TABLE spaces(
		id int auto_increment not null,
		number int not null,
		idStateSpace int not null,
		codeParking int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_spaces PRIMARY KEY(id),
		CONSTRAINT fk_spaces_statespaces FOREIGN KEY(idStateSpace) REFERENCES statespaces(id) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_spaces_parkings FOREIGN KEY(codeParking) REFERENCES parkings(code) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE statereserves(
		id int auto_increment not null,
		name varchar(30) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_statereserves PRIMARY KEY(id)
	)ENGINE=InnoDb;

	CREATE TABLE reserves(
		id int auto_increment not null,
		idSpace int not null,
		idOperator int not null,
		idStateReserve int not null,
		rutClient varchar(20) not null,
		total int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_reserves PRIMARY KEY(id),
		CONSTRAINT fk_reserves_spaces FOREIGN KEY(idSpace) REFERENCES spaces(id) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_reserves_perkinguser FOREIGN KEY(idOperator) REFERENCES operators(id) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_reserves_statereserves FOREIGN KEY(idStateReserve) REFERENCES statereserves(id) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_reserves_persons FOREIGN KEY(rutClient) REFERENCES persons(rut) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE detailreserves(
		id int auto_increment not null,
		idReserve int not null,
		startTime datetime not null,
		endTime datetime,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_detailreserves PRIMARY KEY(id),
		CONSTRAINT fk_detailreserves FOREIGN KEY(idReserve) REFERENCES reserves(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE subjects(
		id int auto_increment not null,
		name varchar(30) not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_subjects PRIMARY KEY(id)
	)ENGINE=InnoDb;

	CREATE TABLE messages(
		id int auto_increment not null,
		rutUser varchar(20) not null,
		idSubject int not null,
		content varchar(500) not null,
		answerOf int,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_messages PRIMARY KEY(id),
		CONSTRAINT fk_messages_users FOREIGN KEY(rutUser) REFERENCES users(rutPerson) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_messages_subjects FOREIGN KEY(idSubject) REFERENCES subjects(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;

	CREATE TABLE virtualreserves(
		id int auto_increment not null,
		rutUser varchar(20) not null,
		idOperator int not null,
		created_at datetime,
		updated_at datetime,
		CONSTRAINT pk_virtualreserves PRIMARY KEY(id),
		CONSTRAINT fk_virtualreserves_users FOREIGN KEY(rutUser) REFERENCES users(rutPerson) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk_virtualreserves_parkinguser FOREIGN KEY(idOperator) REFERENCES parkinguser(id) ON UPDATE CASCADE ON DELETE CASCADE
	)ENGINE=InnoDb;


	INSERT INTO `keyquestions`(`question`) VALUES ('En que ciudad naciste');
	INSERT INTO `keyquestions`(`question`) VALUES ('Nombre de tu primera mascota');
	INSERT INTO `keyquestions`(`question`) VALUES ('Cual fue tu primer apodo');

	INSERT INTO `roles`(`name`) VALUES ('Administrador');
	INSERT INTO `roles`(`name`) VALUES ('Operador');
	INSERT INTO `roles`(`name`) VALUES ('Normal');

	INSERT INTO `countries`(`name`) VALUES ('Chile');
	INSERT INTO `countries`(`name`) VALUES ('Argentina');
	INSERT INTO `countries`(`name`) VALUES ('Peru');
	INSERT INTO `countries`(`name`) VALUES ('Brasil');

	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Arica',1);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Iquique',1);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Antofagasta',1);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Calama',1);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Coquimbo',1);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('La Serena',1);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Buenos Aires',2);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Rosario',2);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Tacna',3);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Lima',3);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Sao Paulo',4);
	INSERT INTO `cities`(`name`, `idcountry`) VALUES ('Brasilia',4);

	INSERT INTO `statespaces`(`name`) VALUES ('Libre');
	INSERT INTO `statespaces`(`name`) VALUES ('Ocupado');

	INSERT INTO `statereserves`(`name`) VALUES ('Activo');
	INSERT INTO `statereserves`(`name`) VALUES ('Finalizada');
	INSERT INTO `statereserves`(`name`) VALUES ('Solicitud');

	INSERT INTO `subjects`(`name`) VALUES ('Informativo');
	INSERT INTO `subjects`(`name`) VALUES ('Reclamo');
    