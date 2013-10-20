require_relative 'spec_helper.rb'

describe API do

  it "returns an actor's movies as an array" do
    api = API.new
    api.show_movies.should eq(["12 Monkeys",
 "The Mexican",
 "Seven",
 "Sinbad: Legend of the Seven Seas",
 "Spy Game",
 "Troy",
 "Being John Malkovich",
 "True Romance",
 "Cool World",
 "Kalifornia",
 "Inglourious Basterds",
 "Legends of the Fall",
 "The Devil's Own",
 "Snatch",
 "Meet Joe Black",
 "Sleepers",
 "No Way Out",
 "Confessions of a Dangerous Mind",
 "Full Frontal",
 "Fight Club",
 "Johnny Suede",
 "Ocean's Twelve",
 "Mr. &amp; Mrs. Smith",
 "Ocean's Eleven",
 "The Assassination of Jesse James by the Coward Robert Ford",
 "Babel",
 "No Man's Land",
 "Ocean's Thirteen",
 "The Favor",
 "Across the Tracks",
 "Cutting Class",
 "Hunk",
 "Less Than Zero",
 "A River Runs Through It",
 "Thelma &amp; Louise",
 "The Curious Case of Benjamin Button",
 "Burn After Reading",
 "Too Young to Die?",
 "Interview with the Vampire: The Vampire Chronicles",
 "Seven Years in Tibet",
 "The Dark Side of the Sun",
 "The Tree of Life",
 "Happy Together",
 "MegaMind",
 "The Image",
 "Happy Feet Two",
 "Moneyball",
 "Ultimate Fights",
 "Killing Them Softly",
 "Beyond All Boundaries",
 "World War Z",
 "12 Years a Slave",
 "Voyage of Time",
 "Two-Fisted Tales",
 "The Tiger",
 "The Counselor",
 "8",
 "Contact",
 "Fury",
 "A Stoning in Fulham County"])
  end



  it "does something else"

end
