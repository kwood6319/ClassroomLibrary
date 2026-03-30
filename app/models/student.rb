class Student < ApplicationRecord
  has_many :loans

  def name
    "#{first_name} #{second_name}"
  end

  def archive!
    update!(active: false)
  end

  def activate!
    update!(active: true)
  end
end
