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

reverse_string = reverse_array.join
