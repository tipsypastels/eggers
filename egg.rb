class Egg
	attr_reader :seed,
							:turn
							
	def initialize(seed)
		@seed = seed
		@turn = 0

		@hatched = false
	end

	def turns_to_hatch
		return 0 if @hatched
		srand(@seed)

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
		@turn >= turns_to_hatch
	end

	def hatch
		Monster.new(@seed)
	end
end