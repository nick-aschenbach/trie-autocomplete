require 'sinatra'
require 'json'
require_relative 'lib/trie'

configure do
  words = []
  File.open('dictionary.txt', 'r') do |f|
    f.each_line { |word| words << word.chomp }
  end
  set :trie, Trie.new(words)
end

get '/' do
  erb :index
end

get '/words' do
  content_type :json
  settings.trie.search(params[:term]).to_json if (params[:term])
end
