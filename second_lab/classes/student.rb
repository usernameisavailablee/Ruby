require './modules/attr_validated_module.rb'
require './classes/field_converter.rb'


class Student < FieldConverter

  include AttrValidated


  attr_validated (:id) {|val| val.to_s =~ Valid_id || val.nil?}
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
    @@students << self
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

  def self.read_from_txt(path,separator = ';')
    raise Errno::ENOENT,"Bad path #{path}" unless File.file?(path)
    File.open(path) do |file|
      keys = file.first.chop.split(separator)
      file.each do |line|
        params = {}
        values = line.split(separator)
        values[-1] = values[-1].chop
        (keys.length).times do |i|
          values[i] = nil if values[i].length == 0
          params[keys[i].to_sym] = values[i]
        end
        new(**params)
      end
    end
  end

  def self.write_to_txt(path,separator = ';')
  File.open(path,'w') do |file|
    file.puts @@students[0].get_titles(separator)
    @@students.each do |student|
      file.puts student.get_data(separator)
    end
  end
end

  def getInfo
    info = "#{@last_name} #{@first_name[0]}.#{@sur_name[0]}\t#{@git_name}\t#{@tg}"
    return info
  end


end
