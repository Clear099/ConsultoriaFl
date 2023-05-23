CREATE DATABASE lukas2;

use lukas2;


CREATE TABLE tipo_usuario (
    id_tipo_usuario INT PRIMARY KEY,
    tipo_usuario VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    rut VARCHAR(12) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    id_tipo_usuario INT,
    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
);

CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    rut_empresa VARCHAR(12) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE consultoria (
    id_consultoria INT PRIMARY KEY,
    id_usuario INT,
    id_empresa INT,
    consultoria TEXT NOT NULL,
    id_estado_consultoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE estado_consultoria (
    id_estado_consultoria INT PRIMARY KEY,
    id_consultoria INT,
    comentario TEXT NOT NULL,
    FOREIGN KEY (id_consultoria) REFERENCES consultoria(id_consultoria)
);