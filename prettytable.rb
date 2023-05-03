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

# Creates an array of the employees
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

table = TTY::Table.new(
  ["ID", "firt_name", "last_name", "salary", "active"], employeesarray
)
#Adds existing employees to an array of employees
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


userinput = "~"
while userinput != ""
  #prompts the user
  puts
  puts
  puts "[C]reate, [R]ead, [U]pdate, [D]elete, [Q]uit"
  userinput = gets.chomp().to_s.downcase
  
  # Adds a new employee
  if userinput == "c"
    puts
    puts "First Name:"
    inputfirstname = gets.chomp.to_s.downcase

    puts
    puts "Last Name:"
    inputlastname = gets.chomp.to_s.downcase

    puts
    puts "Salary:"
    inputsalary = gets.chomp.to_i

    puts
    puts "Active (true or false):"
    inputactive = gets.chomp.to_s.downcase
    #adds the inputted attributes into an instance of an employee class
    newemployee = Employee.new(first_name: "#{inputfirstname}", last_name: "#{inputlastname}", salary: inputsalary, active: inputactive)
    #adds that employee to the employees instantial variable of the manager instance of the Manage class
    manager.employees << newemployee
    
    #adds that employee onto the array of employees
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
  elsif userinput == "r"
    #Creates an Array of the Employees
    # employeesarray = []
    # index = 0
    # while index < manager.employees.length
    #   temparray = [(index + 1).to_s]
    #   temparray << manager.employees[index].first_name
    #   temparray << manager.employees[index].last_name
    #   temparray << manager.employees[index].salary
    #   temparray << manager.employees[index].active
    #   employeesarray << temparray
    #   index += 1
    # end
    table = TTY::Table.new(
      ["ID", "firt_name", "last_name", "salary", "active"], employeesarray
    )
    puts
    puts "this is what is printed from reading the file:"
    File.write("savedtable", "EMPLOYEES (#{table.length - 1} total)\n")
    File.write("savedtable", "#{table.render(:ascii)}", mode: "a")
    # PUT CODE HERE TO READ THE FILE FROM HERE
    File.foreach("savedtable") {
      |line| puts line
    }
  elsif userinput == "u"
    # Updates the Active status of an employee
    puts "Employee ID"
    inputemployeeid = gets.chomp().to_i
  elsif userinput == "d"
    # Deletes an employee from the array
    puts "Employee ID"
    inputemployeeid = gets.chomp().to_i
    
    #This is a very roundabout way of doing it
    employeesarray = []
    index = 0
    while index < manager.employees.length 
      if index != inputemployeeid - 1
        temparray = [(index + 1).to_s]
        temparray << manager.employees[index].first_name
        temparray << manager.employees[index].last_name
        temparray << manager.employees[index].salary
        temparray << manager.employees[index].active
        employeesarray << temparray
      end
      index += 1
    end

    table = TTY::Table.new(
      ["ID", "firt_name", "last_name", "salary", "active"], employeesarray
    )
  elsif userinput == "q"
    puts "Goodbye!"
    break
  end
end

puts "If I didnt say goodbye you didnt put in anything"


