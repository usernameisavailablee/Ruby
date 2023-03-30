class Student

  attr_accessor :first_name, :last_name, :sur_name,:phone,:tg, :mail, :git

  def initialize (id, first_name, last_name, sur_name, phone = "", tg = "", mail = "", git = "")
  	@id = id
  	@first_name = first_name
  	@last_name = last_name
  	@sur_name = sur_name
  end

#get/set for id
  def id
  	@id
  end

  def id=(value)
  	@id = value
  end

end
