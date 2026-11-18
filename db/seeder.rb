require 'sqlite3'
require_relative '../config'

db = SQLite3::Database.new(DB_PATH)

puts "Använder databasen: #{DB_PATH}"
puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS todos')

puts "🧱 Skapar tabeller..."
db.execute('CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL, 
            description TEXT,
            completed INTEGER DEFAULT 0,
            deadline TEXT,
            category_id INTEGER)')

db.execute('CREATE TABLE categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            responsibilty TEXT NOT NULL)')

puts "🍎 Fyller på med data..."
db.execute('INSERT INTO todos (name, description, completed, deadline, category_id) VALUES ("Köp mjölk", "3 liter mellanmjölk, eko", 1, 2026-11-19, 0)')
db.execute('INSERT INTO todos (name, description, completed, deadline, category_id) VALUES ("Köp julgran", "En rödgran", 0, 2026-12-22, 1)')
db.execute('INSERT INTO todos (name, description, completed, deadline, category_id) VALUES ("Pynta gran", "Glöm inte lamporna i granen och tomten", 0, 2026-12-23, 1)')

db.execute('INSERT INTO categories (responsibilty) VALUES ("me")')
db.execute('INSERT INTO categories (responsibilty) VALUES ("anyone")')

puts "✅ Databasen är seedad!"