class MonsterType
  class << self
    def merge(type1, type2) 

    end
  end

  def initialize(name)
    @name   = name
    @traits = []
  end

  def to_s
    @name
  end
end