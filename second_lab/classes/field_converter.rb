class FieldConverter

  Valid_git_name_name = /^[a-zA-Z\d]+(-[a-zA-Z\d]+)*$/
  Valid_mail = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  Valid_phone = /^[(\+7)8][0-9]+$/
  Valid_id = /^[0-9]+$/
  Valid_tg = /^@([A-Za-z0-9_]{5,32})$/
  Valid_name = /^[а-яА-ЯёЁa-zA-Z]+$/
  @@students=[]


  def print_all()
    # Получаем список всех переменных экземпляра
    instance_variables_list = instance_variables.map {|var| var.to_s[1..-1] }

    # Собираем строку с названиями полей и их значениями
    output = ""
    instance_variables_list.each do |var|
      # Получаем значение поля 
      value = instance_variable_get("@#{var}")

      # Форматируем строку для данного поля
      if output.empty?
        output += "#{var}: #{value}"
      else
        output += ", #{var}: #{value}"
      end
    end
    return output
  end


	def self.from_string(str)
	  params = {}
	  str.split(',').map(&:strip).each do |field|
	    key, value = field.split(':').map(&:strip)
	    unless defined?("@#{key}")
	      raise "Unknown field: #{key}"
	    end
	    params[key.to_sym] = value
	  end
	  self.new(**params)
	end

	def get_permit_data
		fields = []
    self.instance_variables.each do |var|
      key = var.to_s.delete("@")
      if self.respond_to?(key)
        value = self.send(key)
        fields << "#{key}: #{value}" # важный пробел
      end
  	end
  	fields
	end

	def get_titles(separator = ';')
		get_permit_data.map{|val| val.split(":").first}.join("#{separator}")
	end

	def get_data(separator = ";")
		get_permit_data.map{|val| val.split(":").last.strip}.join("#{separator}")
	end

	def self.get_students
		@@students
	end

end
