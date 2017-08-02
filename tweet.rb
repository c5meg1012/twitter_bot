require 'twitter'
require 'dotenv'
Dotenv.load

class Tweet

  def initialize
    @text = [
      "あーあー、てすとてすと",
      "あーあー、てすとてすと"
    ]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN_KEY']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  private

   def update(tweet)
     begin
       @client.update(tweet)
     rescue => e
       nil #TODO
     end
   end

end

# random_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end
