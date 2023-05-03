gem "tty-table"
require "tty-table"

class Employee
  attr_reader :first_name, :last_name, :salary, :active
  attr_writer :active

  def initialize(input_options)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

employee1 = Employee.new({ first_name: "Majora", last_name: "Carter", salary: 80000, active: true })
employee2 = Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee1.print_info
employee2.print_info

class Manager < Employee
  attr_reader :employees
  attr_reader :employees
  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end

  def give_all_raises
    @employees.each do |employee|
      employee.give_annual_raise
    end
  end

  def fire_all_employees
    @employees.each do |employee|
      employee.active = false
    end
  end

  def send_report
    puts "Sending email..."
    # use email sending library...
    puts "Email sent!"
  end
end

manager = Manager.new(first_name: "Saron", last_name: "Yitbarek", salary: 100000, active: true, employees: [employee1, employee2])

# NEED TO MAKE IT CLOSER TO THE GIF (ADD LINES)
employeesarray = []
index = 0
while index < manager.employees.length
  temparray = [(index + 1).to_s]
  temparray << manager.employees[index].first_name
  temparray << manager.employees[index].last_name
  temparray << manager.employees[index].salary
  temparray << manager.employees[index].active
  employeesarray << temparray
  index += 1
end
#right now it is adding the number follow by the entire class. Instead, I need the instance variables of the class]


# table = TTY::Table.new(
#   ["ID", "firt_name", "last_name", "salary", "active"], [
#     ["1", employee1.first_name, employee1.last_name, employee1.salary, employee1.active], 
#     ["2", employee2.first_name, employee2.last_name, employee1.salary, employee1.active]
#   ]
# )

puts "CAT"
p employeesarray
puts "CAT"
table = TTY::Table.new(
  ["ID", "firt_name", "last_name", "salary", "active"], employeesarray
)
puts
puts "EMPLOYEES (#{table.length - 1} total)"
puts table.render(:ascii)

puts
puts "this is what is printed from reading the file:"
File.write("savedtable", "EMPLOYEES (#{table.length - 1} total)\n")
File.write("savedtable", "#{table.render(:ascii)}", mode: "a")
# PUT CODE HERE TO READ THE FILE FROM HERE
File.foreach("savedtable") {
  |line| puts line
}
# Put in code to handle inputs
#[C]reate, [R]ead, [U]pdate, [D]elete, [Q]uit

puts "[C]reate, [R]ead, [U]pdate, [D]elete, [Q]uit"
userinput = gets.chomp().to_s.downcase

if userinput == "c"

elsif userinput == "r"
elsif userinput == "u"
elsif userinput == "q"
  puts "Goodbye!"
end
