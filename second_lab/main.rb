require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'
require './classes/students_list_json.rb'
require './classes/student_list_yaml.rb'
require './classes/student_list_super.rb'
require './classes/studeent_list_strategy.rb'
require_relative './classes/DB_working.rb'
require './classes/student_list_DB.rb'
require 'sqlite3'

a = StudentListDB.new

puts a.student_count
# Добавление студента
student = Student.new(id: 1, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")
student1 = Student.new(id: 2, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")
