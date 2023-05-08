#lib/caesar_cipher.rb

# * * * * * * * * * * * * * * * * * * *

# print tests (insert in #caesar_cipher)

# p "str_num = #{str_num}"
# p "shifted_str_num = #{shifted_str_num}"
# p "wrap_alphabet = #{wrap_alphabet(shifted_str_num)}"
# p "ciphered_str = #{ciphered_str}"

# * * * * * * * * * * * * * * * * * * *


# create arrays to zip into Hash
def create_hash
  chars = ('a'..'z').to_a
  numbers = (1..26).to_a

  # zip to hash for use in map
  chars.zip(numbers).to_h
end

def split_str(string, char_num_hash)

  # 2. split the string into individual characters and convert each char to its equivalent num
  string.downcase.split('').map do |char|
    char.count("a-zA-Z") > 0 ? char_num_hash[char] : char
  end
end

def apply_shift_num(str_num, shift_factor)

 # 3. add each number with map
  str_num.map do |num| 
    num.is_a?(Integer) ? num + shift_factor : num
  end
end

def wrap_alphabet(shifted_str_num)

  # 3.5 wrap z to a (and a to z)
  shifted_str_num.map! do |num|
    if num.is_a?(Integer) && num > 26
      num - 26
    elsif num.is_a?(Integer) && num.negative?
      num + 26
    else
      num
    end
  end
end

def num_to_char(shifted_str_num, char_num_hash)

  # 4. convert the new numbers back into letters
  shifted_str_num.map do |index|
    index.is_a?(Integer) ? char_num_hash.key(index) : index
  end
end

# 1. take string and desired shift facor
def caesar_cipher(string, shift_factor)

  char_num_hash = create_hash

  str_num = split_str(string, char_num_hash)

  shifted_str_num = apply_shift_num(str_num, shift_factor)

  wrap_alphabet(shifted_str_num)

  ciphered_str = num_to_char(shifted_str_num, char_num_hash)

  # 5. return newly encrypted array as a string
  puts ciphered_str.join.capitalize
  ciphered_str.join.capitalize
end

# caesar_cipher("Does this work?", 4)
# caesar_cipher("It works with normal capitalization...", 20)
# caesar_cipher("Eat my shorts!", 13)
# caesar_cipher("Zap attack", 25)






# * * * * * * * * * * * * * * * * * * *

# note to self: after looking at the solutions it seems like i really should have just done this with ascii instead of craeting a new hash, since it might have turned out to be a bit simpler/minimal codewise but also it would have made it much easier to convert strings with different capitalization appropriately... and otherwise there obviously seems to be ways i could have simplified the logic using techniques i eitther don't understand fully or just didn't think to use, but i think that's okay being that this is my first, albeit, small ruby project