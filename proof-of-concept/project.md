  command land program to put in actor 1, then actor 2 ... and then figure out the degrees of separation

recusrive


command line - type in the first actor
then the second actor

the output would be - was in this movie with this person

then you could say like generate an html page - and that generates the html page based on the erb template



difficult bits:

algorithm
database
scrape



you could make a html template without touching anything

### Pseudo Code

Enter Actor 1
Enter Actor 2

Using the Freebase API, go to Actor 1's page.  Then loop through all the movies from Actor 1's page.  Then go to all those movies in degree 1 and look at all those actors in those movies.  Repeat until Actor 2 is included in any of these degree movie pages.  But then how do we figure out how to go by the easiest connection?


its a cli where you either choose at the beginning whether you want to name the actors or ther movies.  you give an actor and then it calls the freebase api and then returns the first or random movie that that actor has starred in ... then it prompts again and asks you for an actor in that movie... the user inputs something and then it calls the api to check if that actor is included in the movie ... if false ... then say try again.. or quit .. if true .. then it starts again and then calls another random movie. each correct answer the movie and actor should be saved somewhere in a hash or array or something and then those results should trigger the the erb template when you call the generate method and then that will present an erb template with pictures of the actor ... movie ... and mayube link to youtube video. this would solve the problem of recursive searching and need for a static database/.


Domain Model
  class Actor
  class Movie
  class API
  class CLI

CLI
HTML ERB
No Need for a Database

For presentaton:
  Lessons Learned
  Goals
  Things we could make better in teh future
  Predictive Search
  Game Difficulty with random generator
  More Testing

  it should make sure all the gems and dependencies are installed

  simple cov

  get it to work then write tests then refector around tests

  use emojis in the command line to keep track of all the correct answers

  how to prevent repeats which would just allow a user to go through the movies and answers over and over again to just rack up points

  type something like "the show's over" to end the program





