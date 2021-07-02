CREATE TABLE clientes (
  tipo_documento VARCHAR(2) NOT NULL,
  documento INT NOT NULL,
  celular VARCHAR(10) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  primer_apellido VARCHAR(30) NOT NULL,
  prmer_nombre VARCHAR(30) NOT NULL,
  segundo_apellido VARCHAR(30) DEFAULT NULL,
  segundo_nombre VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (tipo_documento,documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE MECANICOS
(
primer_nombre   VARCHAR(30)  NOT NULL,
segundo_nombre VARCHAR(30),
primer_apellido VARCHAR(30) NOT NULL,
segundo_apellido VARCHAR(30),
tipo_Documento VARCHAR(2) NOT NULL,
documento INT  NOT NULL,
celular VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
direccion VARCHAR(200) NOT NULL,
estado CHAR(1) NOT NULL,
HorasMesAnt INT(4) NOT NULL,
PRIMARY KEY(tipo_Documento,documento)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE marcas (
  codigo INT NOT NULL AUTO_INCREMENT,
  nombre_marca VARCHAR(30) NOT NULL,
  PRIMARY KEY (codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE vehiculos (
  placa VARCHAR(6) NOT NULL,
  color VARCHAR(30) NOT NULL,
  cod_marca INT NOT NULL,
  cli_documento INT NOT NULL,
  cli_tipo_documento VARCHAR(2) NOT NULL,
  PRIMARY KEY (placa),
  KEY FKd7q0ygjlx3ue73yiat7dxnbf3 (cod_marca),
  CONSTRAINT FKd7q0ygjlx3ue73yiat7dxnbf3 FOREIGN KEY (cod_marca) REFERENCES marcas (codigo),
  KEY FKd7q0ygjlx3ue73yiat7dxnbf4 (cli_documento,cli_tipo_documento),
  CONSTRAINT FKd7q0ygjlx3ue73yiat7dxnbf4 FOREIGN KEY (cli_documento,cli_tipo_documento) REFERENCES clientes(documento,tipo_documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE mantenimientos (
  codigo bigINT NOT NULL AUTO_INCREMENT,
  estado INT DEFAULT NULL,
  fecha date NOT NULL,
  mec_documento INT NOT NULL,
  mec_tipo_documento VARCHAR(2) NOT NULL,
  cod_placa VARCHAR(6) NOT NULL,
  PRIMARY KEY (codigo),
  KEY FKrnt69kjr4aw1n4bsibc2eppmh (cod_placa),
  CONSTRAINT FKrnt69kjr4aw1n4bsibc2eppmh FOREIGN KEY (cod_placa) REFERENCES vehiculos (placa),
  KEY FKd7q0ygjlx3ue73yiat7dxnbf4 (mec_documento,mec_tipo_documento),
  CONSTRAINT FKd7q0ygjlx3ue73yiat7dxnbf4 FOREIGN KEY (mec_documento,mec_tipo_documento) REFERENCES mecanicos (documento,tipo_documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

