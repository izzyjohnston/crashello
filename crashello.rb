require 'rubygems'
require 'sinatra'
require 'json'
require 'trello'

Trello.configure do |config|
  config.consumer_key = ENV['TRELLO_API_KEY']
  config.consumer_secret = ENV['TRELLO_OAUTH_SECRET']
  config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
end

configure do
  @@board = Trello::Board.all.find {|board| board.name == ENV['TRELLO_BOARD_NAME']}
end

post '/kaboom' do
  if !params['board-name'].nil?
    list = board.lists.find {|list| list.name == params['board-name']}
    if !list.nil?
      trello_list_id = list.id
  
      params = JSON.parse(request.body.read.to_s)

      if params['event'] == 'issue_impact_change' && params['payload']
        payload = params['payload']

        puts "Creating card with title: #{payload['title']} with details #{payload['url']}"

        Trello::Card.create(
          :name => "CRASH: #{payload['title']}\n#{payload['method']}",
          :description => "[Crashlytics](#{payload['url']})",
          :list_id => trello_list_id
          )
      end
    else
      puts "Error posting to Trello: Invalid board name"
    end
  else
    puts "Error posting to Trello: Trello board name not set"
  end
end

