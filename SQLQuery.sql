CREATE DATABASE PRUEBA_DELFOSTI
GO

USE PRUEBA_DELFOSTI 
GO

CREATE TABLE Directores(
    Id int primary key identity(1,1),
    Nombre varchar(255) not null unique
);

CREATE TABLE Actores(
	Id int primary key identity(1,1),
	Nombre varchar(255) not null unique
);
CREATE TABLE Generos(
    Id int primary key identity(1,1),
    Nombre varchar(255) not null unique
);

CREATE TABLE Paises(
	Id int primary key identity(1,1),
	Nombre varchar(255) not null unique
);
CREATE TABLE Ratings (
    Id int primary key identity(1,1),
    Nombre varchar(255) not null unique
);

CREATE TABLE Calendario(
	Id int primary key identity(1,1),
	Fecha_Inclusion Date not null unique,
	Anio int not null,
	Mes int not null,
	Dia int not null
);


CREATE TABLE Pelicula (
Id int primary key identity(1,1),
Id_Show varchar(10) not null,
Titulo varchar(255) not null,
Tipo varchar(50),
Duracion varchar(50),
Anio_Estreno int,
Descripcion varchar(max),
Id_Director int, 
Id_Rating int, 
Fecha date,
CONSTRAINT FK_Director FOREIGN KEY (Id_Director) REFERENCES Directores(Id),
CONSTRAINT FK_Rating   FOREIGN KEY (Id_Rating)   REFERENCES Ratings(Id),
);

CREATE TABLE Actores_Pelicula (
Id_Titulo int not null,
Id_Actor int not null,
PRIMARY KEY(Id_Titulo,Id_Actor),
CONSTRAINT FK_TituloCast FOREIGN KEY (Id_Titulo) REFERENCES Pelicula(Id),
CONSTRAINT FK_Actor   FOREIGN KEY (Id_Actor)   REFERENCES Actores(Id)
);

CREATE TABLE Paises_Pelicula (
Id_Titulo int not null,
Id_Pais int not null,
PRIMARY KEY(Id_Titulo,Id_Pais),
CONSTRAINT FK_TituloPais FOREIGN KEY (Id_Titulo) REFERENCES Pelicula(Id),
CONSTRAINT FK_Pais FOREIGN KEY (Id_Pais) REFERENCES Paises(Id)
);

CREATE TABLE Genero_Pelicula (
Id_Titulo int not null,
Id_Genero int not null,
PRIMARY KEY(Id_Titulo,Id_Genero),
CONSTRAINT FK_TituloGenero FOREIGN KEY (Id_Titulo) REFERENCES Pelicula(Id),
CONSTRAINT FK_Genero FOREIGN KEY (Id_Genero) REFERENCES Generos(Id)
);

