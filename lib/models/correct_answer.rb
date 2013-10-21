require_relative '../../config/environment'

class CorrectAnswer
  attr_accessor :name, :movie, :netflix_id, :headshot, :movie_photo
  @@all = []

  def initialize
    @@all << self
    @name = name
    @movie = movie
    @netflix_id = netflix_id
    @headshot = headshot
    @movie_photo = movie_photo
  end

  def netflix_url
    self.netflix_id
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def headshot
    self.headshot
  end

  def movie_photo
    self.movie_photo
  end

end

# CorrectAnswer.new.tap {|x| x.name = "Brad Pitt" ; x.movie = "Fight Club"; x.netflix_id = "26004747" }
# CorrectAnswer.new.tap {|x| x.name = "Edward Norton" ; x.movie = "American History X"; x.netflix_id = "18002692" }
# CorrectAnswer.new.tap {|x| x.name = "Natalie Portman" ; x.movie = "Garden State"; x.netflix_id = "60034787" }
# CorrectAnswer.new.tap {|x| x.name = "Matt Damon" ; x.movie = "Good Will Hunting"; x.netflix_id = "17405997" }
# CorrectAnswer.new.tap {|x| x.name = "Kevin Spacey" ; x.movie = "American Beauty"; x.netflix_id = "60000407" }
# CorrectAnswer.new.tap {|x| x.name = "Scarlett Johansson" ; x.movie = "The Prestige"; x.netflix_id = "70047095" }
# CorrectAnswer.new.tap {|x| x.name = "Jennifer Lawrence" ; x.movie = "The Breakup"; x.netflix_id = "70206672" }



