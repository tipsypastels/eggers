require_relative 'utilities'
%w[monster_mixin monster trait egg game].each_pass_to :require_relative

Egg.Dragon
Monster.Dragon