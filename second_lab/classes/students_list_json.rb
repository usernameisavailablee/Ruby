require 'json'

class Students_list_JSON
  def initialize
    self.students = []
  end


  def read_from_file(file_path)
    raise Errno::ENOENT,"Bad path #{path}" unless File.file?(file_path)
    File.open(file_path) do |file|
        JSON.parse(file.read).each do |hash_student|
          p hash_student
        self.students << Student.new(**(hash_student.to_hash.transform_keys(&:to_sym)))
      end
    end
  end



  def write(file_path)
    json_data = JSON.generate(self.students)
    File.open(file_path, 'w') do |file|
      file.puts(json_data)
    end
    puts "Hash data has been written to #{file_path}."
  rescue StandardError => e
    puts "Error occurred while writing to file: #{e.message}"
  end

  def get_k_n_sudent_short_list(k, n, data_list_obj = nil)
    return data_list_obj unless data_list_obj.nil?
    DataListStudentShort.new(students.slice((k-1) * n, n).map!{ |e| StudentShort.new(e) })
  end

  def sort_by_lastname
    self.students.sort_by(&:last_name)
  end

  def add_student(student)
    student.id = 123321
    self.students << student
  end

  def remove_student(student)
    students.delete(student)
  end

  def replace_student_by_ID(student, student_id)
    id_student = list_of_students.find_index{|student| student.id == student_id}
    self.students[id_student] = student
  end

  def get_student_count
    students.size
  end

  def get_student_id(id)
    students.find {|student| student.id==id}
  end

  private
  attr_accessor :students
end
