require './modules/attr_validated_module.rb'

class Student

  include AttrValidated

  Valid_git = /\Ahttps?:\/\/github\.com\/[a-zA-Z0-9_\-]/
  Valid_mail = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  Valid_phone = /\A[+]7\s([(]\d{3}[)])\s\d{3}[-]\d{2}[-]\d{2}\z/
  Valid_id = /^[0-9]+$/
  Valid_tg = /^@([A-Za-z0-9_]{5,32})$/
  Valid_name = /^[а-яА-ЯёЁa-zA-Z]+$/

  attr_validated (:id) {|val| val =~ Valid_id || val.nil?}
  attr_validated :last_name,:first_name,:sur_name do |val| val =~ Valid_name || val.nil? end
  attr_validated (:tg) {|val| val =~ Valid_tg || val.nil?} 
  attr_validated (:mail) {|val| val =~ Valid_mail || val.nil?} 
  attr_validated (:git) {|val| val =~ Valid_git || val.nil?} 
  attr_validated (:phone) {|val| val =~ Valid_phone || val.nil?}

  def initialize (id:, last_name:, first_name:, sur_name:, phone:nil, tg:nil, mail:nil, git:nil)
    self.id = id
    self.last_name = last_name
    self.first_name = first_name
    self.sur_name = sur_name
    self.tg = tg
    self.mail = mail
    self.git = git
    self.phone = phone
  end

  def print_all()
    conc =  (@id.to_s + " " + @last_name.to_s + " " + 
      @first_name.to_s + " " + @sur_name.to_s + " " + @phone.to_s + 
      " " + @tg.to_s + " " + @mail.to_s + " " + @git.to_s)
    puts conc.split.join(" ")
  end

  def validate_git
    raise "Git не установлен" if git == nil
  end

  def validate_contact_info
    contact_info = [:phone, :mail, :tg]
    raise "Нет контактной информации" unless contact_info.any? { |info| !send(info).nil? }
  end

  def set_contacts(phone:nil, tg:nil, mail:nil, git:nil)
    self.phone = phone if phone
    self.mail  = mail if mail
    self.tg = tg if tg
    self.git  = git if git
  end

  def self.from_string(string)
    id, last_name, first_name, sur_name, phone, tg, mail, git = string.split(',')
    raise InvalidCsvStringError, "Invalid string" if id.nil? || last_name.nil? || first_name.nil? || sur_name.nil?
    new(
      id: id,
      last_name: last_name,
      first_name: first_name,
      sur_name: sur_name,
      phone: phone,
      tg: tg,
      mail: mail,
      git: git
    )
  end


end
