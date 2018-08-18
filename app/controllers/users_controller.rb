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
  
 def edit 
 @user=User.find(params[:id])
   
 end
 
  
  def index
  @users=User.paginate(page: params[:page], per_page: 5)
  end
  
  
 def update
     @user=User.find(params[:id])
   if @user.update(user_params)
     flash[:success]="account updated succesfuly"
     redirect_to articles_path
   else
   render 'edit'
     
   end
 end
  
  def show
  
    @user=User.find(params[:id])
    @user_articles=@user_articles.paginate(page: params[:page], per_page: 5)
    
  
  end
  
  private 
  def user_params
  params.require(:user).permit(:password, :username,:email)
  end
end