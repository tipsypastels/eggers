class Array
  def each_pass_to(meth)
    each do |el|
      send(meth, el)
    end
  end

  def average
    reduce(:+) / size.to_f
  end
end