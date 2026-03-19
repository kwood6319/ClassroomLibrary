class Student < ApplicationRecord
  has_many :loans

  def name
    "#{first_name} #{second_name}"
  end
end
