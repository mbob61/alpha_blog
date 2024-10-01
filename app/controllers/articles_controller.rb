class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #Rails is smart enough to map the returned data from the params into those of the object we're creating
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      # extract the id of the article object, then redirect to `/article/id`
      # The below is a shortcut for redirect_to article_path(@article)
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end