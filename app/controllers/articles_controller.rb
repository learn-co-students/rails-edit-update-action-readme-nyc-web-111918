class ArticlesController < ApplicationController
  # before_action :find_article, only: [:show,:edit, :update]
  def index
    @articles = Article.all
  end

  def show
    # find_article
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    # find_article
    @article = Article.find(params[:id])
  end

  def update
    # raise params.inspect
    # find_article
    @article = Article.find(params[:id])
    # byebug
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to article_path(@article)
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

end # end of ArticlesController class
