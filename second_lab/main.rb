require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'
require './classes/students_list_json.rb'


# Добавление студента
student = Student.new(id: 1, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")
student1 = Student.new(id: 2, last_name: "Иванов", first_name: "Иван", sur_name: "Иванович")
elements = [1, 2, 3, 4, 5]
data_list = DataListStudentShort.new(elements)

# Создаем экземпляр класса Students_list_JSON, указывая путь к файлу
students_list = Students_list_JSON.new()

students_list.read_from_file("student.json")

students_list.write("student1.json")

p students_list.sort_by_lastname

p students_list.get_student_count

#p students_list.get_student_id(1)
