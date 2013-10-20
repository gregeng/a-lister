require_relative '../config/environment'
require_relative '../lib/models/timer'

class CLI
  attr_accessor :game, :api, :actor, :movie, :timer, :mode
  TIMER = 30

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
      get_movie
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
      get_movie
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

  def get_movie
    self.actor = get_input
    self.movie = self.api.give_first_movie(self.actor)
  end

  def ask_question
    puts "Name another actor in #{self.movie}"
    self.actor = get_input
    check_answer(self.actor)
  end

  def check_answer(actor)
    correct if self.api.check_actor_answer(actor,self.movie)
    wrong if !self.api.check_actor_answer(actor,self.movie)
  end

  def correct
    self.game.increase_score
    add_correct_answer_object

    puts "CORRECT!"
    print_time_remaining
  
    next_movie
  end

  def next_movie
    self.movie = self.api.give_first_movie(self.actor)

    start_timer
    ask_question 
  end

  def add_correct_answer_object
    CorrectAnswer.new.tap {|x| x.name = self.actor ; x.movie = self.movie } # x.netflix_id = 26004747
  end

  def wrong
    puts "WRONG" 
    print_time_remaining
    puts "Guess again!"
    
    check_timer
  end

  def get_input
    gets.capitalize.strip
  end

  def print_time_remaining
    puts "There are #{self.timer.time_remaining.round(1)} seconds remaining!"
  end

  def check_timer
    if self.timer.time_remaining > 0
      ask_question
    else
      end_game
    end
  end

  def end_game
    puts "Game over. You got #{self.game.score} answers right"
  end

end