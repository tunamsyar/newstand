require 'rss'
require 'open-uri'

class Rss
  def initialize(url)
    @url = url
  end

  def get_feed
    if items.present?
      items
    else
      []
    end
  rescue StandardError => e
    puts "Error occurred: #{e.message}"
    []
  end

  private

  attr_reader :url

  def open(url)
    URI.open(url)
  end

  def xml_document
    @_xml_document ||= open(url)
  end

  def parsed_xml
    @_parsed_xml ||= Nokogiri::XML(xml_document)
  end

  def items
    @_items ||= parsed_xml.xpath('//item')
  end
end
