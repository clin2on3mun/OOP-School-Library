class Inputs
  def number_inputs
    get.chomp.to_i
  end

  def string_inputs
    get.chomp
  end
end
