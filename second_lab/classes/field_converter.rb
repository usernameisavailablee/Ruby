class FieldConverter
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
end
