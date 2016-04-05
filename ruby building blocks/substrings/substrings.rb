  dictionary = ["below","down","go","going","horn","how","howdy","it",
    "i","low","own","part","partner","sit"]

def substrings(string, array)
  string_words = string.downcase.split(" ")
  substrings_hash = {}
  count = 0

  array.each do |substring|
    count = 0
    string_words.each do |word|
      if word.include? substring
        count += 1
      end
      if (count > 0)
        substrings_hash[substring] = count
      end
    end
  end

  substrings_hash.each do |word, count|
    #if (count > 0)
      puts word, count
    #end
  end
end


substrings("Howdy partner, sit down! How's it going?", dictionary)

# {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, 
# "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}



