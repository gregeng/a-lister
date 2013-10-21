class NetflixScraper
  attr_accessor :scraped_data

  def initialize(url)
    @scraped_data = Nokogiri::HTML(open(url))
  end

  def get_image
    @scraped_data.css("img.boxShotImg").attr("src").value
  end

end
