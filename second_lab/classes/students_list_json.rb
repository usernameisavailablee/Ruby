require 'json'

class StudentsListJSON
  attr_reader :filename, :students

  def initialize(filename)
    @filename = filename
    @students = read_data
  end

  def read_data
    if File.exist?(@filename)
      json_data = File.read(@filename)
      JSON.parse(json_data, object_class: Student)
    else
      []
    end
  end

  def write_data
    json_data = JSON.pretty_generate(@students)
    File.write(@filename, json_data)
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start_index = (k - 1) * n
    end_index = start_index + n - 1
    selected_students = @students[start_index..end_index]
    selected_student_shorts = selected_students.map { |student| StudentShort.student_init(student) }

    if data_list.nil?
      DataListStudentShort.new(selected_student_shorts)
    else
      data_list.data = selected_student_shorts
      data_list
    end
  end

  def sort_by_name_initials
    @students.sort_by! { |student| student.fullname }
  end

  def add_student(student)
    student.id = generate_next_id
    @students << student
  end

  def replace_student(student)
    index = @students.find_index { |s| s.id == student.id }
    return if index.nil?

    @students[index] = student
  end

  def remove_student(id)
    @students.reject! { |student| student.id == id }
  end

  def get_student_short_count
    @students.count { |student| student.is_a?(StudentShort) }
  end

  private

  def generate_next_id
    last_student = @students.max_by { |student| student.id }
    last_student.nil? ? 1 : last_student.id + 1
  end
end
