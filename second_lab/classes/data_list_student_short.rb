require './classes/data_list'

class DataListStudentShort < DataList
  def get_names
    names = super
    names.shift # Удаляем первый элемент (ID) из массива наименований
    format_names(names) # Дополнительная обработка наименований
  end

  def get_data
    data_table = super
    data_table.each do |row|
      row.shift # Удаляем первый элемент (ID) из каждой строки таблицы
    end
    format_data(data_table) # Дополнительная обработка данных
  end

  private

  def format_names(names)
    # Дополнительная логика форматирования наименований
    # ...
    names
  end

  def format_data(data_table)
    # Дополнительная логика форматирования данных
    # ...
    data_table
  end
end
