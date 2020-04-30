require 'pry'
require 'benchmark'
def prime? number
  return false if number <= 1
  return true if number == 2 || number == 3

  half_num = number / 2
  factors = (2..half_num)
  count = 2

  # if count is in the range of numbers to try
  while factors === count
    # return false if anything is an even division
    if number % count == 0
      puts "Divisible by #{count}"
      return false
    end
    count += 1
  end

  # no numbers had no remainer, its prime
  true
end

def prime_with_report num
  Benchmark.bm do |bm|
    puts bm.report {prime_report num}
  end
end

def prime_report num
  val = prime? num
  puts val
end


  ## Was building an array of numbers to try
  ## for numbers like "1000000000" it was taking 10 seconds to build the array
  ## changed to range, now its instant (cause its div by zero2)