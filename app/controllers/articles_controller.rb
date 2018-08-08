class ArticlesController < ApplicationController
def new 
  @article=Article.new
end 
  def create
    #render plain: params[:article].inspect    %%to check in the params passsed 
    @article=Article.new(article_params)
    if @article.save
      flash[:notice]= "Article sucessfully created"
      redirect_to articles_show(@article)
    else
      render 'new '
    end
  end 
  
  
  private
  def article_params
  params.require(:article).permit(:title, :description)
    
  end
end 