require './modules/attr_validated_module.rb'
require './classes/field_converter.rb'


class Student < FieldConverter

  include AttrValidated


  Valid_git_name_name = /^[a-zA-Z\d]+(-[a-zA-Z\d]+)*$/
  Valid_mail = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  Valid_phone = /\A[+]7\s([(]\d{3}[)])\s\d{3}[-]\d{2}[-]\d{2}\z/
  Valid_id = /^[0-9]+$/
  Valid_tg = /^@([A-Za-z0-9_]{5,32})$/
  Valid_name = /^[а-яА-ЯёЁa-zA-Z]+$/


  attr_validated (:id) {|val| val =~ Valid_id || val.nil?}
  attr_validated :last_name,:first_name,:sur_name do |val| val =~ Valid_name || val.nil? end
  attr_validated (:tg) {|val| val =~ Valid_tg || val.nil?} 
  attr_validated (:mail) {|val| val =~ Valid_mail || val.nil?} 
  attr_validated (:git_name) {|val| val =~ Valid_git_name_name || val.nil?} 
  attr_validated (:phone) {|val| val =~ Valid_phone || val.nil?}


  def initialize (id:, last_name:, first_name:, sur_name:, phone:nil, tg:nil, mail:nil, git_name:nil)
    self.id = id
    self.last_name = last_name
    self.first_name = first_name
    self.sur_name = sur_name
    self.tg = tg
    self.mail = mail
    self.git_name = git_name
    self.phone = phone
  end


  def validate_git_name
    raise "git_name не установлен" if git_name == nil
  end


  def validate_contact_info
    contact_info = [:phone, :mail, :tg]
    raise "Нет контактной информации" unless contact_info.any? { |info| !send(info).nil? }
  end


  def set_contacts(phone:nil, tg:nil, mail:nil, git_name:nil)
    self.phone = phone if phone
    self.mail  = mail if mail
    self.tg = tg if tg
    self.git_name  = git_name if git_name
  end



  def getInfo
    info = "#{@last_name} #{@first_name[0]}.#{@sur_name[0]}\t#{@git_name}\t#{@tg}"
    return info
  end


end
