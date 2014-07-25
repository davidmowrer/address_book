class City < ActiveRecord::Base

  validates :elevation,
            numericality: {
              greater_than_or_equal_to: 3315,
              if: lambda { |city| city.state == 'CO' },
              message: 'is too low, the lowest elevation in Colorado is 3,315 feet'
            }
  
  validates :name, :state, :elevation, :population, presence: true
  validates :state, length: { is: 2 }
  validates :elevation, :population, numericality: true
  validates :population, numericality: { greater_than: 0 }

end
