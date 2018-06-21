class Egg
  extend MonsterMixin

  # Allows the seed, turn, and hatched instance 
  # variables to be read, but not modified, externally.
  attr_reader :seed,
              :turn,
              :hatched,

              # @TODO remove this when not debugging
              :turns_to_hatch

  # Creates a new egg
  def initialize(monster_type, seed: rand(500), size: 1)
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

  # Possible states an egg can be in, as Strings
  # To be used in the #to_s method
  STATES = {
    0 => "Not close to hatching.",
    0.5 => "Getting closer to hatching!",
    0.7 => "Close to hatching!",
    0.9 => "Very close to hatching!",
    1.0 => "The monster inside is long gone."
  }

  # Converts the egg to a printable String
  def to_s
    # Search through STATES to find the appropriate
    # description for the egg's current state
    state_key = STATES.keys.reverse.detect do |percent|
      ready_percentage >= percent
    end

    state = STATES[state_key]

    desc = if @hatched
      "A hatched eggshell remain."
    else
      "A mysterious egg of size #{@size}!"
    end

    # <<~ is just a fancy way of writing
    # multiline strings
    <<~EGG
      #{desc}
      #{state}
    EGG
  end

  # Increments the turn counter by 1 (or a set integer)
  # and re-checks if the egg is ready to hatch
  def next_turn(by = 1)
    return if @hatched
    @turn += by

    @on_turn.call(@turn, ready_percentage) if @on_turn
    hatch_if_ready
  end

  # Saves a block to be called when the egg hatches.
  # Passes the monster it hatches into to the block.
  def on_hatch(&block)
    @on_hatch = block
  end

  # saves a block to be called when the egg processes a turn
  # Passes the current turn and ready percentage
  def on_turn(&block)
    @on_turn = block
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
    ready_percentage >= 1
  end

  # Readiness of the egg to hatch
  # Between 0 and 1
  def ready_percentage
    @turn.to_f / @turns_to_hatch.to_f
  end

  # Generates a monster
  def hatch
    @hatched = true
    monster = Monster.new(@monster_type, 
      seed: @seed, 
      size: @size
    )

    @on_hatch.call(monster) if @on_hatch
    monster
  end
end