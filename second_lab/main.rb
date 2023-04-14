require './classes/student.rb'
require './classes/student_short.rb'


str = "id: 123, last_name: Иванов, first_name: Иван, sur_name: Иванович, phone: +7 (111) 111-11-11, tg: @asddsa, mail: ivanov@mail.com, git_name: asddsa"
student = Student.from_string(str)

a = student.print_all()
print a





