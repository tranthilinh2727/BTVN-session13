create database libary_management;
use libary_management;
create table book(
bookId int auto_increment primary key,
  title VARCHAR(100) NOT NULL UNIQUE,
    author VARCHAR(50) NOT NULL,
    publishedYear INT NOT NULL,
    category VARCHAR(50) NOT NULL
);
CREATE TABLE readers (
    readerId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(11),
    CHECK (YEAR(birthDate) > 1900)
);
CREATE TABLE borrows (
    borrowId INT AUTO_INCREMENT PRIMARY KEY,
    borrowDate DATE NOT NULL,
    returnDate DATE,
    bookId INT,
    readerId INT,
    FOREIGN KEY (bookId) REFERENCES books(bookId),
    FOREIGN KEY (readerId) REFERENCES readers(readerId),
    CHECK (borrowDate <= CURRENT_DATE)
);
