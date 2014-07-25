class Person < ActiveRecord::Base

  validates :first_name, :last_name, :address_line_one, :city, presence: true
  validates_format_of :first_name, :last_name, :with => /[a-z]/
  validates :zip_code, length: { minimum: 5 }
  validates :zip_code, numericality: true
  validates :state, length: { is: 2 }
  validates :email, uniqueness: true, :allow_blank => true

end
