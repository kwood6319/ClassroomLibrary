class Book < ApplicationRecord
  belongs_to :author
  has_many :loans

  def archive!
    update!(active: false)
  end

  def activate!
    update!(active: true)
  end
end
