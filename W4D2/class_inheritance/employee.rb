class Employee
  attr_reader :name, :title, :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.employees << self if !boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

