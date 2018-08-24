class CategoriesController < ApplicationController
  
  before_action :require_admin , except: [:index , :show ]
  
  def new
        @category=Category.new
  end 
  
   def create 
  @category=Category.new(category_params)
     if @category.save  
      flash[:success]= "category was created sucessfuly"
       redirect_to categories_path
   else
     render 'new'
     end 
   end
  
  def show 
  end 
  
 
  
  def index 
    @categories=Category.paginate(page:  params[:page] ,per_page: 5)
  end 
  
  
  private
  
  def category_params
  params.require(:category).permit(:name)  
  end 
  
  
  private 
  
  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "only admin can perform this action"
      redirect_to categories_path 
  end 
  end
    
end 