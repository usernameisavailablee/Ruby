require './classes/student.rb'

oleg = Student.new(1,'Михляев','Олег','Владимирович','+77777777777','@memeladon','loh@loh.com','memeladon')
geo = Student.new(2,'Назаров','Георгий','Григорьевич','+88888888888','@tgtgtg','geopox@geo.ua','githzz')
kresniy_geo = Student.new(3,'Савинян','Шагвел','Парурович')

oleg.print_all()
geo.print_all()
kresniy_geo.print_all()
