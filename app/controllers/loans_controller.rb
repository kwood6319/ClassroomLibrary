class LoansController < ApplicationController
  before_action :set_loans, only: [ :new, :create ]
  before_action :set_students, only: [ :new, :create ]
  before_action :set_books, only: [ :new, :create ]

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      redirect_to new_loan_path, notice: "Book loaned"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def archive
    @book = Book.find(params[:id])
    @book.update(active: false)
  end


  private

  def loan_params
    params.require(:loan).permit(:book_id, :student_id, :date_borrowed, :date_due)
  end

  def set_loans
    @loans = Loan.all
  end

  def set_students
    @students = Student.all
  end

  def set_books
    @books = Book.all
  end
end
