class SubstitutionDecipherer
  class Dictionary
    attr_accessor :words, :count

    def initialize
      @words = File.read("/usr/share/dict/words").split("\n")
      @count = @words.length
    end

    def include?(word, min=0, index=(@count.to_f/2).ceil, max=@count)
      return true if @words[index] == word
      return false if (index==max) || (index==min)

      if @words[index].downcase < word
        include?(word, index, index+((max-index).to_f/2).ceil, max)
      else
        include?(word, min, min+((index-min).to_f/2).ceil, index)
      end
    end
  end
end
