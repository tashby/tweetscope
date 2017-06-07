class Keyword < ApplicationRecord
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ads4n8ZkotIxDEisZelVq9UM8"
      config.consumer_secret     = "LTsEO9J0XyDDHLbqYqN8IJDmC7NWXYRxCOn4fbRGwuAEmq6Z7v"
      config.access_token        = "201497041-QLYRdDwqeM0CYmzxN9YhJWvotcljhb6xPXzDGx4S"
      config.access_token_secret = "8k1SxyIWvQxSj4LBjwY1ordPBVjhvPQvOEEz7Vpki0x2N"
    end

    client.search(self.word, :count => 3, result_type: "recent").take(3).collect do |tweet|
  "#{tweet.user.screen_name}: #{tweet.text}"
end
  end
end
