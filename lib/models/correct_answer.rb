require_relative '../../config/environment'

class CorrectAnswer
  attr_accessor :name, :movie, :netflix_id, :headshot, :movie_photo
  @@all = []

  def initialize
    @@all << self
    @name = name
    @movie = movie
    @netflix_id = netflix_id
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end