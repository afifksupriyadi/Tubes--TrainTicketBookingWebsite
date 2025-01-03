INSERT INTO user (nama, email, gender, tanggalLahir, username, passwrd)
VALUES ('John Doe', 'johndoe@gmail.com', 'Laki-laki', '1990-01-01', 'johndoe', 'password123');

INSERT INTO Kereta (nama, kapasitas, hargaKereta)
VALUES ('Pasundan', 10, 500);

INSERT INTO Stasiun (nama)
VALUES ('Bandung'), ('Tasikmalaya'), ('Ciamis');

INSERT INTO Rute (idKereta, idStasiunAsal, idStasiunTujuan, departureTime, arrivalTime, distance, capacity, date)
VALUES (1, 1, 2, '06:00:00', '07:30:00', 70, 10, '2025-01-06');
