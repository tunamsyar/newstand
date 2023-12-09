
class ArticlesController < ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result
                  .includes(:publisher)
                  .order(published_at: :desc)
                  .page(params[:page])
                  .per(15)
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
