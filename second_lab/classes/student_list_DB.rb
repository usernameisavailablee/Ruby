require_relative 'data_list_student_short.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'DB_working.rb'
require 'sqlite3'
require_relative 'student_list.rb'
class StudentListDB < StudentList
	def initialize()
		self.db = DBWorking.instance
	end

	def get_k_n_student_short_list(elements_per_page, page_number)
		raise "Некорректно выбран объем данных" if elements_per_page < 1 and page_number < 1
		students = db.execute('SELECT * FROM students LIMIT ? OFFSET ?',elements_per_page,elements_per_page * (page_number - 1))
	  	slice = students.map{|student| StudentShort.student_init(Student.new(**student.transform_keys(&:to_sym)))}
	  	DataListStudentShort.new(slice)
	  end

	def get_student_by_id(student_id)
	  student = db.execute('SELECT * FROM students WHERE id = ?', student_id).first
	  return nil if student.nil?
	  Student.new(**student.transform_keys(&:to_sym))
	end

	def add_student(obj_student)
		db.execute('insert into students (last_name, first_name, sur_name, tg, mail, git_name, phone) VALUES (?, ?, ?, ?, ?, ?, ?)', *student_fields(obj_student))
	end
	
	def delete_student(student_id)
	  db.execute('DELETE FROM students WHERE id = ?', student_id)
	end

	def replace_student(obj_student, student_id)
	  db.execute('UPDATE students SET last_name=?, first_name=?, sur_name=?, tg=?, mail=?, git_name=?, phone=? WHERE id=?',*student_fields(obj_student), student_id)
	end

  def get_student_count
    self.db.results_as_hash=false
    res = self.db.execute("Select COUNT(*) from students").first[0]
    self.db.results_as_hash=true
    res
  end
 
  private

  attr_accessor :db

  def student_fields(obj_student)
    [obj_student.last_name, obj_student.first_name,  obj_student.sur_name, obj_student.tg, obj_student.mail, obj_student.git_name, obj_student.phone]
  end
end
