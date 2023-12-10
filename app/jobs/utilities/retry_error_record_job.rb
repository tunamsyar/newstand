class RetryErrorRecordJob < ApplicationJob
  sidekiq_options retry: 0

  queue_as :default

  def perform
    ErrorRecord.unresolved.find_each do |error_record|
      record.retry!
    end
  end
end
