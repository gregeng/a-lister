require_relative 'spec_helper.rb'

describe CorrectAnswer do

  it "keeps track of all instances of itself" do
    CorrectAnswer.reset_all
    5.times { CorrectAnswer.new }
    CorrectAnswer.all.count.should eq(5)
  end

  it "can reset all instances of itself" do
    10.times { CorrectAnswer.new }
    CorrectAnswer.reset_all
    CorrectAnswer.all.count.should eq(0)
  end

  it "can assign an actor/actress name to an instance" do
    CorrectAnswer.reset_all
    c = CorrectAnswer.new
    c.name = "Brad Pitt"
    c.name.should eq("Brad Pitt")
  end

  it "can assign movie to an instance" do
    CorrectAnswer.reset_all
    c = CorrectAnswer.new
    c.movie = "Fight Club"
    c.movie.should eq("Fight Club")
  end

  it "can assign a netflix id to an instance" do
    CorrectAnswer.reset_all
    c = CorrectAnswer.new
    c.netflix_id = "26004747"
    c.netflix_id.should eq("26004747")
  end

end
