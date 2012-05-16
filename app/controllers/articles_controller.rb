class ArticlesController < ApplicationController
  
  respond_to :json
  
  def index
    @articles = Article.order("created_at DESC")
    respond_with @articles
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with @article
  end
  
  def show
    @article = Article.find(params[:id])
    respond_with @article
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy()
    respond_with @article
  end
  
  def create
    @article = Article.new params[:article]
    @article.save
    respond_with @article
  end
  
  def newest
    @article = Article.order("created_at DESC").first
    respond_with @article
  end
end
