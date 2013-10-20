class Game

  attr_accessor :question, :score, :current_actor, :movie, :type

  def initialize
    @score = 0
  end

  def increase_score
    self.score += 1
  end

end