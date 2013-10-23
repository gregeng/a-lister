require_relative '../config/environment'
require_relative '../lib/models/timer'

class CLI
  attr_accessor :game, :api, :actor, :movie, :timer, :mode
  TIMER = 30

  def initialize
    @on = true
    @game = Game.new
    @api = API.new
    @mode = "production"
    start_game
  end

  def typewriter_string(string)
    string.chars.each do |x|
      print x
      sleep 0.035
    end
  end

  def start_game
    if self.mode == "production"
      typewriter_string ("Welcome to A-Lister!\n")
      typewriter_string ("Please start by naming your favorite actor or actress!\n")
      assign_movie
      typewriter_string ("Great choice!\n")
      sleep 0.5
      typewriter_string ("#{self.actor} was in :: #{self.movie} ::\n")
      typewriter_string ("Name another actor from :: #{self.movie} ::\n")
      sleep 0.5
      typewriter_string ("You have #{TIMER} seconds.\n")
      sleep 0.5
      puts "Ready..."
      sleep 1
      puts "Set..."
      sleep 1
      puts "Go!\n"
      start_timer
      ask_question
    else
      puts ("Welcome to A-lister!")
      puts ("Please start by naming your favorite actor or actress!")
      assign_movie
      puts ("Great choice!")
      puts ("#{self.actor} was in #{self.movie.upcase}.")
      puts ("Name another actor from #{self.movie.upcase}.")
      puts ("You have #{TIMER} seconds.")
      puts ("Ready...")
      puts ("Set...")
      puts ("Go!")
      start_timer
      ask_question
    end
  end

  def play_correct_sound
    path = Dir.pwd + "/sounds"
    `afplay #{path}/sound_correct.mp3`
  end

  def start_timer
    self.timer = Timer.new(TIMER)
  end

  def assign_movie
    self.actor = get_input
    self.movie = self.api.get_movie(self.actor)
  end

  def ask_question
    line
    puts "Name another actor in :: #{self.movie} ::"
    print_time_remaining
    self.actor = get_input
    check_answer(self.actor)
  end

  def check_answer(actor)
    correct if self.api.check_actor_answer(actor,self.movie)
    wrong if !self.api.check_actor_answer(actor,self.movie)
  end

  def next_movie
    self.movie = self.api.get_movie(self.actor)
    start_timer
    ask_question
  end

  def correct
    play_correct_sound
    line
    puts "CORRECT!"
    line
    self.game.increase_score
    add_correct_answer_object
    if time_left?
      next_movie
    else
      end_game
    end
  end

  def line
    puts "---------------------------"
  end

  def wrong
    line
    puts "WRONG"

    if time_left?
      puts "Guess again!"
      ask_question
    else
      end_game
    end
  end

  def add_correct_answer_object

    CorrectAnswer.new.tap do |x|
      x.name = self.actor;
      x.movie = self.movie;
    end
  end

  def get_input
    gets.strip.split.map(&:capitalize).join(' ')
  end

  def print_time_remaining
    line
    puts "#{self.timer.time_remaining.round(1)} seconds left!"
    line
  end

  def time_left?
    self.timer.time_remaining > 0
  end

  def end_game
    puts "Time's up!\n You got #{self.game.score} answers right"
    puts "Generating results...\n"

    CorrectAnswer.all.each do |ca|
      ca.netflix_id = self.api.get_netflix_id(ca.movie)
      netflix_url = "http://movies.netflix.com/Movie/"+self.api.get_netflix_id(ca.movie)
      ca.headshot = RottenTomatoesScraper.new(ca.name).get_image.to_s
      ca.movie_photo = NetflixScraper.new(netflix_url).get_image.to_s
    end

    # path = Dir.pwd + "/sounds"
    # `afplay -t 5 #{path}/ipanema.mp3`
    SiteGenerator.generate
    exit
  end

end