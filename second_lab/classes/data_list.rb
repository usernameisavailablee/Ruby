class DataList

  def initialize(elements)
    @data = elements.freeze
    @selected = []
  end

  def data=(new_data)
    raise ArgumentError, "Неверный размер массива данных" unless new_data.size == @data.size

    @data = new_data
  end
  

  def select(number)
    element = @data[number]
    @selected << element.id
  end

  def get_selected
    @selected.dup
  end


  protected
  def get_names; end

  # Шаблонный метод.
  def get_data
    ans_array = []
    data.map.with_index do |obj, index|
      ans_array.append([index].append(self.get_info(obj)))
    end

    DataTable.new ans_array
  end

  protected def get_info(obj); end

end