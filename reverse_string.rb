# original string
string = "This is a string in reverse"
# change to array to manipulate
array = string.split("")
index = array.length
# new array to save reverse version
reverse_array = []

#until loop iterating through array starting with last item in array working down to 0 and saving it to reverse_array
until index == -1
  reverse_array = reverse_array.prepend(array[index])
  index -= 1
end

# stopped here because the until loop didn't work
  