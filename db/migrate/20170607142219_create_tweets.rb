class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :user_uid
      t.string :user_name
      t.string :user_screen_name
      t.string :tweet_id
      t.datetime :tweet_created_at
      t.references :keyword
      t.timestamps
    end
  end
end
