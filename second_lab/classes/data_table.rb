class Data_table
  def initialize(data)
    @table = data.freeze
  end

  def get_element(row, column)
    @table[row][column]
  end

  def column_count
    @table[0].length
  end

  def row_count
    @table.length
  end
end
