class Author < ApplicationRecord
  has_many :books

  def name
    "#{first_name} #{second_name}"
  end
end
