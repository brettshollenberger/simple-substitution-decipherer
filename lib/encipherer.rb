class Encipherer
  extend Forwardable
  attr_accessor :shift_size

  def initialize(options={})
    @shift_size = options.fetch(:shift) || 1
    @shifter    = MathematicalAlphabet.new
  end

  def_delegators :@shifter, :shift, :unshift

  def encipher(text)
    text.chars.map(&:downcase).map do |char|
      shift char, shift_size
    end.join("")
  end

  def decipher(text)
    text.chars.map(&:downcase).map do |char|
      unshift char, shift_size
    end.join("")
  end
end
