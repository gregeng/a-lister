require 'rubygems'
require 'json'
require 'cgi'
require 'httparty'
require 'addressable/uri'

### retrieve the actors in a movie

API_KEY = open(".freebase_api_key").read()
query = [
    { "starring" => [
      {"actor" => [] }
      ],
      "name" => "Fight Club",
      "netflix_id" => [],
      "apple_movietrailer_id" => [],
      "rottentomatoes_id" => [],
      "type" => "/film/film"
      }
    ]

url = Addressable::URI.parse('https://www.googleapis.com/freebase/v1/mqlread')
url.query_values = {
        'query' => query.to_json,
        'key'=> "AIzaSyAYOFVHfpq1D8_vdMFqVAOtn__B7OEx7CE"
}
response = HTTParty.get(url, :format => :json)

actor_size = response['result'][0]['starring'].size
p response['result'].first['starring'][rand(actor_size)]["actor"] # we could say... choose a difficulty level ... and then increase this rand number ... the higher the rand number the higher the chance you are to getting a less known actor in the cast

### retrieve the movies from a particular actor

API_KEY = open(".freebase_api_key").read()
query = [
      {
        "starring" => [
          { "actor" => "brad pitt" }
        ],
        "name" => [],
        "type" => "/film/film"
      }
    ]


url = Addressable::URI.parse('https://www.googleapis.com/freebase/v1/mqlread')
url.query_values = {
        'query' => query.to_json,
        'key'=> "AIzaSyAYOFVHfpq1D8_vdMFqVAOtn__B7OEx7CE"
}
response = HTTParty.get(url, :format => :json)

in_movies = response['result'].size
response['result'][rand(in_movies)]['name']


### the check for actor in a movie

response['result'][0]["starring"].detect { |x| "Matt Damon" == x['actor'].first }


# the check for movie that an actor played in

response['result'].detect { |x| "Up In the Air" == x['name'].first }

# example
netflix_id = http://movies.netflix.com/Movie/16914787

