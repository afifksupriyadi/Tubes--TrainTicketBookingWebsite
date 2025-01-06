CREATE database keretakuy;
use keretakuy;

-- Create User table
create table user (
	idUser int(3) zerofill auto_increment primary key,
    nama VARCHAR(50),
	email VARCHAR(30),
    gender ENUM('Laki-laki','Perempuan'),
    tanggalLahir DATE,
    username VARCHAR(20),
    passwrd VARCHAR(20)
);

-- Create Kereta table
CREATE TABLE Kereta (
    idKereta INT(2) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    kapasitas INT NOT NULL,
    hargaKereta INT
);
INSERT INTO Kereta (nama, kapasitas,hargaKereta)
VALUES
('Pasundan', 10,500),
('Pangandaran', 10,1000),
('Argo Wilis', 10,1200),
('Brawijaya', 10, 1300);
select * from Kereta;


-- Create Stasiun table
CREATE TABLE Stasiun (
    idStasiun INT(3) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO Stasiun (nama)
VALUES
('Bandung'),
('Tasikmalaya'),
('Ciamis'),
('Banjar'),
('Kroya'),
('Yogyakarta'),
('Sragen'),
('Madiun'),
('Jombang'),
('Surabaya'),
('Jakarta'),
('Bekasi'),
('Cimahi'),
('Cilacap');
INSERT INTO Stasiun (nama)
VALUES
('Cipeundeuy'),
('Kutoarjo'),
('Solo Balapan'),
('Mojokerto'),
('Surabaya Gubeng'),
('Malang'),
('Malang Kotalama'),
('Kepanjen'),
('Wlingi'),
('Blitar'),
('Tulungagung'),
('Kediri'),
('Nganjuk'),
('Cirebon'),
('Cikarang'),
('Jatinegara'),
('Gambir');

-- Create Rute table
CREATE TABLE Rute (
    idRute INT AUTO_INCREMENT PRIMARY KEY,
    idKereta INT(2) ZEROFILL,
    idStasiunAsal INT(3) ZEROFILL,
    idStasiunTujuan INT(3) ZEROFILL,
    departureTime TIME NOT NULL,
    arrivalTime TIME NOT NULL,
    distance INT NOT NULL,
    capacity INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (idKereta) REFERENCES Kereta(idKereta),
    FOREIGN KEY (idStasiunAsal) REFERENCES Stasiun(idStasiun),
    FOREIGN KEY (idStasiunTujuan) REFERENCES Stasiun(idStasiun)
) ENGINE=InnoDB;
-- Data untuk kereta Pasundan pada tanggal 6, 7, 8, 9, dan 10 Januari 2025
INSERT INTO Rute (idKereta, idStasiunAsal, idStasiunTujuan, departureTime, arrivalTime, distance, capacity, date)
VALUES
-- 6 Januari 2025
(01, 001, 002, '06:00:00', '07:30:00', 70, 10, '2025-01-06'),-- Bandung to Tasikmalaya
(01, 002, 003, '07:45:00', '08:15:00', 40, 10, '2025-01-06'),-- Tasikmalaya to Ciamis
(01, 003, 004, '08:30:00', '09:00:00', 40, 10, '2025-01-06'),-- Ciamis to Banjar
(01, 004, 005, '09:15:00', '10:45:00', 50, 10, '2025-01-06'),-- Banjar to Kroya
(01, 005, 006, '11:00:00', '13:00:00', 120, 10, '2025-01-06'),-- Kroya to Yogyakarta
(01, 006, 007, '13:15:00', '14:45:00', 80, 10, '2025-01-06'),-- Yogyakarta to Sragen
(01, 007, 008, '15:00:00', '16:30:00', 100, 10, '2025-01-06'),-- Sragen to Madiun
(01, 008, 009, '16:45:00', '17:45:00', 110, 10, '2025-01-06'),-- Madiun to Jombang
(01, 009, 010, '18:00:00', '19:30:00', 90, 10, '2025-01-06'),-- Jombang to Surabaya
-- 7 Januari 2025
(01, 001, 002, '06:00:00', '07:30:00', 70, 10, '2025-01-07'),
(01, 002, 003, '07:45:00', '08:15:00', 40, 10, '2025-01-07'),
(01, 003, 004, '08:30:00', '09:00:00', 40, 10, '2025-01-07'),
(01, 004, 005, '09:15:00', '10:45:00', 50, 10, '2025-01-07'),
(01, 005, 006, '11:00:00', '13:00:00', 120, 10, '2025-01-07'),
(01, 006, 007, '13:15:00', '14:45:00', 80, 10, '2025-01-07'),
(01, 007, 008, '15:00:00', '16:30:00', 100, 10, '2025-01-07'),
(01, 008, 009, '16:45:00', '17:45:00', 110, 10, '2025-01-07'),
(01, 009, 010, '18:00:00', '19:30:00', 90, 10, '2025-01-07'),
-- 8 Januari 2025
(01, 001, 002, '06:00:00', '07:30:00', 70, 10, '2025-01-08'),
(01, 002, 003, '07:45:00', '08:15:00', 40, 10, '2025-01-08'),
(01, 003, 004, '08:30:00', '09:00:00', 40, 10, '2025-01-08'),
(01, 004, 005, '09:15:00', '10:45:00', 50, 10, '2025-01-08'),
(01, 005, 006, '11:00:00', '13:00:00', 120, 10, '2025-01-08'),
(01, 006, 007, '13:15:00', '14:45:00', 80, 10, '2025-01-08'),
(01, 007, 008, '15:00:00', '16:30:00', 100, 10, '2025-01-08'),
(01, 008, 009, '16:45:00', '17:45:00', 110, 10, '2025-01-08'),
(01, 009, 010, '18:00:00', '19:30:00', 90, 10, '2025-01-08'),
-- 9 Januari 2025
(01, 001, 002, '06:00:00', '07:30:00', 70, 10, '2025-01-09'),
(01, 002, 003, '07:45:00', '08:15:00', 40, 10, '2025-01-09'),
(01, 003, 004, '08:30:00', '09:00:00', 40, 10, '2025-01-09'),
(01, 004, 005, '09:15:00', '10:45:00', 50, 10, '2025-01-09'),
(01, 005, 006, '11:00:00', '13:00:00', 120, 10, '2025-01-09'),
(01, 006, 007, '13:15:00', '14:45:00', 80, 10, '2025-01-09'),
(01, 007, 008, '15:00:00', '16:30:00', 100, 10, '2025-01-09'),
(01, 008, 009, '16:45:00', '17:45:00', 110, 10, '2025-01-09'),
(01, 009, 010, '18:00:00', '19:30:00', 90, 10, '2025-01-09'),
-- 10 Januari 2025
(01, 001, 002, '06:00:00', '07:30:00', 70, 10, '2025-01-10'),
(01, 002, 003, '07:45:00', '08:15:00', 40, 10, '2025-01-10'),
(01, 003, 004, '08:30:00', '09:00:00', 40, 10, '2025-01-10'),
(01, 004, 005, '09:15:00', '10:45:00', 50, 10, '2025-01-10'),
(01, 005, 006, '11:00:00', '13:00:00', 120, 10, '2025-01-10'),
(01, 006, 007, '13:15:00', '14:45:00', 80, 10, '2025-01-10'),
(01, 007, 008, '15:00:00', '16:30:00', 100, 10, '2025-01-10'),
(01, 008, 009, '16:45:00', '17:45:00', 110, 10, '2025-01-10'),
(01, 009, 010, '18:00:00', '19:30:00', 90, 10, '2025-01-10');


-- Data untuk kereta Pangandaran pada tanggal 6, 7, 8, 9, dan 10 Januari 2025
INSERT INTO Rute (idKereta, idStasiunAsal, idStasiunTujuan, departureTime, arrivalTime, distance, capacity, date)
VALUES
-- 6 Januari 2025
(02, 011, 012, '09:30:00', '09:45:00', 20, 10, '2025-01-06'), -- Jakarta to Bekasi
(02, 012, 013, '09:50:00', '10:30:00', 120, 10, '2025-01-06'), -- Bekasi to Cimahi
(02, 013, 001, '10:50:00', '11:15:00', 10, 10, '2025-01-06'), -- Cimahi to Bandung
(02, 001, 002, '11:15:00', '13:00:00', 70, 10, '2025-01-06'), -- Bandung to Tasikmalaya
(02, 002, 003, '13:15:00', '13:45:00', 40, 10, '2025-01-06'), -- Tasikmalaya to Ciamis
(02, 003, 004, '14:00:00', '14:30:00', 40, 10, '2025-01-06'), -- Ciamis to Banjar
(02, 004, 014, '14:45:00', '16:00:00', 70, 10, '2025-01-06'), -- Banjar to Cilacap
-- 7 Januari 2025
(02, 011, 012, '09:30:00', '09:45:00', 20, 10, '2025-01-07'), -- Jakarta to Bekasi
(02, 012, 013, '09:50:00', '10:30:00', 120, 10, '2025-01-07'), -- Bekasi to Cimahi
(02, 013, 001, '10:50:00', '11:15:00', 10, 10, '2025-01-07'), -- Cimahi to Bandung
(02, 001, 002, '11:15:00', '13:00:00', 70, 10, '2025-01-07'), -- Bandung to Tasikmalaya
(02, 002, 003, '13:15:00', '13:45:00', 40, 10, '2025-01-07'), -- Tasikmalaya to Ciamis
(02, 003, 004, '14:00:00', '14:30:00', 40, 10, '2025-01-07'), -- Ciamis to Banjar
(02, 004, 014, '14:45:00', '16:00:00', 70, 10, '2025-01-07'), -- Banjar to Cilacap
-- 8 Januari 2025
(02, 011, 012, '09:30:00', '09:45:00', 20, 10, '2025-01-08'), -- Jakarta to Bekasi
(02, 012, 013, '09:50:00', '10:30:00', 120, 10, '2025-01-08'), -- Bekasi to Cimahi
(02, 013, 001, '10:50:00', '11:15:00', 10, 10, '2025-01-08'), -- Cimahi to Bandung
(02, 001, 002, '11:15:00', '13:00:00', 70, 10, '2025-01-08'), -- Bandung to Tasikmalaya
(02, 002, 003, '13:15:00', '13:45:00', 40, 10, '2025-01-08'), -- Tasikmalaya to Ciamis
(02, 003, 004, '14:00:00', '14:30:00', 40, 10, '2025-01-08'), -- Ciamis to Banjar
(02, 004, 014, '14:45:00', '16:00:00', 70, 10, '2025-01-08'), -- Banjar to Cilacap
-- 9 Januari 2025
(02, 011, 012, '09:30:00', '09:45:00', 20, 10, '2025-01-09'), -- Jakarta to Bekasi
(02, 012, 013, '09:50:00', '10:30:00', 120, 10, '2025-01-09'), -- Bekasi to Cimahi
(02, 013, 001, '10:50:00', '11:15:00', 10, 10, '2025-01-09'), -- Cimahi to Bandung
(02, 001, 002, '11:15:00', '13:00:00', 70, 10, '2025-01-09'), -- Bandung to Tasikmalaya
(02, 002, 003, '13:15:00', '13:45:00', 40, 10, '2025-01-09'), -- Tasikmalaya to Ciamis
(02, 003, 004, '14:00:00', '14:30:00', 40, 10, '2025-01-09'), -- Ciamis to Banjar
(02, 004, 014, '14:45:00', '16:00:00', 70, 10, '2025-01-09'), -- Banjar to Cilacap
-- 10 Januari 2025
(02, 011, 012, '09:30:00', '09:45:00', 20, 10, '2025-01-10'), -- Jakarta to Bekasi
(02, 012, 013, '09:50:00', '10:30:00', 120, 10, '2025-01-10'), -- Bekasi to Cimahi
(02, 013, 001, '10:50:00', '11:15:00', 10, 10, '2025-01-10'), -- Cimahi to Bandung
(02, 001, 002, '11:15:00', '13:00:00', 70, 10, '2025-01-10'), -- Bandung to Tasikmalaya
(02, 002, 003, '13:15:00', '13:45:00', 40, 10, '2025-01-10'), -- Tasikmalaya to Ciamis
(02, 003, 004, '14:00:00', '14:30:00', 40, 10, '2025-01-10'), -- Ciamis to Banjar
(02, 004, 014, '14:45:00', '16:00:00', 70, 10, '2025-01-10'); -- Banjar to Cilacap


-- Data untuk kereta Argo Wilis pada tanggal 6, 7, 8, dan 9 Januari 2025
INSERT INTO Rute (idKereta, idStasiunAsal, idStasiunTujuan, departureTime, arrivalTime, distance, capacity, date)
VALUES
-- 6 Januari 2025
(03, 001, 015, '05:00:00', '06:30:00', 110, 10, '2025-01-06'), -- Bandung to Cipeundeuy
(03, 015, 002, '06:45:00', '08:15:00', 120, 10, '2025-01-06'), -- Cipeundeuy to Tasikmalaya
(03, 002, 003, '08:30:00', '09:00:00', 40, 10, '2025-01-06'), -- Tasikmalaya to Ciamis
(03, 003, 004, '09:15:00', '09:45:00', 40, 10, '2025-01-06'), -- Ciamis to Banjar
(03, 004, 005, '10:00:00', '11:30:00', 80, 10, '2025-01-06'), -- Banjar to Kroya
(03, 005, 016, '11:45:00', '13:15:00', 100, 10, '2025-01-06'), -- Kroya to Kutoarjo
(03, 016, 006, '13:30:00', '15:00:00', 110, 10, '2025-01-06'), -- Kutoarjo to Yogyakarta
(03, 006, 017, '15:15:00', '16:45:00', 70, 10, '2025-01-06'), -- Yogyakarta to Solo Balapan
(03, 017, 008, '17:00:00', '18:30:00', 100, 10, '2025-01-06'), -- Solo Balapan to Madiun
(03, 008, 009, '18:45:00', '19:45:00', 110, 10, '2025-01-06'), -- Madiun to Jombang
(03, 009, 018, '20:00:00', '20:45:00', 50, 10, '2025-01-06'), -- Jombang to Mojokerto
(03, 018, 019, '21:00:00', '22:00:00', 60, 10, '2025-01-06'), -- Mojokerto to Surabaya Gubeng
-- 7 Januari 2025
(03, 001, 015, '05:00:00', '06:30:00', 110, 10, '2025-01-07'),
(03, 015, 002, '06:45:00', '08:15:00', 120, 10, '2025-01-07'),
(03, 002, 003, '08:30:00', '09:00:00', 40, 10, '2025-01-07'),
(03, 003, 004, '09:15:00', '09:45:00', 40, 10, '2025-01-07'),
(03, 004, 005, '10:00:00', '11:30:00', 80, 10, '2025-01-07'),
(03, 005, 016, '11:45:00', '13:15:00', 100, 10, '2025-01-07'),
(03, 016, 006, '13:30:00', '15:00:00', 110, 10, '2025-01-07'),
(03, 006, 017, '15:15:00', '16:45:00', 70, 10, '2025-01-07'),
(03, 017, 008, '17:00:00', '18:30:00', 100, 10, '2025-01-07'),
(03, 008, 009, '18:45:00', '19:45:00', 110, 10, '2025-01-07'),
(03, 009, 018, '20:00:00', '20:45:00', 50, 10, '2025-01-07'),
(03, 018, 019, '21:00:00', '22:00:00', 60, 10, '2025-01-07'),
-- 8 Januari 2025
(03, 001, 015, '05:00:00', '06:30:00', 110, 10, '2025-01-08'),
(03, 015, 002, '06:45:00', '08:15:00', 120, 10, '2025-01-08'),
(03, 002, 003, '08:30:00', '09:00:00', 40, 10, '2025-01-08'),
(03, 003, 004, '09:15:00', '09:45:00', 40, 10, '2025-01-08'),
(03, 004, 005, '10:00:00', '11:30:00', 80, 10, '2025-01-08'),
(03, 005, 016, '11:45:00', '13:15:00', 100, 10, '2025-01-08'),
(03, 016, 006, '13:30:00', '15:00:00', 110, 10, '2025-01-08'),
(03, 006, 017, '15:15:00', '16:45:00', 70, 10, '2025-01-08'),
(03, 017, 008, '17:00:00', '18:30:00', 100, 10, '2025-01-08'),
(03, 008, 009, '18:45:00', '19:45:00', 110, 10, '2025-01-08'),
(03, 009, 018, '20:00:00', '20:45:00', 50, 10, '2025-01-08'),
(03, 018, 019, '21:00:00', '22:00:00', 60, 10, '2025-01-08'),
-- 9 Januari 2025
(03, 001, 015, '05:00:00', '06:30:00', 110, 10, '2025-01-09'),
(03, 015, 002, '06:45:00', '08:15:00', 120, 10, '2025-01-09'),
(03, 002, 003, '08:30:00', '09:00:00', 40, 10, '2025-01-09'),
(03, 003, 004, '09:15:00', '09:45:00', 40, 10, '2025-01-09'),
(03, 004, 005, '10:00:00', '11:30:00', 80, 10, '2025-01-09'),
(03, 005, 016, '11:45:00', '13:15:00', 100, 10, '2025-01-09'),
(03, 016, 006, '13:30:00', '15:00:00', 110, 10, '2025-01-09'),
(03, 006, 017, '15:15:00', '16:45:00', 70, 10, '2025-01-09'),
(03, 017, 008, '17:00:00', '18:30:00', 100, 10, '2025-01-09'),
(03, 008, 009, '18:45:00', '19:45:00', 110, 10, '2025-01-09'),
(03, 009, 018, '20:00:00', '20:45:00', 50, 10, '2025-01-09'),
(03, 018, 019, '21:00:00', '22:00:00', 60, 10, '2025-01-09'),
-- 10 Januari 2025
(03, 001, 015, '05:00:00', '06:30:00', 110, 10, '2025-01-10'),
(03, 015, 002, '06:45:00', '08:15:00', 120, 10, '2025-01-10'),
(03, 002, 003, '08:30:00', '09:00:00', 40, 10, '2025-01-10'),
(03, 003, 004, '09:15:00', '09:45:00', 40, 10, '2025-01-10'),
(03, 004, 005, '10:00:00', '11:30:00', 80, 10, '2025-01-10'),
(03, 005, 016, '11:45:00', '13:15:00', 100, 10, '2025-01-10'),
(03, 016, 006, '13:30:00', '15:00:00', 110, 10, '2025-01-10'),
(03, 006, 017, '15:15:00', '16:45:00', 70, 10, '2025-01-10'),
(03, 017, 008, '17:00:00', '18:30:00', 100, 10, '2025-01-10'),
(03, 008, 009, '18:45:00', '19:45:00', 110, 10, '2025-01-10'),
(03, 009, 018, '20:00:00', '20:45:00', 50, 10, '2025-01-10'),
(03, 018, 019, '21:00:00', '22:00:00', 60, 10, '2025-01-10');

-- Data untuk kereta Brawijaya pada tanggal 6, 7, 8, 9, dan 10 Januari 2025
INSERT INTO Rute (idKereta, idStasiunAsal, idStasiunTujuan, departureTime, arrivalTime, distance, capacity, date)
VALUES
-- 6 Januari 2025
(04, 020, 021, '05:00:00', '05:10:00', 10, 10, '2025-01-06'), -- Malang to Malang Kotalama
(04, 021, 022, '05:20:00', '05:50:00', 30, 10, '2025-01-06'), -- Malang Kotalama to Kepanjen
(04, 022, 023, '06:00:00', '06:40:00', 40, 10, '2025-01-06'), -- Kepanjen to Wlingi
(04, 023, 024, '06:50:00', '07:20:00', 30, 10, '2025-01-06'), -- Wlingi to Blitar
(04, 024, 025, '07:30:00', '08:10:00', 40, 10, '2025-01-06'), -- Blitar to Tulungagung
(04, 025, 026, '08:20:00', '08:50:00', 30, 10, '2025-01-06'), -- Tulungagung to Kediri
(04, 026, 008, '09:00:00', '09:30:00', 40, 10, '2025-01-06'), -- Kediri to Nganjuk
(04, 008, 017, '09:40:00', '11:00:00', 100, 10, '2025-01-06'), -- Nganjuk to Solo Balapan
(04, 017, 006, '11:15:00', '12:30:00', 110, 10, '2025-01-06'), -- Solo Balapan to Yogyakarta
(04, 006, 016, '12:40:00', '13:30:00', 70, 10, '2025-01-06'), -- Yogyakarta to Kutoarjo
(04, 016, 005, '13:45:00', '15:15:00', 100, 10, '2025-01-06'), -- Kutoarjo to Kroya
(04, 005, 027, '15:30:00', '17:00:00', 150, 10, '2025-01-06'), -- Kroya to Cirebon
(04, 027, 028, '17:20:00', '18:50:00', 140, 10, '2025-01-06'), -- Cirebon to Cikarang
(04, 028, 029, '19:00:00', '19:30:00', 30, 10, '2025-01-06'), -- Cikarang to Jatinegara
(04, 029, 030, '19:40:00', '20:00:00', 20, 10, '2025-01-06'), -- Jatinegara to Gambir
-- 7 Januari 2025
(04, 020, 021, '05:00:00', '05:10:00', 10, 10, '2025-01-07'), -- Malang to Malang Kotalama
(04, 021, 022, '05:20:00', '05:50:00', 30, 10, '2025-01-07'), -- Malang Kotalama to Kepanjen
(04, 022, 023, '06:00:00', '06:40:00', 40, 10, '2025-01-07'), -- Kepanjen to Wlingi
(04, 023, 024, '06:50:00', '07:20:00', 30, 10, '2025-01-07'), -- Wlingi to Blitar
(04, 024, 025, '07:30:00', '08:10:00', 40, 10, '2025-01-07'), -- Blitar to Tulungagung
(04, 025, 026, '08:20:00', '08:50:00', 30, 10, '2025-01-07'), -- Tulungagung to Kediri
(04, 026, 008, '09:00:00', '09:30:00', 40, 10, '2025-01-07'), -- Kediri to Nganjuk
(04, 008, 017, '09:40:00', '11:00:00', 100, 10, '2025-01-07'), -- Nganjuk to Solo Balapan
(04, 017, 006, '11:15:00', '12:30:00', 110, 10, '2025-01-07'), -- Solo Balapan to Yogyakarta
(04, 006, 016, '12:40:00', '13:30:00', 70, 10, '2025-01-07'), -- Yogyakarta to Kutoarjo
(04, 016, 005, '13:45:00', '15:15:00', 100, 10, '2025-01-07'), -- Kutoarjo to Kroya
(04, 005, 027, '15:30:00', '17:00:00', 150, 10, '2025-01-07'), -- Kroya to Cirebon
(04, 027, 028, '17:20:00', '18:50:00', 140, 10, '2025-01-07'), -- Cirebon to Cikarang
(04, 028, 029, '19:00:00', '19:30:00', 30, 10, '2025-01-07'), -- Cikarang to Jatinegara
(04, 029, 030, '19:40:00', '20:00:00', 20, 10, '2025-01-07'), -- Jatinegara to Gambir
-- 8 Januari 2025
(04, 020, 021, '05:00:00', '05:10:00', 10, 10, '2025-01-08'), -- Malang to Malang Kotalama
(04, 021, 022, '05:20:00', '05:50:00', 30, 10, '2025-01-08'), -- Malang Kotalama to Kepanjen
(04, 022, 023, '06:00:00', '06:40:00', 40, 10, '2025-01-08'), -- Kepanjen to Wlingi
(04, 023, 024, '06:50:00', '07:20:00', 30, 10, '2025-01-08'), -- Wlingi to Blitar
(04, 024, 025, '07:30:00', '08:10:00', 40, 10, '2025-01-08'), -- Blitar to Tulungagung
(04, 025, 026, '08:20:00', '08:50:00', 30, 10, '2025-01-08'), -- Tulungagung to Kediri
(04, 026, 008, '09:00:00', '09:30:00', 40, 10, '2025-01-08'), -- Kediri to Nganjuk
(04, 008, 017, '09:40:00', '11:00:00', 100, 10, '2025-01-08'), -- Nganjuk to Solo Balapan
(04, 017, 006, '11:15:00', '12:30:00', 110, 10, '2025-01-08'), -- Solo Balapan to Yogyakarta
(04, 006, 016, '12:40:00', '13:30:00', 70, 10, '2025-01-08'), -- Yogyakarta to Kutoarjo
(04, 016, 005, '13:45:00', '15:15:00', 100, 10, '2025-01-08'), -- Kutoarjo to Kroya
(04, 005, 027, '15:30:00', '17:00:00', 150, 10, '2025-01-08'), -- Kroya to Cirebon
(04, 027, 028, '17:20:00', '18:50:00', 140, 10, '2025-01-08'), -- Cirebon to Cikarang
(04, 028, 029, '19:00:00', '19:30:00', 30, 10, '2025-01-08'), -- Cikarang to Jatinegara
(04, 029, 030, '19:40:00', '20:00:00', 20, 10, '2025-01-08'), -- Jatinegara to Gambir
-- 9 Januari 2025
(04, 020, 021, '05:00:00', '05:10:00', 10, 10, '2025-01-09'), -- Malang to Malang Kotalama
(04, 021, 022, '05:20:00', '05:50:00', 30, 10, '2025-01-09'), -- Malang Kotalama to Kepanjen
(04, 022, 023, '06:00:00', '06:40:00', 40, 10, '2025-01-09'), -- Kepanjen to Wlingi
(04, 023, 024, '06:50:00', '07:20:00', 30, 10, '2025-01-09'), -- Wlingi to Blitar
(04, 024, 025, '07:30:00', '08:10:00', 40, 10, '2025-01-09'), -- Blitar to Tulungagung
(04, 025, 026, '08:20:00', '08:50:00', 30, 10, '2025-01-09'), -- Tulungagung to Kediri
(04, 026, 008, '09:00:00', '09:30:00', 40, 10, '2025-01-09'), -- Kediri to Nganjuk
(04, 008, 017, '09:40:00', '11:00:00', 100, 10, '2025-01-09'), -- Nganjuk to Solo Balapan
(04, 017, 006, '11:15:00', '12:30:00', 110, 10, '2025-01-09'), -- Solo Balapan to Yogyakarta
(04, 006, 016, '12:40:00', '13:30:00', 70, 10, '2025-01-09'), -- Yogyakarta to Kutoarjo
(04, 016, 005, '13:45:00', '15:15:00', 100, 10, '2025-01-09'), -- Kutoarjo to Kroya
(04, 005, 027, '15:30:00', '17:00:00', 150, 10, '2025-01-09'), -- Kroya to Cirebon
(04, 027, 028, '17:20:00', '18:50:00', 140, 10, '2025-01-09'), -- Cirebon to Cikarang
(04, 028, 029, '19:00:00', '19:30:00', 30, 10, '2025-01-09'), -- Cikarang to Jatinegara
(04, 029, 030, '19:40:00', '20:00:00', 20, 10, '2025-01-09'), -- Jatinegara to Gambir
-- 10 Januari 2025
(04, 020, 021, '05:00:00', '05:10:00', 10, 10, '2025-01-10'), -- Malang to Malang Kotalama
(04, 021, 022, '05:20:00', '05:50:00', 30, 10, '2025-01-10'), -- Malang Kotalama to Kepanjen
(04, 022, 023, '06:00:00', '06:40:00', 40, 10, '2025-01-10'), -- Kepanjen to Wlingi
(04, 023, 024, '06:50:00', '07:20:00', 30, 10, '2025-01-10'), -- Wlingi to Blitar
(04, 024, 025, '07:30:00', '08:10:00', 40, 10, '2025-01-10'), -- Blitar to Tulungagung
(04, 025, 026, '08:20:00', '08:50:00', 30, 10, '2025-01-10'), -- Tulungagung to Kediri
(04, 026, 008, '09:00:00', '09:30:00', 40, 10, '2025-01-10'), -- Kediri to Nganjuk
(04, 008, 017, '09:40:00', '11:00:00', 100, 10, '2025-01-10'), -- Nganjuk to Solo Balapan
(04, 017, 006, '11:15:00', '12:30:00', 110, 10, '2025-01-10'), -- Solo Balapan to Yogyakarta
(04, 006, 016, '12:40:00', '13:30:00', 70, 10, '2025-01-10'), -- Yogyakarta to Kutoarjo
(04, 016, 005, '13:45:00', '15:15:00', 100, 10, '2025-01-10'), -- Kutoarjo to Kroya
(04, 005, 027, '15:30:00', '17:00:00', 150, 10, '2025-01-10'), -- Kroya to Cirebon
(04, 027, 028, '17:20:00', '18:50:00', 140, 10, '2025-01-10'), -- Cirebon to Cikarang
(04, 028, 029, '19:00:00', '19:30:00', 30, 10, '2025-01-10'), -- Cikarang to Jatinegara
(04, 029, 030, '19:40:00', '20:00:00', 20, 10, '2025-01-10'); -- Jatinegara to Gambir

-- Table Penumpang
CREATE TABLE Penumpang (
    idPenumpang INT AUTO_INCREMENT PRIMARY KEY,
    namaPenumpang VARCHAR(50) NOT NULL,
    emailPenumpang VARCHAR(30) NOT NULL,
    idUser INT(3) ZEROFILL NOT NULL,
    FOREIGN KEY (idUser) REFERENCES User(idUser)
) ENGINE=InnoDB;

-- Table TicketBooked
CREATE TABLE TicketBooked (
    idBooked INT AUTO_INCREMENT PRIMARY KEY,
    idUser INT(3) ZEROFILL NOT NULL, -- ID pembeli tiket (dari User)
    idPenumpang INT NOT NULL, -- ID penumpang (dari Penumpang)
    idKereta INT(2) ZEROFILL NOT NULL, -- ID kereta (dari Kereta)
    idStasiunAsal INT(3) ZEROFILL NOT NULL, -- ID stasiun asal (dari Stasiun)
    idStasiunTujuan INT(3) ZEROFILL NOT NULL, -- ID stasiun tujuan (dari Stasiun)
    departureTime TIME NOT NULL, -- Waktu keberangkatan
    arrivalTime TIME NOT NULL, -- Waktu kedatangan
    tanggalKeberangkatan DATE NOT NULL, -- Tanggal keberangkatan
    harga INT NOT NULL, -- Harga tiket
    waktuBooking DATETIME NOT NULL DEFAULT NOW(), -- Waktu booking

    -- Foreign Key Constraints
    FOREIGN KEY (idUser) REFERENCES User(idUser),
    FOREIGN KEY (idPenumpang) REFERENCES Penumpang(idPenumpang),
    FOREIGN KEY (idKereta) REFERENCES Kereta(idKereta),
    FOREIGN KEY (idStasiunAsal) REFERENCES Stasiun(idStasiun),
    FOREIGN KEY (idStasiunTujuan) REFERENCES Stasiun(idStasiun)
) ENGINE=InnoDB;








-- QUERY SELECT ALL DATA
select * from user;
select * from kereta;
select * from stasiun;
select * from rute;

-- QUERY HAPUS TABLE DAN ISINYA, Jalankan secara berurutan
drop table TicketBooked;
drop table penumpang;
drop table rute;
drop table stasiun;
drop table kereta;
drop table user;


-- QUERY COBA-COBA
-- Query Menampilkan List Tanggal
SELECT DISTINCT date FROM Rute ORDER BY date ASC;

-- Query Searching
SELECT 
    k.nama AS namaKereta,
    k.idKereta AS nomorKereta,
    s1.nama AS stasiunAsal,
    s2.nama AS stasiunTujuan,
    MIN(r1.departureTime) AS departureTime,
    MAX(r2.arrivalTime) AS arrivalTime,
    MIN(r1.capacity) AS availableCapacity,
    SUM(rJoin.distance) AS totalDistance,
    (SUM(rJoin.distance) * k.hargaKereta) AS harga, 
    r1.date AS tanggalKeberangkatan 
FROM Rute r1
JOIN Rute r2 ON r1.idKereta = r2.idKereta
JOIN Kereta k ON r1.idKereta = k.idKereta
JOIN Stasiun s1 ON r1.idStasiunAsal = s1.idStasiun
JOIN Stasiun s2 ON r2.idStasiunTujuan = s2.idStasiun
JOIN Rute rJoin ON r1.idKereta = rJoin.idKereta 
    AND rJoin.idRute BETWEEN r1.idRute AND r2.idRute
WHERE s1.nama = 'Bandung' -- Stasiun Asal (Input User)
  AND s2.nama = 'Banjar' -- Stasiun Tujuan (Input User)
  AND r1.date = '2025-01-10' -- Tanggal Keberangkatan (Input User)
  AND r2.date = '2025-01-10' -- Tanggal Keberangkatan sama
GROUP BY k.nama, k.idKereta, s1.nama, s2.nama, r1.date, k.hargaKereta
HAVING MIN(r1.capacity) >= 1 -- Kapasitas minimal (Input User)
ORDER BY departureTime;

-- Query BOOKING Step(1) - Add data penumpang
-- Lihat di PenumpangDAO method insertPenumpang()

-- Query BOOKING Step(2) - Reduce Capacity table rute
UPDATE Rute r
JOIN Kereta k ON r.idKereta = k.idKereta
SET r.capacity = r.capacity - 1
WHERE k.nama = 'Pasundan'
  AND r.date = '2025-01-06'
  AND r.idRute BETWEEN 
      (SELECT MIN(idRute) FROM Rute WHERE idKereta = k.idKereta 
         AND idStasiunAsal = (SELECT idStasiun FROM Stasiun WHERE nama = 'Bandung')
         AND date = '2025-01-06')
      AND
      (SELECT MAX(idRute) FROM Rute WHERE idKereta = k.idKereta 
         AND idStasiunTujuan = (SELECT idStasiun FROM Stasiun WHERE nama = 'Banjar')
         AND date = '2025-01-06');
         
-- Query BOOKING Step(2) - Add data ticket
-- Lihat di TicketDAO method insertTicket()



-- Query View Ticket by idUser
SELECT 
    tb.idBooked, tb.idUser, u.nama AS namaPembeli, tb.idPenumpang, p.namaPenumpang, 
    tb.idKereta, k.nama AS namaKereta, tb.idStasiunAsal, s1.nama AS stasiunAsal, 
    tb.idStasiunTujuan, s2.nama AS stasiunTujuan, tb.departureTime, tb.arrivalTime, 
    tb.tanggalKeberangkatan, tb.harga, tb.waktuBooking 
FROM TicketBooked tb 
JOIN User u ON tb.idUser = u.idUser 
JOIN Penumpang p ON tb.idPenumpang = p.idPenumpang 
JOIN Kereta k ON tb.idKereta = k.idKereta 
JOIN Stasiun s1 ON tb.idStasiunAsal = s1.idStasiun 
JOIN Stasiun s2 ON tb.idStasiunTujuan = s2.idStasiun 
WHERE tb.idUser = '001' 
ORDER BY tb.idPenumpang ASC;