class Employee
  # Sets up instance variables, as well as getters and setters via obj.instanceVariable
  attr_accessor :name, :phone, :comp, :net

  # Constructor
  # Explicit overloading not allowed, so check via number of arguments
  def initialize(*args)  # *args will put any paramters in an array named args
    if args.size == 1
      @name = args[0]
    else
      @name = args[0]
      @phone = args[1]
      @comp = args[2]
      @net = args[3]
    end    
  end

  def doesPhone
    @phone == "1"
  end
  
  def doesComp
    @comp == "1"
  end

  def doesNet
    @net == "1"
  end

  # Overriding the equality operator for the class
  def ==(o)
    return @name == o.name
  end

  # Overriding the "to string" method for the class
  def to_s
    "Name: #{name}, Phone: #{@phone}, Comp: #{@comp}, Net: #{@net}"
  end
end

# Result of method's last line will automatically return, so no need for explicit return statement
def shiftOk(shift)
  $records[shift[0]].doesPhone && $records[shift[1]].doesPhone && $records[shift[2]].doesComp && $records[shift[3]].doesNet
end

assignments = Array.new

# Two dots is a range w/ inclusive upper bound
for i in 0..3
  s = gets.chomp
  sa = s.split(" ")
  sa.each do |i|
    assignments.push(i)
  end
end

$records = Hash.new
numOfRecs = gets.to_i

# Triple dot is a range w/ exclusive upper bound
# Everything is an object- even a range of numbers
(0...numOfRecs).each do |x|
  empArray = gets.split(" ")
  $records[empArray[0]] = Employee.new(empArray[0],empArray[1],empArray[2],empArray[3])
end

acceptable = true
if assignments.uniq.length != assignments.length then
  puts "Not Acceptable"
  exit(0)
end

# Iterate through every slice with starting indices offset by 4
assignments.each_slice(4) do |i|
  if !shiftOk(i)  # "then" keyword is optional
    puts "Not Acceptable"
    exit(0)
  end
end

puts "Acceptable"
