module ExternalApi
  class Get
    def self.call(url)
      begin
        response = HTTParty.get(url)
        JSON.parse(response.body)
      rescue StandardError => e
        puts "Error occurred: #{e.message}"
        { error: e.message }
      end
    end
  end
end

# ExternalApi::Get.call('https://www.bharian.com.my/api/trending')
# ExternalApi::Get.call('https://says.com/my/api/stories')
# url = 'https://says.com/my/api/stories/tech'
