require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'
require './classes/students_list_json.rb'
require './classes/student_list_yaml.rb'
require './classes/student_list_super.rb'
require './classes/studeent_list_strategy.rb'
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



# Добавление студента
student = Student.new(id: 1, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")
student1 = Student.new(id: 2, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")
