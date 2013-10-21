require 'nokogiri'
require 'open-uri'

class RottenTomatoesScraper
  attr_accessor :scraped_data

  def initialize(url)
    @scraped_data = Nokogiri::HTML(open(url))
  end

  def get_image
    @scraped_data.css("div.media_block_image.big a img").attr("src")
  end

  # def make_url(actor)
  #   ## take the argument actor... parse it ... and then ammend to the rotten tomatoes url
  #   # http://www.rottentomatoes.com/celebrity/#{ACTOR}
  #   # http://www.rottentomatoes.com/celebrity/matt damon
  # end

  # actor name , matt damon = matt_damon

end


r = RottenTomatoesScraper.new("http://www.rottentomatoes.com/celebrity/matt_damon/")
puts r.get_image