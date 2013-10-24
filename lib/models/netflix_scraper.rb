require_relative '../../config/environment'

class NetflixScraper
  attr_accessor :scraped_data

  def initialize(url)
    begin
      @scraped_data = Nokogiri::HTML(open(url))
    rescue
      "unrecognized movie"
    end
  end

  def get_image
    @scraped_data.css("img.boxShotImg").attr("src").value
  end

end
