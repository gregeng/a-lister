require_relative '../config/environment'
require_relative '../lib/models/timer'

class CLI
  attr_accessor :game, :api, :actor, :movie, :timer

  def initialize 
    @on = true
    @game = Game.new
    @api = API.new
    start_game
  end

  def start_game
    puts "Hello, and welcome to A-lister!"
    puts "Your job is to name as many actors as possible from the same movie."
    puts "Please start by naming your favorite actor or actress!"
    self.actor = gets.capitalize.strip
    self.game.movie = self.api.give_first_movie(self.actor)
    puts "Great choice! #{self.actor} was in #{self.game.movie.upcase}."
    puts "How many more actors can you name from that movie?"
    puts "You have 30 seconds"
    puts "Ready...set....go!"
    start_timer
    ask_question
  end

  def start_timer
    self.timer = Timer.new(30)
  end

  def ask_question
      puts "Name another actor in #{self.game.movie}"
      guess = gets.capitalize.strip
      check_answer(guess)
  end

  def check_answer(actor)
    right_answer if self.api.check_actor_answer(actor,self.game.movie)
    wrong_answer if !self.api.check_actor_answer(actor,self.game.movie)
  end

  def right_answer
    self.game.increase_score
    puts "Correct!"
    print_time_remaining
    
    check_timer   
  end

  def wrong_answer
    puts "WRONG" 
    print_time_remaining
    puts "Guess again!"
    
    check_timer
  end

  def get_input
    gets.capitalize.strip
  end

  def print_time_remaining
    puts "There are #{self.timer.time_remaining} seconds remaining!"
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