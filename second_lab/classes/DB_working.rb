require 'sqlite3'

class DBWorking
	@instance = nil
  private_class_method :new

  def self.instance
    @instance ||= new
  end

	def initialize()
    p "asdasd"
		@db = SQLite3::Database.open 'C:/Ruby/second_lab/data_files/students.db'
		@db.results_as_hash = true
	end

	def execute(query, *args)
    @db.execute(query,*args)
  end

  def results_as_hash=(bool)
    @db.results_as_hash = bool
  end
end