require_relative '../config/environment'

class CLI
  attr_accessor :game, :api

  def initialize 
    #@on = true
    self.game = Game.new
    self.api = API.new
    start_game
  end

  def start_game
    puts "Select actor or movie"
    self.game.type = gets.capitalize.strip
    self.send("get_#{self.game.type.downcase}")
  end

  def get_movie
    #self.api.get_movie_name
    self.game.current_movie = "Saving Private Ryan"
  end

  def get_actor
    #self.api.get_actor_name
    self.game.current_actor = "Matt Damon"
  end

  def ask_question
    puts "Name another actor in #{self.game.current_movie}" if self.game.type = "movie"
    check_answer(gets.capitalize.strip)
  end

  def check_answer(actor)
    right_answer if self.api(actor,self.game.current_movie)
    wrong_answer if !self.api(actor,self.game.current_movie)
  end

  def right_answer
    puts "Correct! You get 1 point."
    puts "Enter Q to quit or P to play another turn"
    get_input
  end

  def wrong_answer
    puts "Sorry, wrong answer."
    puts "Enter P to play again or Q to quit"
  end

  def get_input
    gets.capitalize.strip
  end

  def do_turn
    #pick Actor or Movie DONE
    #--picks Actor DONE
    #returns a random movie with that Actor DONE
    #puts "Name another actor in that movie" DONE
    #--answer question DONE
    #If right: puts "Great job. Play again?" DONE
    #If wrong: puts "Sorry, wrong answer. Guess again, start over, or quit?" DONE
  end



end