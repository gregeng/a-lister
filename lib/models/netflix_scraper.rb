require 'nokogiri'
require 'open-uri'


class NetflixScraper
  attr_accessor :scraped_data

  def initialize(url)
    @scraped_data = Nokogiri::HTML(open(url))
  end

  def get_image
    @scraped_data.css("img.boxShotImg").attr("src")
  end

end

n = NetflixScraper.new("http://movies.netflix.com/Movie/18002692")

puts n.get_image


# class RottenTomatoesScraper

#   def make_url(actor)
#     ## take the argument actor... parse it ... and then ammend to the rotten tomatoes url
#     # http://www.rottentomatoes.com/celebrity/#{ACTOR}
#     # http://www.rottentomatoes.com/celebrity/matt damon
#   end

#   actor name , matt damon = matt_damon


# abcdefg = abc_defg

#   def get_image_url

#   end


