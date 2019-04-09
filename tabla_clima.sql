/--------Crear tabla Clima en Postgresql ----------------/

CREATE TABLE Clima(
   id SERIAL PRIMARY KEY,
   temperatura VARCHAR(50) NOT NULL,
   presion VARCHAR(50) NOT NULL,
   humedad VARCHAR(50) NOT NULL,
   estado VARCHAR(100) NOT NULL,
   descripcion VARCHAR(100) NOT NULL
);


