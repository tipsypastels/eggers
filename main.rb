require_relative 'utilities'
%w[monster_mixin monster trait egg game].each_pass_to :require_relative

drago = Monster.Dragon
draga = Monster.Dragon

egg = draga.breed_with(drago)
puts egg