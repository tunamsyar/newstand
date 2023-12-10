class ErrorResolverJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :error_resolver

  def perform(error_record_id)
    error_record = ErrorRecord.find(error_record_id)

    if error_record.function_name.constantize.call(error_record.errorable)
      error_record.resolve!
    end

  rescue StandardError => e
    error_record.update!(message: e.message)
  end
end
