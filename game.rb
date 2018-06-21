class Game
  def initialize(&block)
    @objects_to_update = []
    @turn_block        = []
    instance_eval(&block)
  end

  private

  def every_turn(&block)
    @turn_block = block
  end
end