require_relative '../../config/environment'

class RottenTomatoesScraper

  TOMATOES = "http://www.rottentomatoes.com/celebrity/"

  attr_accessor :scraped_data

  def initialize(actor)
    begin
    actor = actor.downcase.strip.gsub(" ","_").gsub(".","")
    url = TOMATOES + actor
    @scraped_data = Nokogiri::HTML(open(url))
    rescue
      "This person isn't on RottenTomatoes and hence... not an A-Lister!"
    end
  end

  def get_image
    begin
    @scraped_data.css("div.media_block_image.big a img").attr("src").value
    rescue
      "This person isn't on RottenTomatoes and hence... not an A-Lister!"
    end

  end

end
