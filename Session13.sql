drop database Exercise1;
CREATE DATABASE Exercise1;
DROP TABLE IF EXISTS Borrow;
DROP TABLE IF EXISTS Reader;
DROP TABLE IF EXISTS Book;

-- Bảng độc giả
CREATE TABLE Reader (
    reader_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
	birthday DATE,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Bảng sách
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    publisher VARCHAR(100),
    year INT,
    category VARCHAR(50)
);

-- Bảng mượn sách
CREATE TABLE Borrow (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    reader_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (reader_id) REFERENCES Reader(reader_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

