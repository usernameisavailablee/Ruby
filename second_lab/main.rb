require './classes/student.rb'
require './classes/student_short.rb'


str = "id: 123, last_name: Иванов, first_name: Иван, sur_name: Иванович, phone: +7 (111) 111-11-11, tg: @asddsa, mail: ivanov@mail.com, vk: asd"
student = Student.from_string(str)

a = student.print_all()
print a
#bulka = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
# sur_name:'Александрович', tg: '@bagetxxx' , phone:'+7 (999) 999-99-99',
#  mail: 'bulka@gmail.com', git: 'https://github.com/Tsinana')

#bulka1 = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
# sur_name:'Александрович')

#a = bulka1.print_all()
#puts a

#s = Student.from_string("123 Smith John Doe +7 (123) 456-78-90 @johndoe john@example.com https://github.com/johndoe")

#student_short1 = StudentShort.new(bulka)

#student_short = StudentShort.new(nil, '1', 'Smith John Doe https://github.com/johndoe 123456789 @johndoe johndoe@example.com')
#p student_short







