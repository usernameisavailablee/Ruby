require './classes/student.rb'

class StudentShort
  attr_reader :id, :full_name, :git, :contact

  def initialize(student = nil, id = nil, data_string = nil)
    if student
      @id = student.id
      @full_name = "#{student.last_name} #{student.first_name[0]}.#{student.sur_name[0]}."
      @git = student.git
      @contact = { phone: student.phone, tg: student.tg, mail: student.mail }
    else
      @id = id
      data = data_string.split(' ')
      @full_name = "#{data[0]} #{data[1][0]}.#{data[2][0]}."
      @git = data[3]
      @contact = { phone: nil, tg: nil, mail: nil }

      data.each_with_index do |val, i|
        case val
        when /\A[+]7\s[(]\d{3}[)]\s\d{3}[-]\d{2}[-]\d{2}\z/
          @contact[:phone] = val
        when /\A@([A-Za-z0-9_]{5,32})\z/
          @contact[:tg] = val
        when /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
          @contact[:mail] = val
        end
      end
    end
  end
end

