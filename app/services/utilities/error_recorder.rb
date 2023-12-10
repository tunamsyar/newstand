module Utilities
  class ErrorRecorder
    def self.call(function_name:, message:, object:)
      new(function_name, message, object).call
    end

    def initialize(function_name, message, object)
      @function_name = function_name
      @message = message
      @object = object
    end

    def call
      ErrorRecord.create!(
        function_name: function_name,
        message: message,
        errorable: object
      )
    end

    private

    attr_reader :errors, :message
  end
end
