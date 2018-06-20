class Egg
  # Allows the seed and turn instance variables to
  # be read, but not modified, externally.
  attr_reader :seed,
              :turn

  # Creates a new egg
  def initialize(monster_type, seed, size)
    @monster_type = monster_type
    @seed = seed
    @turn = 0
    @size = size

    srand(@seed)
    @turns_to_hatch = (
    0...(10 * @size)
    ).to_a.sample

    @hatched = false
  end

  # Increments the turn counter by 1 (or a set integer)
  # and re-checks if the egg is ready to hatch
  def next_turn(by = 1)
    return if @hatched
    @turn += by

    hatch_if_ready
  end

  # Methods beyond this point can only be
  # accessed by other methods in this class
  # never externally
  private

  # Somewhat self-explanatory
  def hatch_if_ready
    hatch if ready?
  end

  # Whether or not the egg is ready to hatch
  def ready?
    @turn >= @turns_to_hatch
  end

  # Generates a monster
  def hatch
    @hatched = true
    monster = Monster.new(@monster_type, @seed, @size)

    yield monster if block_given?
    monster
  end
end