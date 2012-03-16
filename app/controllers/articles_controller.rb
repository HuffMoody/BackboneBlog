class ArticlesController < ApplicationController
  
  respond_to :json
  
  def index
    @articles = Article.all
    respond_with @articles
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with @article
  end
end
