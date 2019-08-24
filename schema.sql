DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS passwords;
DROP TABLE IF EXISTS tagbindings;
DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
	id INTEGER NOT NULL,
	name VARCHAR(30),
	slug VARCHAR(10) NOT NULL
CREATE TABLE tagbindings (
	id INTEGER NOT NULL PRIMARY KEY autoincrement,
	tag INTEGER NOT NULL,
	post INTEGER NOT NULL
CREATE TABLE passwords (
	id INTEGER NOT NULL PRIMARY KEY autoincrement,
	hash BINARY(128) NOT NULL,
	len INTEGER NOT NULL
CREATE TABLE users (
	id INTEGER NOT NULL PRIMARY KEY autoincrement,
	username VARCHAR(255) NOT NULL,
	password INTEGER,
	FOREIGN KEY(password) REFERENCES passwords(id)
CREATE TABLE posts (
	id INTEGER NOT NULL PRIMARY KEY autoincrement,
	excerpt VARCHAR(200),
	author INTEGER,
	epoch INTEGER,
	FOREIGN KEY(author) REFERENCES users(id)
);
CREATE TABLE comments (
	id INTEGER NOT NULL PRIMARY KEY autoincrement,
	author INTEGER,
	epoch INTEGER,
	post INTEGER NOT NULL,
	FOREIGN KEY(author) REFERENCES users(id),
	FOREIGN KEY(post) REFERENCES posts(id)
);