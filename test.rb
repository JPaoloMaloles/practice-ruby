#  1. Start with an array of numbers and create a new array with each number times 3.
#     For example, [1, 2, 3] becomes [3, 6, 9].
num = [1, 2, 3]
num2 = []
num.each do |number|
  num2 << number * 3
end
puts num2

#  2. Start with an array of strings and create a new array with each string upcased.
#     For example, ["hello", "goodbye"] becomes ["HELLO", "GOODBYE"].
strings = ["hello", "goodbye"]
strings2 = []
strings.each do |string|
  strings2 << string.upcase
end
puts strings2

#  3. Start with an array of hashes and create a new array of string values from each hash's :name key.
#     For example, [{name: "Alice", age: 27}, {name: "Blane", age: 16}] becomes ["Alice", "Blane"].
hashes = [{ name: "Alice", age: 27 }, { name: "Blane", age: 16 }]
values = []
hashes.each do |hash|
  values << hash[:name]
end
p values

#  4. Start with an array of numbers and create a new array with each number plus 7.
#     For example, [1, 2, 3] becomes [8, 9, 10].
num = [1, 2, 3]
num2 = []
num.each do |number|
  num2 << number + 7
end
p num2

#  5. Start with an array of strings and create a new array with each string's length.
#     For example, ["hello", "goodbye"] becomes [5, 7].
num = ["aaaa", "a"]
num2 = []
num.each do |num|
  num2 << num.length
end
p num2

#  6. Start with an array of hashes and create a new array of number values from each hash's :age key.
#     For example, [{name: "Alice", age: 27}, {name: "Blane", age: 16}] becomes [27, 16].
hashes = [{ name: "Alice", age: 27 }, { name: "Blane", age: 16 }]
ages = []
hashes.each do |hash|
  ages << hash[:age]
end
p ages

#  7. Start with an array of numbers and create a new array with each number divided by 2.
#     For example, [1, 2, 3] becomes [0.5, 1.0, 1.5].
num = [1, 2, 3]
num2 = []
num.each do |number|
  num2 << number / 2.0
end
p num2

#  8. Start with an array of strings and create a new array with each string's first letter only.
#     For example, ["hello", "goodbye"] becomes ["h", "g"].
strings = ["hello", "goodbye"]
strings2 = []
strings.each do |string|
  # tempstring = []
  # tempstring = string.split
  strings2 << string[0]
end
p strings2

# 9.  Start with an array of hashes and create a new array of number values from each hash's :age key times 2.
#     For example, [{name: "Alice", age: 27}, {name: "Blane", age: 16}] becomes [54, 32].
hashes = [{ name: "Alice", age: 27 }, { name: "Blane", age: 16 }]
ages2 = []
hashes.each do |hash|
  ages2 << hash[:age] * 2
end
p ages2

# 10. Start with an array of numbers and create a new array with each number converted into a string.
#     For example, [1, 2, 3] becomes ["1", "2", "3"].
num = [1, 2, 3]
strings = []
num.each do |number|
  strings << number.to_s
end
p strings
