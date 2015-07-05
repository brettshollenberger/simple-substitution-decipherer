require "redis"
require "json"

class LanguageDistributor
  attr_accessor :redis
  
  def initialize
    @redis = Redis.new
  end

  def process(text)
    letter_counter = 0
    distribution   = Hash[*("a".."z").zip((1..26).map { |i| 0 }).flatten]

    text.chars.each do |char|
      if distribution[char.downcase]
        distribution[char.downcase] += 1
        letter_counter += 1
      end
    end

    save(distribution, letter_counter)
  end

  def distribution
    @distribution ||= JSON.parse(redis.get("canonical_distribution"))
  end

private
  def save(distribution, letter_counter)
    canonical = JSON.parse(redis.get("canonical_distribution") || "{}")
    counter   = redis.get("canonical_counter") || 0

    counter += letter_counter
    
    distribution.each do |k, v|
      if canonical[k].nil?
        canonical[k] = {count: 0, percentage: 0}
      end

      canonical[k][:count] += v

      canonical[k][:percentage] = (canonical[k][:count].to_f/counter)
    end

    redis.set("canonical_distribution", canonical.to_json)
    redis.set("canonical_counter", counter)
  end
end
