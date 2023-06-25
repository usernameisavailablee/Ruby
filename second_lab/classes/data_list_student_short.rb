
class DataListStudentShort < DataList
  def get_names
    names = super
    names.shift # Удаляем первый элемент (ID) из массива наименований
    format_names(names) # Дополнительная обработка наименований
  end

  def get_info(obj)
    [obj.fullname, obj.git, obj.contact]
  end
end

