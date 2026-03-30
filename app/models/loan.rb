class Loan < ApplicationRecord
  include PgSearch::Model
  belongs_to :student
  belongs_to :book


  pg_search_scope :search_by_student_or_book,
  associated_against: {
    student: [ :first_name, :second_name ],
    book: [ :title ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
