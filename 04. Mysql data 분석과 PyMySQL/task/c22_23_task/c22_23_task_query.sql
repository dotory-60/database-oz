# 데이터베이스 생성
# CREATE DATABASE IF NOT EXISTS PetStay;

# 데이터베이스 사용
USE PetStay;

# 테이블 전체 삭제
DROP TABLE IF EXISTS PetOwners;
DROP TABLE IF EXISTS Pets;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Services;

# 전체 테이블 조회
SHOW TABLES;

# 특정 테이블 조회
DESC PetOwners;

# 테이블 생성
CREATE TABLE PetOwners (
	ownerID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    contact VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Pets (
	petID INT PRIMARY KEY AUTO_INCREMENT,
    ownerID INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    species VARCHAR(20),
    breed VARCHAR(20),
    FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)
);

CREATE TABLE Rooms (
	roomID INT PRIMARY KEY AUTO_INCREMENT,
    roomNumber VARCHAR(5) NOT NULL,
    roomType ENUM('Single', 'Double', 'Twin', 'Suite', 'Deluxe', 'Family', 'VIP'),
    pricePerNight DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Reservations (
	reservationID INT PRIMARY KEY AUTO_INCREMENT,
    petID INT NOT NULL,
    roomID INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    CHECK (endDate >= startDate), 
    FOREIGN KEY (petID) REFERENCES Pets(petID),
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

CREATE TABLE Services (
	serviceID INT PRIMARY KEY AUTO_INCREMENT,
    reservationID INT NOT NULL,
    serviceName ENUM (
		'Agility',
        'Swimming',
        'FieldPlay',
        'Grooming_Hair',
        'Grooming_Nail',
        'PremiumMeal'
    ),
    servicePrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (reservationID) REFERENCES Reservations(reservationID)
);



