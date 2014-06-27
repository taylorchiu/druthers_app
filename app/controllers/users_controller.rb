class UsersController < ApplicationController
  def new
		  @user = User.new
	end

	 def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to Druthers, the Book Voting App!'
      sign_in @user
      redirect_to books_search_path
    else
      flash[:error] = 'Failed to create account.  Try again.'
      redirect_to new_user_path
    end
   end

  def show
  	 @user = User.find(params[:id])
  end

  def update
  	 @user = User.find(params[:id])
  	 @user = update_attributes(user_params)
  	 redirect_to @user
  end

  private
  def user_params
 		 params.require(:user).permit(:name, :email, :password, :password_confirmation)
 	end
end
