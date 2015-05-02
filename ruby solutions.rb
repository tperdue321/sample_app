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

# reverses a string and puts it into a new string -- success
string = "This is a string in reverse"
reverse_string = ""
string.each_char { |c| string_reverse = string_reverse.prepend(c) }


# reverse string prob using recursion -- success
s = "This is a string"
r = ""
  def r_str(x, y, z)
    return y if (x.length == y.length)
    y = y.prepend(x[z])
    z += 1
    r_str(x, y, z)
  end

# reverse string prob using recursion 
s = "This is a string"
r = ""
  def r_str(x)
    x.length.times do
    x = x.prepend(x[x.first])
    x = x.chop(x[1])
    end
  end
  
s = "This is a string"
r = ""
def r_str(x)
    x = x.concat(x[x.last])
    x = x.delete(x[x.last - 1])
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

#  fizzbuzz problem using while loop -- success
x = 0
while x > 1001 do
  puts "fizzbuzz" if x % 15 == 0 
  puts "buzz" if x % 5 == 0 
  puts "fizz" if x % 3 == 0 
  puts x if x % == 0
  x += 1
end

# fizzbuzz prob

(0..1000).find_all { |n, f, t, a| n % 15 == 0 f % 5 == 0 t % 3 == 0 a % 1 == 0 }


