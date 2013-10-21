class RottenTomatoesScraper

  TOMATOES = "http://www.rottentomatoes.com/celebrity/"

  attr_accessor :scraped_data

  def initialize(actor)
    @scraped_data = Nokogiri::HTML(open(make_url(actor)))
  end

  def get_image
    @scraped_data.css("div.media_block_image.big a img").attr("src").value
  end

  def urlize_actor(actor)
    actor = actor.downcase.strip.gsub(" ","_")
  end

  def make_url(actor)
    TOMATOES + urlize_actor(actor)
  end

end
