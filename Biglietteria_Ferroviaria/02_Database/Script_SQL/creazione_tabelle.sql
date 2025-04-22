
CREATE TABLE Cliente (
  ID_Cliente SERIAL PRIMARY KEY,
  Nome VARCHAR(50),
  Cognome VARCHAR(50),
  Documento_Identità VARCHAR(20),
  Email VARCHAR(100),
  Telefono VARCHAR(15)
);

CREATE TABLE Veicolo (
  ID_Veicolo SERIAL PRIMARY KEY,
  Modello VARCHAR(50),
  Capacità INT,
  Tipo VARCHAR(30)
);

CREATE TABLE Tratta (
  ID_Tratta SERIAL PRIMARY KEY,
  Origine VARCHAR(100),
  Destinazione VARCHAR(100),
  Distanza_km DECIMAL,
  Durata_min INT
);

CREATE TABLE Viaggio (
  ID_Viaggio SERIAL PRIMARY KEY,
  Data_Partenza TIMESTAMP,
  Data_Arrivo TIMESTAMP,
  ID_Tratta INT REFERENCES Tratta(ID_Tratta),
  ID_Veicolo INT REFERENCES Veicolo(ID_Veicolo)
);

CREATE TABLE Prenotazione (
  ID_Prenotazione SERIAL PRIMARY KEY,
  Data_Prenotazione DATE,
  ID_Cliente INT REFERENCES Cliente(ID_Cliente),
  ID_Viaggio INT REFERENCES Viaggio(ID_Viaggio)
);

CREATE TABLE Biglietto (
  ID_Biglietto SERIAL PRIMARY KEY,
  Numero_Posto VARCHAR(10),
  Classe VARCHAR(20),
  Prezzo DECIMAL(10,2),
  Stato VARCHAR(20),
  Data_Emissione DATE,
  ID_Prenotazione INT REFERENCES Prenotazione(ID_Prenotazione)
);
