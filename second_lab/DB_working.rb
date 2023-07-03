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

str = "id: 123, last_name: Иванов, first_name: Иван, sur_name: Иванович, phone: +71111111111, tg: @asddsa, mail: ivanov@mail.com, git_name: asddsa"
student = Student.from_string(str)

fields = [student.last_name, student.first_name, student.sur_name, student.tg, student.mail, student.git_name, student.phone]


db.execute('insert into students (last_name, first_name, sur_name, tg, mail, git_name, phone) VALUES (?, ?, ?, ?, ?, ?, ?)', *fields)

results = db.execute("SELECT * FROM students")

puts results
# Закрываем соединение с базой данных
db.close
