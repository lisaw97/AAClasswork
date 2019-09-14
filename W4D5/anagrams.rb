# anagrams

# phase 1 o(n!)

# def first_anagram?(str1, str2)
#   anagrams(str1).include?(str2)
# end

def anagrams(str)
  return [str] if str.length < 2
  result = []
  first = str[0]
  prev_perms = anagrams(str[1..-1])
  prev_perms.each do |perm|
    (0...perm.length).each do |i|
      result << perm[0...i] + first + perm[i..-1]
    end
  end
  result
end

#phase 2 - o(n^3)
def second_anagram?(str1, str2)
  return false if str1.length != str2.length
  str1.each_char do |char|
    if str2.include?(char)
      str2[str2.index(char)] = ""
    end
  end
  str2 == ""
end

# phase 3 - o(n^2)

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end


#phase 4 - O(n)

def fourth_anagram?(str1, str2)
  chars = Hash.new(0)
  str1.each_char {|char| chars[char] += 1}
  str2.each_char {|char| chars[char] -= 1}
  chars.all? {|k, v| v == 0}
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
