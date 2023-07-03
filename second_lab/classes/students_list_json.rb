require 'json'
require_relative 'studeent_list_strategy.rb'

class StudentsListJSON < StudentListStrategy
  def list_hash_from_str(str)
    JSON.parse(str,  {symbolize_names: true })
  end

  def list_hash_to_str(list_hash)
    JSON.generate(list_hash)
  end
end
