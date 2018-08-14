class ArticlesController < ApplicationController
  
  before_action :set_article , only:  [:edit , :update , :show, :destroy]
  
  def index
  @articles=Article.all 
  end
def new 
  @article=Article.new
end 
  def create
    
    #render plain: params[:article].inspect    %%to check in the params passsed 
    @article=Article.new(article_params)
    @article.user=User.first
    if @article.save
      flash[:success]= "Article sucessfully created"
      redirect_to  article_path(@article)
    else
      render 'new'
    end
  end 
  
  def destroy 
   
   if  @article.destroy
     flash[:danger]= "article was succesfuly deleted "
     redirect_to articles_path 
   else
     puts "something go wrong while trying to delete #{@article.title}"
    end
  end 
  
  def edit 
 
  end

 def update 
 
   if @article.update(article_params)
     flash[:success]="updated succesfully"
     redirect_to article_path(@article)
   else
     render 'edit'
   end
 end
  
  def show
  
  end
  
  private
  
  def set_article
  @article=Article.find(params[:id])
  end
  
  
  
  def article_params
  params.require(:article).permit(:title, :description)
    
  end
end 