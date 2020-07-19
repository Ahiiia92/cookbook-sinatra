class Recipe
  attr_reader :name, :description, :prep_time, :done, :difficulty
  attr_accessor :done
  def initialize(attr = {})
    @name = attr[:name]
    @description = attr[:description]
    @prep_time = attr[:prep_time] || nil
    @done = false
    @difficulty = attr[:difficulty]
  end

  def done?
    @done
  end

  def done!
    @done = true
  end
end
