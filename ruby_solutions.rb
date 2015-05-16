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

# reverses a string and puts it into a new string -- success
string = "This is a string in reverse"
reverse_string = ""
string.each_char { |c| string_reverse = string_reverse.prepend(c) }


# reverse string prob using recursion -- success
s = "This is a string"
r = ""
num = 0
  def r_str(x, y, z)
    return y if (x.length == y.length)
    y = y.prepend(x[z])
    z += 1
    r_str(x, y, z)
  end


# fizzbuzz problem using for loop -- success
for num in 0..1000
  if num % 15 == 0
    puts "fizzbuzz"
  elsif num % 5 == 0
    puts "buzz"
  elsif num % 3 == 0
    puts "fizz"
  else 
    puts num
  end
end

#  fizzbuzz problem using until loop -- success
x = 0
until x == 1000
  x += 1
  if x % 15 == 0
      puts "fizzbuzz"
  elsif x % 5 == 0
    puts "buzz"
  elsif x % 3 == 0
    puts "fizz"
  else
    puts x
  end
