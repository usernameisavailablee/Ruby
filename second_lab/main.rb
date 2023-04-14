require './classes/student.rb'
require './classes/student_short.rb'


bulka = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
 sur_name:'Александрович', tg: '@bagetxxx' , phone:'+7 (999) 999-99-99',
  mail: 'bulka@gmail.com', git: 'https://github.com/Tsinana')

bulka1 = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
 sur_name:'Александрович')

student_short1 = StudentShort.new(bulka)

student_short = StudentShort.new(nil, '1', 'Smith John Doe https://github.com/johndoe 123456789 @johndoe johndoe@example.com')
p student_short







