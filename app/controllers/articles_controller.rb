require "byebug"
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    #LONG WAY!!!
    # @article = Article.new
    # @article.title = params[:title]
    # @article.description = params[:description]
    # @article.save
    @article = Article.create(article_params)
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def update
    @article = Article.find(params[:id]) #this can be placed in a helper method.
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to @article
  end

  private

  def article_params
    # byebug
    params.permit(:title, :description)
  end

end
