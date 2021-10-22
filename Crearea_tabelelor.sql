CREATE TABLE if not exists universitate.facultate(
	id int,
    denumire varchar(50),
    adresa varchar(60),
    an_fondare year
);

CREATE TABLE if not exists specializare (
	id_specializare INT NOT NULL,
    id_facultate INT NULL,
    denumire varchar(45) NULL,
    PRIMARY KEY (id_specializare)
);

CREATE table if not exists persoana (
	cnp varchar(13),
    serie varchar(4) NULL,
    nr INT NULL,
    prenume varchar(30) NOT NULL,
    nume varchar(30) NOT NULL,
    adresa varchar(50) NOT NULL,
    nationalitate varchar(50) NOT NULL,
    PRIMARY KEY (cnp)
);

CREATE table if not exists student(
	nr_matricol INT,
    id_specializare INT NOT NULL,
    cnp varchar(13) NOT NULL,
    an_curent INT NOT NULL,
    grupa varchar(10) NOT NULL,
    semestru INT NOT NULL,
    bursa tinyint NULL,
    primary key (nr_matricol)
);

CREATE table if not exists nota(
	id_nota INT,
    id_student INT NOT NULL,
    id_curs INT NOT NULL,
    nota INT NOT NULL,
    data_examen DATE NULL,
    primary key (id_nota)
);

CREATE table if not exists materie
(
	id_materie int,
    id_specializare int not null,
    denumire varchar(50) not null,
    an_de_studiu int not null,
    semestru tinyint not null,
    profesor varchar(50) not null,
    primary key (id_materie)
);