class Keyword < ApplicationRecord
  has_many :tweets
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ads4n8ZkotIxDEisZelVq9UM8"
      config.consumer_secret     = "LTsEO9J0XyDDHLbqYqN8IJDmC7NWXYRxCOn4fbRGwuAEmq6Z7v"
      config.access_token        = "201497041-QLYRdDwqeM0CYmzxN9YhJWvotcljhb6xPXzDGx4S"
      config.access_token_secret = "8k1SxyIWvQxSj4LBjwY1ordPBVjhvPQvOEEz7Vpki0x2N"
    end

    client.search(self.word, :count => 3, result_type: "recent").take(10).collect do |tweet|
      new_tweet = Tweet.new

      new_tweet.tweet_id = tweet.id.to_s
      #new_tweet.tweet_created_at = tweet_created_at
      new_tweet.text = tweet.text

      new_tweet.user_uid = tweet.user.id
      new_tweet.user_name = tweet.user.name
      new_tweet.user_screen_name = tweet.user.screen_name
      #new_tweet.user_image_url=tweet.user.profile_image_url

      new_tweet.keyword=self

      new_tweet.save
  "#{tweet.user.screen_name}: #{tweet.text}"
end
  end
end
