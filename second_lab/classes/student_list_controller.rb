require_relative 'view_main'
require_relative 'student_list.rb'
require 'sqlite3'

class StudentsListControler
	
	def initialize
		self.students_list = StudentListDB.new()
		rescue  => e
			self.connect_to_json
	end
 
	def refresh_data
		self.model.set_data(self.students_list.get_k_n_student_short_list(10,1).get_list_objs)
		rescue SQLite3::CantOpenException  => e
			self.connect_to_json
			self.model.set_data(self.students_list.get_k_n_student_short_list(10,1).get_list_objs)
		ensure
			get_model.notify
	end

	def add_student(student_obj)
		self.students_list.add_student(student_obj)
		self.refresh_data
	end

	def set_view(view)
		self.view = view
	end

	def set_model(model)
		self.model = model
	end

	def get_model
		self.model
	end

	private

	def connect_to_json
		students_list_file = StudentListFile.new(StudentListJson.new())
    	model = StudentListFileAdapter.new(students_list_file,"C:/Ruby/second_lab/data_files/student.json")
		self.students_list = model
	end

	attr_accessor :model, :students_list, :view
end