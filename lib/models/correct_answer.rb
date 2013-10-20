require_relative '../../config/environment'

class CorrectAnswer
  attr_accessor :name, :movie, :netflix_id
  @@all = []

  def initialize
    @@all << self
    @name = name
    @movie = movie
    @netflix_id = netflix_id
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
end

# CorrectAnswer.new.tap {|x| x.name = "Brad Pitt" ; x.movie = "Fight Club"; x.netflix_id = "26004747" }
# CorrectAnswer.new.tap {|x| x.name = "Edward Norton" ; x.movie = "American History X"; x.netflix_id = "18002692" }
# CorrectAnswer.new.tap {|x| x.name = "Natalie Portman" ; x.movie = "Garden State"; x.netflix_id = "60034787" }
# CorrectAnswer.new.tap {|x| x.name = "Matt Damon" ; x.movie = "Good Will Hunting"; x.netflix_id = "17405997" }
# CorrectAnswer.new.tap {|x| x.name = "Kevin Spacey" ; x.movie = "American Beauty"; x.netflix_id = "60000407" }
# CorrectAnswer.new.tap {|x| x.name = "Scarlett Johansson" ; x.movie = "The Prestige"; x.netflix_id = "70047095" }
# CorrectAnswer.new.tap {|x| x.name = "Jennifer Lawrence" ; x.movie = "The Breakup"; x.netflix_id = "70206672" }

#binding.pry

## what do we do if there is no netflix title?

## Stephanie:

## The algorithm idea was logistically tough.  The database wouldve been too big and we wouldve exhausted out API call limit too quickly.
## so instead we're going to build a fun little game. it will be a cli interface.
## the user will be prompted to enter an actor or actress
## our game will respond back with a movie that the actor or actress is in
## the user will have to type another actor or actress in that movie to continue.
## if he/she gets it right ... they will be prompted with another movie!
## each time he/she gets it right ... the correct answer will be saved and an instance of CorrectAnswer will be generated
## at the end of the game ... when the user can't guess any more actors... he/she can type something like ... game over.
## when he/she says game over ... that will kick off a method in a generate script that makes one single static html page.
## which is where you come in!!!! ...


## Context: At the end of the game ... we're going to generate an HTML page with a list of all the correct answers of the player.
## Each correct answer will have the actor name, movie name, and the netflix id.
## We can use the netflix id to do something cool with this webpage .. scrape it for images... whatever
## http://movies.netflix.com/Movie/26004747
## Use each of those 7 instances above as sample data to design the show.erb page.
## Ultimately we want to be able to generate ONE html page that shows all the correct answers(actor, movie, netflix movie)
## feel free to go nuts with this! make it as cool as you want. throw in some css if you want.
## I would imagine you will need to write some placeholder code to generate a page using this mock data.
## you can do that in the generate file at config/generate.rb
## let us know if you have any questions!




