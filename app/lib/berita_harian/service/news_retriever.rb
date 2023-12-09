module BeritaHarian::Service
  class NewsRetriever
    def self.call(url)
      new(url).call
    end

    def initialize(url)
      @url = url
    end

    def call
      response = ExternalApi::Get.call(@url)

      BeritaHarian::Converter.convert_to_params(response)
    rescue => e
      RaiseError.call(e)
    end
  end
end
