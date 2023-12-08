module BeritaHarian::Service
  class FeedRetriever
    def self.call(url)
      new(url).call
    end

    def initialize(url)
      @url = url
    end

    def call
      response = ExternalApi::Get.call(@url)

      BeritaHarian::Converter.convert_to_object(response)
    rescue => e
      RaiseError.call(e)
    end
  end
end
