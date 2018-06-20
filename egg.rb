class Egg
	attr_reader :seed,
							:turn

	def initialize(seed, size)
		@seed = seed
		@turn = 0
    @size = size

    srand(@seed)
    @turns_to_hatch = (
      0...(10 * @size)
    ).to_a.sample

		@hatched = false
	end

	def next_turn
		return if @hatched
		@turn += 1

		hatch_if_ready
	end

	private

	def hatch_if_ready
		hatch if ready?
	end

	def ready?
		@turn >= @turns_to_hatch
	end

	def hatch
    @hatched = true
    monster = Monster.new(@seed, @size)

    yield monster if block_given?
    monster
	end
end