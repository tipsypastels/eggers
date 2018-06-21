class Monster
  extend MonsterMixin

  # Allows the seed instance variable
  # to be read, but not modified, externally
  attr_reader :type, 
              :seed,
              :size

  attr_accessor :nickname

  # Creates a new monster
  def initialize(type, seed: rand(500), size: 1, name: nil)
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

    # The nickname, which only affects #to_s
    @nickname = name

    # The traits, as an array of strings
    # This will also become its own class
    # eventually
    @traits = Trait.generate_from(@seed, @size)
  end

  # Converts a monster to a printable String
  def to_s
    title = if @nickname
      "\"#{@nickname}\", #{@type}"
    else
      @type
    end

    traits = @traits.map { |t| " - #{t}" }.join("\n")

    <<~MONSTER
      #{title}
      Size #{@size}
      #{traits}
    MONSTER
  end

  # Breeds with another monster
  def breed_with(other_monster)
    # This will need to be redone later when a MonsterType class is created
    # To allow us to compound type them rather than sampling
    egg_type = [@type, other_monster.type].sample

    # The size of the monster in the egg will be the average of both parents.
    egg_size = [@size, other_monster.size].average.round

    # Generates a new seed using the XOR of this monster's
    # seed and the partner's
    egg_seed = [@seed, other_monster.seed].average.round

    Egg.new(
      egg_type,
      size: egg_size,
      seed: egg_seed
    )
  end
end