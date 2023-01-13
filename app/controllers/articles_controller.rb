class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show

  end
  def index
    @articles = Article.all
  end

  def new
    @obj = Article.new
  end

  def edit

  end

  def create
    @obj = Article.new(article_params)
    @obj.user = User.first
    if @obj.save
      flash[:notice] = "Article was created successfully."
      redirect_to @obj
    else
      render 'new'
    end
  end

  def update
    if @obj.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @obj
    else
      render 'edit'
    end
  end

  def destroy
    @obj.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:obj).permit(:title, :description)
  end

  def set_article
    @obj = Article.find(params[:id])
  end
end