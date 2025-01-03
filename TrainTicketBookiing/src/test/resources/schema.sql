CREATE TABLE user (
    idUser INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    email VARCHAR(30),
    gender ENUM('Laki-laki','Perempuan'),
    tanggalLahir DATE,
    username VARCHAR(20),
    passwrd VARCHAR(20)
);

CREATE TABLE Kereta (
    idKereta INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    kapasitas INT NOT NULL,
    hargaKereta INT
);

CREATE TABLE Stasiun (
    idStasiun INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Rute (
    idRute INT PRIMARY KEY AUTO_INCREMENT,
    idKereta INT,
    idStasiunAsal INT,
    idStasiunTujuan INT,
    departureTime TIME NOT NULL,
    arrivalTime TIME NOT NULL,
    distance INT NOT NULL,
    capacity INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (idKereta) REFERENCES Kereta(idKereta),
    FOREIGN KEY (idStasiunAsal) REFERENCES Stasiun(idStasiun),
    FOREIGN KEY (idStasiunTujuan) REFERENCES Stasiun(idStasiun)
);
