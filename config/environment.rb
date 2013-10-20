require 'pry'
require 'erb'
require 'json'
require 'httparty'
require 'addressable/uri'
require 'fileutils'

require_relative '../lib/models/api'
require_relative '../lib/models/game'
require_relative '../lib/models/timer'
require_relative '../lib/models/correct_answer'
require_relative '../lib/models/site_generator'
require_relative '../bin/cli'