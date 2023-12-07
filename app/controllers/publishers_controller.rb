
class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      flash[:success] = "Publisher added"
      redirect_to publishers_path
    else
      flash[:error] = @publisher.errors.full_messages
      render :new
    end
  end

  def new
    @publisher = publisher
  end

  def edit
    @publisher = publisher
  end

  def update
    if publisher.update(publisher_params)
      flash[:success] = "Publisher updated"
      redirect_to publishers_path
    else
      flash[:error] = @publisher.errors.full_messages
      render :edit
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name, :rss_url, :language)
  end

  def publisher
    @publisher ||= Publisher.find_by(id: params[:id]) || Publisher.new
  end
end
