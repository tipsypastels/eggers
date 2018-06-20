# An instance of a monster

class Monster
  # Allows the seed instance variable
  # to be read, but not modified, externally
  attr_reader :seed

  # Creates a new monster
  def initialize(type, seed, size)
    # The type of a monster, as a String
    # This will probably have to become its
    # own class later, so types can merge
    # when making monster children
    @type = type
    
    # The RNG seed used to get traits and generate an
    # egg when breeding with another monster
    @seed = seed

    # The physical size of the monster, an Integer
    # determines how many traits it have
    @size = size

    # The traits, as an array of strings
    # This will also become its own class
    # eventually
    @traits = Trait.generate_from(@seed, @size)
  end

  # Converts a monster to a printable String
  def to_s

  end

  # Breeds with another monster
  def breed_with(other_monster)
    # Generates an egg using the XOR of this monster's
    # RNG seed and the partner's
    Egg.new(@seed ^ other_monster.seed)
  end
end