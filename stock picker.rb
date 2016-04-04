def stock_picker(some_array)
  low_numbers = some_array[0..-2]
  high_numbers = some_array[1..-1]
  greatest_difference = 0
  buy_at = 0
  sell_at = 0

  high_numbers.each do |x|
    high_number_index = high_numbers.index(x) - 1
    low_numbers = some_array[0..high_number_index]
    low_numbers.each do |y|
      difference = x - y
      if greatest_difference < difference
        greatest_difference = difference
        buy_at = low_numbers.index(y)
        sell_at = high_numbers.index(x) + 1
      end
    end
  end
  puts "Buy on week #{buy_at} and sell at week #{sell_at}"
  puts "For a profit of #{greatest_difference}"
end

stock_picker([17,3,6,9,15,8,6,1,10])