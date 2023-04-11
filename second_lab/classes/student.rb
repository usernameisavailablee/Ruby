class Student
  attr_accessor :id, :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git
  def initialize (id, last_name, first_name, sur_name, **contacts)
  	@id = id
    @last_name = last_name
  	@first_name = first_name
  	@sur_name = sur_name
  	@phone = contacts[:phone]
  	@tg = contacts[:tg]
  	@mail = contacts[:mail]
  	@git = contacts[:git]
  end

  def print_all()
    conc =  (@id.to_s + " " + @last_name.to_s + " " + 
      @first_name.to_s + " " + @sur_name.to_s + " " + @phone.to_s + 
      " " + @tg.to_s + " " + @mail.to_s + " " + @git.to_s)
    puts conc.split.join(" ")
  end
end
