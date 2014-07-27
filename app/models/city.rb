class City < ActiveRecord::Base

  validates :elevation,
            numericality: {
              greater_than_or_equal_to: 3315,
              if: lambda { |city| city.state == 'CO' },
              message: 'is too low, the lowest elevation in Colorado is 3,315 feet'
            }
  validates :name, :state, :elevation, :population, presence: true
  validates :state, length: { is: 2 }
  validates :state, format: { with: /\A[A-Z]+\z/,
                              message: "only allows 2 Capital letters" }
  validates :state, inclusion: { in: %w(AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY),
                                 message: "field only allows US States" }
  validates :elevation, :population, numericality: true
  validates :population, numericality: { greater_than: 0 }

end
