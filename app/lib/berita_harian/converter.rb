module BeritaHarian
  class Converter
    def self.convert_to_object(json)
      json.map do |article|
        BeritaHarian::Object::Article.new(article)
      end
    end

    def self.convert_to_params(json)
      json.map do |article|
        BeritaHarian::Object::Article.new(article).to_params
      end
    end
  end
end


# BeritaHarian::Converter.convert_to_object(response)
