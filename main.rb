require_relative 'utilities'
%w[monster trait egg].each_pass_to :require_relative

egg = Egg.new("Dragon", 1, 1)
puts egg

egg.next_turn(7)
p egg.turns_to_hatch
puts egg