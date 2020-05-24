class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:index,:show,:edit]

	def new
		@book = Book.new
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@books = Book.all
		@user = current_user

		if @book.save
		  redirect_to book_path(@book), notice: 'You have creatad book successfully.'
		else
		  flash[:notice]='error'
		  @books = Book.all
		  @user = current_user
		  render :index
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find_by(id:@book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
		@user = User.find_by(id:@book.user_id)
		if current_user != @user
  	 	  redirect_to books_path
    	end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book),notice: 'You have updated book successfully.'
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end



	private
	def book_params
		params.require(:book).permit(:title,:body,:user_id)
	end
end
