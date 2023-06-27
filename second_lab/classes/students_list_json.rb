require 'json'

class Students_list_JSON
  def initialize
    self.students = []
  end

  def read_from_file(file_path)
    raise Errno::ENOENT, "Bad file path #{file_path}" unless File.file?(file_path)

    json_data = File.read(file_path)
    self.students = JSON.parse(json_data, symbolize_names: true)
  end

  def write(file_path)
    json_data = JSON.generate(self.students)
    File.open(file_path, 'w') do |file|
      file.puts(self.students)
    end
    puts "Hash data has been written to #{file_path}."
  rescue StandardError => e
    puts "Error occurred while writing to file: #{e.message}"
  end


  def add_student(student)
    students << student
  end

  def remove_student(student)
    students.delete(student)
  end

  def get_students
    students
  end

  private
  attr_accessor :students
end
