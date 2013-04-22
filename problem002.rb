
# Generates an infinite series of Fibonacci numbers.
def fibonacci
  Enumerator.new do |yielder|
    previous = [1, 2]
    while
      current = previous.reduce(:+)
      yielder << previous.shift
      previous << current
    end
  end
end

puts fibonacci.take_while { |n| n < 4_000_000 }.select { |n| n % 2 == 0 }.reduce(:+)
