class Book < ApplicationRecord
  belongs_to :author
  has_many :loans

  attr_accessor :new_author_first_name, :new_author_second_name

  before_validation :assign_author

  def archive!
    update!(active: false)
  end

  def activate!
    update!(active: true)
  end

  private

  def assign_author
    if new_author_first_name.present? || new_author_last_name.present?
      self.author = Author.find_or_create_by(
        first_name: new_author_first_name,
        second_name: new_author_second_name
      )
    end
  end
end
