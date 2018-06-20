class Array
  def each_pass_to(meth)
    each do |el|
      send(meth, el)
    end
  end
end