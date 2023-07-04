require './classes/student.rb'
require './classes/student_short.rb'
require './classes/data_table.rb'
require './classes/data_list.rb'
require './classes/data_list_student_short.rb'
require './classes/students_list_json.rb'
require './classes/student_list_yaml.rb'
require './classes/student_list_super.rb'
require './classes/studeent_list_strategy.rb'
require_relative './classes/DB_working.rb'
require './classes/student_list_DB.rb'
require 'sqlite3'
require 'fox16'
require_relative './classes/view_main'
require_relative './classes/student_list_file_adapter.rb'
require './classes/student_list_controller'

# require 'rspec'

# describe Student do
#   let(:valid_student) do
#     Student.new(
#       id: 1,
#       last_name: 'Doe',
#       first_name: 'John',
#       sur_name: 'Smith',
#       phone: '123456789',
#       tg: '@johndoe',
#       mail: 'john.doe@example.com',
#       git_name: 'johndoe'
#     )
#   end

#   let(:invalid_student) do
#     Student.new(
#       id: 'invalid',
#       last_name: 'Invalid',
#       first_name: 'John',
#       sur_name: 'Smith',
#       phone: 'invalid',
#       tg: 'invalid',
#       mail: 'invalid',
#       git_name: 'invalid'
#     )
#   end

#   describe '#validate_git_name' do
#     it 'raises an exception if git_name is not set' do
#       expect { valid_student.validate_git_name }.not_to raise_error
#       expect { invalid_student.validate_git_name }.to raise_error("git_name не установлен")
#     end
#   end

#   describe '#validate_contact_info' do
#     it 'raises an exception if no contact information is provided' do
#       expect { valid_student.validate_contact_info }.not_to raise_error
#       expect { invalid_student.validate_contact_info }.to raise_error("Нет контактной информации")
#     end
#   end

#   describe '#set_contacts' do
#     it 'updates the contact information' do
#       student = Student.new(id: 1, last_name: 'Doe', first_name: 'John', sur_name: 'Smith')

#       expect { student.set_contacts(phone: '123456789', tg: '@johndoe', mail: 'john.doe@example.com', git_name: 'johndoe') }.not_to raise_error

#       expect(student.phone).to eq('123456789')
#       expect(student.tg).to eq('@johndoe')
#       expect(student.mail).to eq('john.doe@example.com')
#       expect(student.git_name).to eq('johndoe')
#     end
#   end

#   # Дополнительные тесты для других методов класса

#   describe '.read_from_txt' do
#     it 'reads student data from a file' do
#       path = 'students.txt'
#       separator = ';'
#       # Создайте тестовый файл students.txt с данными студентов для проверки

#       expect { Student.read_from_txt(path, separator) }.not_to raise_error
#       # Проверьте, что данные студентов были успешно считаны и созданы объекты класса Student
#     end
#   end

#   describe '.write_to_txt' do
#     it 'writes student data to a file' do
#       path = 'students.txt'
#       separator = ';'
#       # Создайте тестовых студентов для проверки записи в файл

#       expect { Student.write_to_txt(path, separator) }.not_to raise_error
#       # Проверьте, что данные студентов были успешно записаны в файл
#     end
#   end

#   describe '#getInfo' do
#     it 'returns formatted student information' do
#       expect(valid_student.getInfo).to eq("Doe J.S\tjohndoe\t@johndoe")
#     end
#   end
# end

begin
 
  if __FILE__ == $0

    FXApp.new do |app| 
      controller = StudentsListControler.new() 
      model = DataListStudentShort.new([])
      view = Students_view.new(app) 
      controller.set_model model
      controller.get_model.subscribe(view)
      view.set_controller controller

      view.get_controller.refresh_data
      controller.get_model.notify
      app.create 
      app.run 
    end 
  end
	
end