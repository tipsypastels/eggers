class Trait
  # A list of traits as Strings
  # @TODO map these into Trait objects later

  LIST = [
    "has scales",
    "is furry",
    "looks vicious",
    "looks cuddly",
    "smells bad",
    "smells nice",
    "smells like soap",
    "green eyes",
    "blue eyes",
    "purple eyes"
  ]

  # class << self means we're accessing Trait as
  # a namespace rather than a class within this block
  # not really sure how to explain this but you'll
  # learn it later
  class << self

    # from a given RNG seed and monster size N, use the
    # seed to pick N random traits, based on the seed
    def generate_from(seed, size)
      srand(seed)
      LIST.sample(size)
    end
  end
end