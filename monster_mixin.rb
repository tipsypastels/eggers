module MonsterMixin
  # This is a mixin that should be extended (NOT included) into Egg and Monster, and
  # any other monster containers. It adds metaprogramming to permit use of
  # Egg.Dragon or Monster.Dragon to create new monsters with a slightly nicer syntax

  def method_missing(monster, hash = {})
    new(monster, **hash)
  end
end