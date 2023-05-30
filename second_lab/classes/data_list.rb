class DataList
  def initialize(elements)
    @data = elements.freeze
    @selected = []
  end

  def select(number)
    element = @data[number]
    @selected << element.id
  end

  def get_selected
    @selected.dup
  end

  def get_names
    raise NotImplementedError, "Метод get_names не реализован в этом классе."
  end

  def get_data
    raise NotImplementedError, "Метод get_data не реализован в этом классе."
  end
end
