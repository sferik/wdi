# encoding: utf-8

class Die
  attr_reader :max_sides, :min_sides

  def initialize(max_sides=6)
    @min_sides = 1
    @max_sides = max_sides
    @sides = (min_sides..max_sides).to_a
  end

  def roll
    @sides.sample
  end
  alias sample roll
end

class Thrower
  def initialize(die, num_throws, dice_per_throw=1)
    @die = die
    @num_throws = num_throws
    @dice_per_throw = dice_per_throw
  end

  def throw
    @num_throws.times.map do
      @dice_per_throw.times.map{@die.sample}.reduce(:+)
    end
  end
end

class Histogram
  def initialize(countable, min, max, char="*")
    @countable = countable
    @min = min
    @max = max
    @char = char
  end

  def to_s
    (@min..@max).map{|i| "#{i}\t#{@char.to_s * @countable.count(i)}\n"}.join
  end
end

num_throws = 100
dice_per_throw = 2
die = Die.new
thrower = Thrower.new(die, num_throws, dice_per_throw)
min = dice_per_throw * die.min_sides
max = dice_per_throw * die.max_sides
histogram = Histogram.new(thrower.throw, min, max, "🎲")
puts histogram
