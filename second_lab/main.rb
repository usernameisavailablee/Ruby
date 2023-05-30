require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'


# Создание объектов класса StudentShort
student1 = StudentShort.new(id: 1, contact_string: "John Doe\tjohndoe\tjohndoe@example.com")
student2 = StudentShort.new(id: 2, contact_string: "Jane Smith\tjanesmith\tjanesmith@example.com")
student3 = StudentShort.new(id: 3, contact_string: "Bob Johnson\tbobjohnson\tbobjohnson@example.com")

# Создание списка студентов
students = [student1, student2, student3]

# Создание экземпляра DataListStudentShort и передача списка студентов
data_list = DataListStudentShort.new(students)

# Выделение элементов по номеру
data_list.select(0)
data_list.select(2)

# Получение выбранных ID
selected_ids = data_list.get_selected
puts "Selected IDs: #{selected_ids}"



