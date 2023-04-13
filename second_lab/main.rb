require './classes/student.rb'


bulka = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
 sur_name:'Александрович', tg: '@bagetxxx' , phone:'+7 (999) 999-99-99',
  mail: 'bulka@gmail.com', git: 'https://github.com/Tsinana')

bulka1 = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
 sur_name:'Александрович')

bulka.print_all()

p bulka1.validate_git()

