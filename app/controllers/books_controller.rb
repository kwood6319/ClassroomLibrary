class BooksController < ApplicationController
  before_action :set_book, only: [ :archive, :activate ]

  def index
    @books = Book.all
  end

  def archive
    @book.archive!
    redirect_to books_path, notice: "Book archived"
  end

  def activate
    @book.activate!
    redirect_to students_path, notice: "Book activated"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
