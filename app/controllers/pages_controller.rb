class PagesController < ApplicationController

	def home
  end

	def random
		client = Tumblr::Client.new(:consumer_key => ENV['CONSUMER_KEY'], 
																:consumer_secret => ENV['CONSUMER_SECRET'], 
																:oauth_token => ENV['ACCESS_TOKEN'], 
																:oauth_token_secret => ENV['ACCESS_TOKEN_SECRET'])
		posts = client.posts("bigbluemcme.tumblr.com/", :type => "photo")
		index = Random.new.rand(posts["posts"].length)
		@url = {:mc => posts["posts"][index]["photos"][0]["original_size"]["url"]}.to_json


  end

end