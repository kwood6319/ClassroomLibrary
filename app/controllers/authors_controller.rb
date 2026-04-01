class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to books_path, notice: "Author was successfully registered!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :second_name)
  end
end
