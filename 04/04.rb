def parse_input(file)
  File.readlines(file).map do |line|
    line.chomp
  end
end

def check(string)
  a = string.split(' ')
  a.uniq.count == a.count
end

input = parse_input("./input.txt")

# part 1
res = input.map do |passphrase|
  check(passphrase)
end.reject {|result| result == false }.count

p res

def check_with_anagram(string)
  a = string.split(' ')
  ordered = a.map { |w| w.chars.sort.join }
  ordered.uniq.count == ordered.count
end
# For added security, yet another system policy has been put in place. Now, a valid passphrase must contain no two words that are anagrams of each other - that is, a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.

# For example:

p check_with_anagram("abcde fghij") == true
p check_with_anagram("abcde xyz ecdab") == false
p check_with_anagram("a ab abc abd abf abj") == true
p check_with_anagram("iiii oiii ooii oooi oooo") == true
p check_with_anagram("oiii ioii iioi iiio") == false

res = input.map do |passphrase|
  check_with_anagram(passphrase)
end.reject {|result| result == false }.count

p res
