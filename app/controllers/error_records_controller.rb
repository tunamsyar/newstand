class ErrorRecordsController < ApplicationController
  def index
    @error_records = ErrorRecord.all.order(created_at: :desc)
  end

  def show
    @error_record = ErrorRecord.find(params[:id])
  end

  def retry
    @error_record = ErrorRecord.find(params[:id])
    @error_record.retry!

    flash[:success] = "Sent to queue"
    redirect_to error_records_path
  end
end
