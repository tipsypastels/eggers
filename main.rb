require_relative 'utilities'
%w[monster_mixin monster monster_type trait egg game].each_pass_to :require_relative

m1 = Monster.Dragon size: 3
m2 = Monster.Dragon size: 3

puts m1
puts m2

egg = m1.breed_with(m2)

egg.on_hatch do |baby|
  puts baby
end

20.times { egg.next_turn }