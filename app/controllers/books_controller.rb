class BooksController < ApplicationController
  def top
  end

  def index
  	@books=Book.all
  	@book=Book.new
  end

  def create
  	book=Book.new(book_params)
  	if book.save
  	   redirect_to book_path(book.id), notice:"Book was successfully created.

"
  	else
  	   render action: :new
  	end
  end


  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  	   redirect_to book_path(book.id), notice:"Book was successfully created.

"
  	else
  	   render action: :new
  	end
  	

  end

  def destroy
  	book = Book.find(params[:id])
    if book.destroy
       redirect_to books_path, notice:"Book was successfully destroyed."

    else
  	   render action: :new
  	end


  end

  private
  def book_params
  	params.require(:book).permit(:book_title, :book_body)
  end


end