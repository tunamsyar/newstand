
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

  def show
    @publisher = publisher
  end

  def new
    @publisher = publisher
    publisher.feed_methods.build
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
    params.require(:publisher)
          .permit(:name,
                  :language,
                  feed_methods_attributes: [:source_url, :pull_method]
          )
  end

  def publisher
    @publisher ||= Publisher.find_by(id: params[:id]) || Publisher.new
  end
end
