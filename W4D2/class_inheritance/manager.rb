require_relative 'employee.rb'

class Manager < Employee

  attr_reader :employees

  def initialize(employees)
    @employees = employees
  end

  def bonus(multiplier)
    salary_sum * multiplier
  end
    
  def salary_sum
    # return salary if @employees.nil?

    total = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        total += employee.salary_sum
      else 
        total += employee.salary
      end
    end
    total
  end
  
end

ned = Employee.new("Ned", "Founder", 1000000, nil)
darren = Employee.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

ned = Manager.new([darren])
darren = Manager.new([shawna, david])

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
