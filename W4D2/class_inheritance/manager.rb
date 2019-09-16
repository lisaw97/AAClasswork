require_relative 'employee'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    @employees = []
    super
  end

  def bonus(multiplier)
    employee_salaries * multiplier
  end

  def employee_salaries
    sum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.salary + employee.employee_salaries
      else
        sum += employee.salary
      end
    end
    sum
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
 #employees = [darren]
 #bonus = 78000
darren = Manager.new("Darren", "TA Manager", 78000, ned)
 #employees = [shawna, david]
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)


puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
