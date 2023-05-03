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


puts table = TTY::Table.new(
  ["ID", "firt_name", "last_name", "salary", "active"], [
    ["1", employee1.first_name, employee1.last_name, employee1.salary, employee1.active], 
    ["2", employee2.first_name, employee2.last_name, employee1.salary, employee1.active]
]
)
puts table.render(:ascii)

#File.open("savedtable")
File.write("savedtable", "#{table.render(:ascii)}")
#File.close("savedtable")
