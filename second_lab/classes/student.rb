class Student
  attr_accessor :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git

  def initialize (id, last_name, first_name, sur_name, phone = "", tg = "", mail = "", git = "")
  	@id = id
    @last_name = last_name
  	@first_name = first_name
  	@sur_name = sur_name
  	@phone = phone
  	@tg = tg
  	@mail = mail
  	@git = git
  end

#get/set for id
  def id
  	@id
  end

  def id=(value)
  	@id = value
  end

  def print_all()
    conc =  (@id.to_s + " " + @last_name.to_s + " " + 
      @first_name+ " " + @sur_name + " " + @phone + 
      " " + @tg + " " + @mail + " " + @git)
    puts conc.split.join(" ")
  end
end
