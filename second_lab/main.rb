require './classes/student.rb'


bulka = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
 sur_name:'Александрович', tg: '@bagetxxx' , phone:'+7 (999) 999-99-99',
  mail: 'bulka@gmail.com', git: 'https://github.com/Tsinana')

bulka1 = Student.new(id:'1', last_name:'Рупасов', first_name:'Глеб',
 sur_name:'Александрович')

bulka1.set_contacts(phone:'+7 (999) 999-99-22')
bulka1.print_all()



begin
  student = Student.from_string("1,Иванов,Иван,Иванович,+7 (123) 456-78-90,@ivanov,ivanov@example.com,https://github.com/ivanov")
  student.print_all()
rescue InvalidCsvStringError => e
  puts "Error: #{e.message}"
end

#bulka.print_all()

#p bulka1.validate_git()

