require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'


#  str = "id: 123, last_name: Иванов, first_name: Иван, sur_name: Иванович, phone: +71111111111, tg: @asddsa, mail: ivanov@mail.com, git_name: asddsa"
#  student = Student.from_string(str)
# # s1 = StudentShort.student_init(student)
# # a = student.print_all()
# # print a


# Student.write_to_txt('./data_files/students_data'," ")


#Student.read_from_txt('./data_files/students_data'," ")



data = [['Значение 1', 'Значение 2'], ['Значение 3', 'Значение 4']]
table = Data_table.new(data)

value = table.get_element(1, 1)
puts value  # Вывод: Значение 3

elements = [table]

a =  DataListStudentShort.new(elements)
p a
#students = Student.get_students
#students.each do |student|
#	puts student.print_all() 
#end	







