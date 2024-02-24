#!/bin/bash

DB_NAME="Gamers"
DB_USER="Gamer"
DB_PASS="nimda"
TABLE_NAME="gamers-eu"

# Logowanie do PostgreSQL jako superużytkownik i wykonanie poleceń SQL
sudo -u postgres psql <<EOF

-- Tworzenie użytkownika bazy danych
CREATE USER $DB_USER WITH PASSWORD '$DB_PASS';

-- Tworzenie nowej bazy danych
CREATE DATABASE $DB_NAME OWNER $DB_USER;

-- Łączenie z nowo utworzoną bazą danych
\c $DB_NAME

-- Tworzenie tabeli użytkowników
CREATE TABLE $TABLE_NAME (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50)
);

-- Wstawianie przykładowych rekordów
INSERT INTO $TABLE_NAME (imie, nazwisko) VALUES 
('Jan', 'Kowalski'),
('Anna', 'Nowak'),
('Piotr', 'Wiśniewski'),
('Katarzyna', 'Wójcik'),
('Paweł', 'Kowalczyk'),
('Agnieszka', 'Lewandowska'),
('Tomasz', 'Zieliński'),
('Maria', 'Szymańska'),
('Marcin', 'Woźniak'),
('Ewa', 'Dąbrowska');

EOF

echo "Good"
