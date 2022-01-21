class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @user_id = current_user.id
  end
  
  def update
    @user = User.find(params[:id])
    @user_id = current_user.id
      if @user.update(user_params)
         redirect_to user_path
         flash[:notice] = 'You have updated user successfully.'
      else
         render :edit
      end
  end 
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
