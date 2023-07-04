require_relative 'students_list_json.rb'
require_relative 'studeent_list_strategy.rb'

class StudentListSuper
  def initialize(strategy)
    self.students = []
    self.strategy = strategy
  end

  def read_from_file(path)
  	raise Errno::ENOENT,"Bad path #{path}" unless File.file?(path)
  	File.open(path) do |file|
  			strategy.list_hash_from_str(file.read).each do |hash_student|
  			self.students << Student.new(**hash_student) 
  		end
  	end
  end

  def write_to_file(path)
		File.open(path,'w') do |file|
		file.puts strategy.list_hash_to_str(students.map &:to_hash)
		end
  end

  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    subset = students[k...(k + n)].map { |student| StudentShort.student_init(student) }

    if existing_data_list
      existing_data_list.data = subset
      existing_data_list
    else
      DataList.new(subset)
    end
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
  attr_accessor :students, :strategy

end