class BooksController < ApplicationController
  before_action :set_book, only: [ :archive, :activate ]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)
    @authors = Author.all

    if @book.save
      redirect_to books_path, notice: "Book was successfully registered!"
    else
      render :new, status: :unprocessable_entity
    end
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

  def book_params
    params.require(:book).permit(:title, :author_id)
  end
end
