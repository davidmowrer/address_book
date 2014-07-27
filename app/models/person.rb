class Person < ActiveRecord::Base

  validates :first_name, :last_name, :address_line_one, :city, presence: true
  validates_format_of :first_name, :last_name, :with => /[a-z]/
  validates :zip_code, length: { minimum: 5 }
  validates :zip_code, numericality: true
  validates :email, uniqueness: true, :allow_blank => true
  alidates :state, length: { is: 2 }
  validates :state, format: { with: /\A[A-Z]+\z/,
                              message: "only allows 2 Capital letters" }
  validates :state, inclusion: { in: %w(AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY),
                                 message: "field only allows US States" }

end
