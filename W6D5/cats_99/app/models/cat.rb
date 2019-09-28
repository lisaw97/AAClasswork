class Cat < ApplicationRecord
  COLORS = ['red', 'orange', 'blue']
  validates :birth_date, :name, presence: true
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :sex, presence: true, inclusion: { in: ['M', 'F'] }

  def age
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
