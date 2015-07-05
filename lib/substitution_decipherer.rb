class SubstitutionDecipherer
  attr_accessor :dictionary, :corpus, :distribution

  def initialize
    @dictionary     = Dictionary.new
    @distribution   = LanguageDistributor.new
    @corpus         = Hash[*(1..26).zip((1..26).map do |i| 
                        Hash[*("a".."z").zip((1..26).map { |i| {count: 0, percentage: 0} }).flatten]
                      end).flatten]
    @shifter        = Encipherer.new(shift: 0)
    @letter_counter = 0
  end

  def decipher(input)
    distribute(input)

    update_corpus

    @shifter.shift_size = guess_shift

    @shifter.decipher(input)
  end

private
  def guess_shift
    similarity_rankings = corpus.sort_by do |k, v|
      v[:similarity]
    end.map { |i| i[0] }

    missing_word_rankings = corpus.sort_by do |k, v|
      v[:missing_word_count]
    end.map { |i| i[0] }

    results = (1..26).inject({}) do |results, shift|
      results[shift] = similarity_rankings.index(shift) + missing_word_rankings.index(shift)
      results
    end.sort_by { |k,v| v }[0][0]
  end

  def update_corpus
    (1..26).each do |key|
      corpus[key][:similarity] = 0

      ("a".."z").each do |skey|
        corpus[key][skey][:percentage] = (corpus[key][skey][:count].to_f/@letter_counter)

        corpus[key][:similarity] += (distribution.distribution[skey]["percentage"]-corpus[key][skey][:percentage]).abs
      end
    end
  end

  def distribute(input)
    (1..26).each do |i|
      @shifter.shift_size = i
      shifted_output = @shifter.decipher(input)

      shifted_output.split(" ").each do |word|
        corpus[i][:missing_word_count] = 0 if corpus[i][:missing_word_count].nil?

        unless dictionary.include?(word)
          corpus[i][:missing_word_count] += 1
        end
      end

      shifted_output.chars.each do |char|
        unless corpus[i][char].nil?
          corpus[i][char][:count] += 1
          @letter_counter += 1
        end
      end
    end
  end
end
