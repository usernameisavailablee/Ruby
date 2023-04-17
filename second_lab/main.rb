require './classes/student.rb'
require './classes/student_short.rb'



#  str = "id: 123, last_name: Иванов, first_name: Иван, sur_name: Иванович, phone: +71111111111, tg: @asddsa, mail: ivanov@mail.com, git_name: asddsa"
#  student = Student.from_string(str)
# # s1 = StudentShort.student_init(student)
# # a = student.print_all()
# # print a


# Student.write_to_txt('./data_files/students_data'," ")


Student.read_from_txt('./data_files/students_data'," ")


students = Student.get_students
students.each do |student|
	puts student.print_all() 
end	







