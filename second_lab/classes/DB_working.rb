require 'sqlite3'

class DBWorking
	def initialize()
		@db = SQLite3::Database.open '/home/traktirshik/Ruby/Ruby/second_lab/data_files/students.db'
		@db.results_as_hash = true
	end

	def execute(query, *args)
    @db.execute(query,*args)
  end

  def results_as_hash=(bool)
    @db.results_as_hash = bool
  end
end