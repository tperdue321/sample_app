# original string
string = "This is a string in reverse"
# change to array to manipulate
array = string.split("")
index = 0
# new array to save reverse version
reverse_array = []

#until loop iterating through array starting with first item in array working up and saving it to reverse_array
until index == array.length
  reverse_array = reverse_array.prepend(array[index])
  index += 1
end

# save reversed characters to string
reverse_string = reverse_array.join

#attempting same thing as lines 1-16 in less code -- success
string = "This is a string in reverse"
string_reverse = ""
index = 0
until index == string.length
  string_reverse = string_reverse.prepend(string[index])
  index += 1
end

# attemping same thing in less lines -- failing
string = "This is a string in reverse"
index = 0
reverse_string = ""
reverse_string = reverse_string.prepend(string[index]) while index < string.length; index += 1