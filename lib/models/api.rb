require_relative '../../config/environment'

class APICall
  ### make a stub for this test
  # APICall.stub(:do_magic).and_return(json_string)
end

class API

API_KEY = open('config/.freebase_api_key').read()
FREEBASE_URL = Addressable::URI.parse('https://www.googleapis.com/freebase/v1/mqlread')

## split the classes into get / read data classes
## Need to find a way to handle when the query returns nil due to a typo

  def get_movie(actor="Brad Pitt")
    movie_count = show_movies(actor).size
    show_movies(actor)[rand(4)]
  end

  def get_actor(movie="Ocean's Eleven")
    actor_count = show_actors(movie).size
    show_actors(movie)[rand(4)]
  end

  def freebase_magic(query)
    FREEBASE_URL.query_values = {
        'query' => query.to_json,
        'key'=> API_KEY
      }

    HTTParty.get(FREEBASE_URL, :format => :json)
  end

  def show_movies(actor="Brad Pitt")
    query = [
          {
            "starring" => [ { "actor" => actor } ],
            "name" => [],
            "type" => "/film/film"
          }
        ]

    response = freebase_magic(query)
    movies = response['result'].collect { |movie| movie['name'] }
    movies.flatten
  end

  def show_actors(movie="Ocean's Eleven")
    query = [
          {
            "starring" => [ {"actor" => [] } ],
            "name" => movie,
            "netflix_id" => [],
            "type" => "/film/film"
          }
        ]

      response = freebase_magic(query)
      actors = response['result'][0]['starring'].collect { |name| name['actor'] }
      actors.flatten
  end

  def check_actor_answer(actor="Brad Pitt", movie="Fight Club")
    movies = show_movies(actor)
    movies.include?(movie)
  end

  def check_movie_answer(movie="Fight Club", actor="Brad Pitt")
    actors = show_actors(movie)
    actors.include?(actor)
  end

end

api = API.new

#binding.pry
