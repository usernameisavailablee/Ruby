require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'
require './classes/students_list_json.rb'


# Добавление студента
student = Student.new(id: 1, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")

puts student.to_s()
puts student.last_name()
elements = [1, 2, 3, 4, 5]
data_list = DataListStudentShort.new(elements)

p data_list

