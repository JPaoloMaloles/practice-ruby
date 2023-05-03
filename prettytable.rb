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
while userinput != "c" || userinput != "r" || userinput != "u" || userinput != "d" || userinput != "q"
  #Creates an Array of the Employees
  puts "---------------------------------------------------------------------"
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

  #Creates the table
  table = TTY::Table.new(
    ["ID", "firt_name", "last_name", "salary", "active"], employeesarray
  )

  #Writes the Title and the Table into the file
  puts
  File.write("savedtable", "EMPLOYEES (#{table.length - 1} total)\n")
  File.write("savedtable", "#{table.render(:ascii)}", mode: "a")
  
  #Prints the file line-byline
  File.foreach("savedtable") {
    |line| puts line
  }
  puts
  
  #prompts the user
  puts
  puts
  puts "[C]reate, [R]ead, [U]pdate, [D]elete, [Q]uit"
  userinput = gets.chomp().to_s.downcase
  
  if userinput == "c" # ---------------------------------------------------------------------------------------------- "C"
    # Adds a new employee
    puts
    puts "First Name:"
    inputfirstname = gets.chomp.to_s.downcase
    #split here to capitalize
    inputfirstnamearray = inputfirstname.chars
    inputfirstnamearray[0] = inputfirstnamearray[0].upcase
    inputfirstname = inputfirstnamearray.join

    puts
    puts "Last Name:"
    inputlastname = gets.chomp.to_s.downcase
    inputlastnamearray = inputlastname.chars
    inputlastnamearray[0] = inputlastnamearray[0].upcase
    inputlastname = inputlastnamearray.join

    puts
    puts "Salary:"
    inputsalary = gets.chomp
    while !inputsalary.scan(/\D/).empty?
      puts
      puts "Numbers only please"
      puts "Salary:"
      inputsalary = gets.chomp
    end

    puts
    puts "Active (true or false):"
    inputactive = gets.chomp.to_s.downcase
    while inputactive != "true" && inputactive != "false"
      puts
      puts "true or false only please"
      puts "Active (true or false):"
      inputactive = gets.chomp.to_s.downcase
    end
    
    #adds the inputted attributes into an instance of an employee class
    newemployee = Employee.new(first_name: "#{inputfirstname}", last_name: "#{inputlastname}", salary: inputsalary, active: inputactive)
    
    #adds that employee to the employees instantial variable of the manager instance of the Manage class
    manager.employees << newemployee
  elsif userinput == "r" # ---------------------------------------------------------------------------------------------- "R"
    #Prints out the employee ID
    puts "Employee ID"
    inputemployeeid = gets.chomp().to_i

    #Checks to make sure the ID doesnt correlate to a negative index or an index greater than the # of employees
    while inputemployeeid < 0 || inputemployeeid > manager.employees.length
      if inputemployeeid > manager.employees.length
        puts
        puts "That index is outside the number of the employees (#{manager.employees.length}) !"
        puts "INPUT EMPLOYEE ID AGAIN"
      elsif inputemployeeid < 0
        puts
        puts "No negative numbers please"
        puts "INPUT EMPLOYEE ID AGAIN"
      end
      inputemployeeid = gets.chomp().to_i
      puts
    end
    
    puts
    puts
    puts "Here is Employee #{inputemployeeid}'s info:"
    puts "First Name: #{manager.employees[inputemployeeid - 1].first_name}"
    puts "Lastt Name: #{manager.employees[inputemployeeid - 1].last_name}"
    puts "Salary: #{manager.employees[inputemployeeid - 1].salary}"
    puts "Active: #{manager.employees[inputemployeeid - 1].active}"
    puts
  elsif userinput == "u" # ---------------------------------------------------------------------------------------------- "U"
    # Updates the Active status of an employee
    puts "Employee ID"
    inputemployeeid = gets.chomp().to_i

    #Checks to make sure the ID doesnt correlate to a negative index or an index greater than the # of employees
    while inputemployeeid < 0 || inputemployeeid > manager.employees.length
      if inputemployeeid > manager.employees.length
        puts
        puts "That index is outside the number of the employees (#{manager.employees.length}) !"
        puts "INPUT EMPLOYEE ID AGAIN"
      elsif inputemployeeid < 0
        puts
        puts "No negative numbers please"
        puts "INPUT EMPLOYEE ID AGAIN"
      end
      inputemployeeid = gets.chomp().to_i
      puts
    end


    puts "Set Active (#{manager.employees[inputemployeeid - 1].active}):"
    inputactive = gets.chomp().to_s

    manager.employees[inputemployeeid - 1].active = inputactive

    puts
    puts "Changed it"
  elsif userinput == "d" # ---------------------------------------------------------------------------------------------- "D"
    # Deletes an employee from the array
    puts "Employee ID"
    inputemployeeid = gets.chomp().to_i

    #Checks to make sure the ID doesnt correlate to a negative index or an index greater than the # of employees
    while inputemployeeid < 0 || inputemployeeid > manager.employees.length
      if inputemployeeid > manager.employees.length
        puts
        puts "That index is outside the number of the employees (#{manager.employees.length}) !"
        puts "INPUT EMPLOYEE ID AGAIN"
      elsif inputemployeeid < 0
        puts
        puts "No negative numbers please"
        puts "INPUT EMPLOYEE ID AGAIN"
      end
      inputemployeeid = gets.chomp().to_i
      puts
    end

    #This is a very roundabout way of doing it
    manager.employees.delete_at(inputemployeeid - 1)
  elsif userinput == "q" # ---------------------------------------------------------------------------------------------- "Q"
    puts "Goodbye!"
    break
  end
end