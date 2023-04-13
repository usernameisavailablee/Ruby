class Student
  attr_accessor :id, :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git

  def initialize (id:, last_name:, first_name:, sur_name:, phone:nil, tg:nil, mail:nil, git:nil)
  	@id = id
    @last_name = last_name
  	@first_name = first_name
  	@sur_name = sur_name
  	@tg = tg
  	@mail = mail
  	@git = git
    @phone = phone
  end

  def print_all()
    conc =  (@id.to_s + " " + @last_name.to_s + " " + 
      @first_name.to_s + " " + @sur_name.to_s + " " + @phone.to_s + 
      " " + @tg.to_s + " " + @mail.to_s + " " + @git.to_s)
    puts conc.split.join(" ")
  end


  def self.valid_number?(phone)
    phone =~ (/\A[+]7\s([(]\d{3}[)])\s\d{3}[-]\d{2}[-]\d{2}\z/) 
  end

end
