# 1. take string and desired shift facor
def caesar_cipher(string, shift_factor)
  # create arrays to zip into Hash
  letters = ('a'..'z').to_a
  numbers = (1..26).to_a
 
  # zip to hash for use in map
  letters_to_numbers = letters.zip(numbers).to_h
 
  # 2. split the string into individual characters (in an array i guess)
  str_num = string.downcase.split('').map do |char|
    # 3. convert each character to an equivalent number
    if char.count("a-zA-Z") > 0
      letters_to_numbers[char]
    else
      char
    end
  end
  
  # # 4. add each number with map
  shifted_str_num = str_num.map do |num| 
    if num.is_a?(Integer)
      num + shift_factor if num.is_a?(Integer)
    else
      num
    end
  end
 
  # 4.5 wrap z to a
  shifted_str_num.map! do |num|
    if num.is_a?(Integer) && num > 26 
      num - 26
    else
      num
    end
  end
 
  # 5. convert the new numbers back into letters
  ciphered_str = shifted_str_num.map do |index|
    if index.is_a?(Integer)
      letters_to_numbers.key(index)
    else
      index
    end
  end
 
  # 6. return newly encrypted array as a string
  puts ciphered_str.join.capitalize
end
 
caesar_cipher("Does this work?", 4)
caesar_cipher("It works with normal capitalization...", 20)
caesar_cipher("Eat my shorts!", 13)
caesar_cipher("Zap attack", 25)

# note to self: after looking at the solutions it seems like i really should have just done this with ascii instead of craeting a new hash, since it might have turned out to be a bit simpler/minimal codewise but also it would have made it much easier to convert strings with different capitalization appropriately... and otherwise there obviously seems to be ways i could have simplified the logic using techniques i eitther don't understand fully or just didn't think to use, but i think that's okay being that this is my first, albeit, small ruby project