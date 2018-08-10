class ArticlesController < ApplicationController
  
  def index
  @articles=Article.all 
  end
def new 
  @article=Article.new
end 
  def create
    #render plain: params[:article].inspect    %%to check in the params passsed 
    @article=Article.new(article_params)
    if @article.save
      flash[:notice]= "Article sucessfully created"
      redirect_to  article_path(@article)
    else
      render 'new'
    end
  end 
  
  def destroy 
   @article= Article.find (params[:id])
   if  @article.destroy
     flash[:notice]= "article was succesfuly deleted "
     redirect_to articles_path 
   else
     puts "something go wrong while trying to delete #{@article.title}"
    end
  end 
  
  def edit 
  @article=Article.find(params[:id])
  end

 def update 
 @article=Article.find(params[:id])
   if @article.update(article_params)
     flash[:notice]="updated succesfully"
     redirect_to article_path(@article)
   else
     render 'edit'
   end
 end
  
  def show
  @article=Article.find(params[:id])
  end
  
  private
  def article_params
  params.require(:article).permit(:title, :description)
    
  end
end 