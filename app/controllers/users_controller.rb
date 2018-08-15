class UsersController < ApplicationController
  def new
    @user=User.new
   end
  
  def create
  @user=User.new(user_params)
    if @user.save
      flash[:success]="welcome #{@user.username}"
    redirect_to articles_path
    else
      render 'new'
    end
  end
  
 
  
  
  private 
  def user_params
  params.require(:users).permit(:password, :username,:email)
  end
end