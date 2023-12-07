module ExternalApi
  class Get
    def self.call(url)
      response = HTTParty.get(url)
      JSON.parse(response.body)
    end
  end
end

# ExternalApi::Get.call('https://www.bharian.com.my/api/trending')
