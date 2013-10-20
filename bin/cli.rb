require_relative '../config/environment'
require_relative '../lib/models/timer'

class CLI
  attr_accessor :game, :api, :actor, :movie, :timer, :mode
  TIMER = 10

  def initialize 
    @on = true
    @game = Game.new
    @api = API.new
    @mode = "test"
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
      typewriter_string ("Welcome to A-lister!\n")
      typewriter_string ("Please start by naming your favorite actor or actress!\n")
      assign_movie
      typewriter_string ("Great choice!\n")
      sleep 0.5
      typewriter_string ("#{self.actor} was in #{self.movie.upcase}.\n")
      typewriter_string ("Name another actor from #{self.movie.upcase}.\n")
      sleep 0.5
      typewriter_string ("You have #{TIMER} seconds.\n")
      sleep 1.5
      typewriter_string ("Ready...")
      sleep 1
      typewriter_string ("Set...")
      sleep 1
      typewriter_string ("Go!\n")
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

  def start_timer
    self.timer = Timer.new(TIMER)
  end

  def assign_movie
    self.actor = get_input
    self.movie = self.api.get_movie(self.actor)
  end

  def ask_question
    puts print_time_remaining
    puts "Name another actor in #{self.movie}"
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
    puts "CORRECT!"
    self.game.increase_score
    add_correct_answer_object

    if time_left?
      next_movie
    else    
      end_game
    end
  end

  def wrong
    puts "WRONG" 
    
    if time_left?
      puts "Guess again!"
      ask_question
    else
      end_game
    end
  end

  def add_correct_answer_object
    netflix_id = self.api.get_netflix_id(self.movie)
    CorrectAnswer.new.tap {|x| x.name = self.actor ; x.movie = self.movie ; x.netflix_id = netflix_id }
  end

  def get_input
    gets.capitalize.strip
  end

  def print_time_remaining
    puts "There are #{self.timer.time_remaining.round(1)} seconds remaining!"
  end

  def time_left?
    self.timer.time_remaining > 0
  end

  def end_game
    puts "Time's up!\n You got #{self.game.score} answers right"
  end

end