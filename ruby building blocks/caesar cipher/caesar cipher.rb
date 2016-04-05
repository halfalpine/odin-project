def caesar_cipher(some_words, shift)
  upper_letters = ("A".."Z").to_a * 2
  lower_letters = ("a".."z").to_a * 2

  array_of_words = some_words.split(" ")
  array_of_words = array_of_words.map do |word|
    word_array = word.split("")

    word_array = word_array.map do |letter|
      if letter == letter.upcase
        letter = upper_letters[upper_letters.find_index(letter) + shift]
      else
        letter = lower_letters[lower_letters.find_index(letter) + shift]
      end
    end
    word_array.join
  end
  array_of_words.join(" ")

end

puts "Enter a phrase to encode:"
some_words = gets.chomp
puts "Enter the cipher index:"
shift = gets.chomp

puts ""
puts ""

puts "Here is your encoded phrase:"
puts caesar_cipher(some_words, shift)

# ["d", "i", "r", "k"]