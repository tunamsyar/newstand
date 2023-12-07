
class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(published_at: :desc)
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
