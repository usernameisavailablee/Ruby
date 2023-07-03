require 'sqlite3'

# Устанавливаем соединение с базой данных
db = SQLite3::Database.new('./data_files/students.db')

# Создаем таблицу
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    last_name TEXT,
    first_name TEXT,
    sur_name TEXT,
    tg TEXT,
    mail TEXT,
    git_name TEXT,
    phone TEXT
  );
SQL

# Закрываем соединение с базой данных
db.close