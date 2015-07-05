class MathematicalAlphabet
  def initialize
    @alphabet_indices = Hash[*("a".."z").zip(0..25).flatten]
    @alphabet         = ("a".."z").to_a
  end

  def shift(input, shift)
    input_index = @alphabet_indices[input]

    return input if input_index.nil?

    shifted_index = input_index + shift

    shifted_index -= 26 if shifted_index > 25

    @alphabet[shifted_index]
  end

  def unshift(input, shift)
    input_index = @alphabet_indices[input]

    return input if input_index.nil?

    shifted_index = input_index - shift

    shifted_index += 26 if shifted_index < 0

    @alphabet[shifted_index]
  end
end
