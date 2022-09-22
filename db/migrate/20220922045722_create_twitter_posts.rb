class CreateTwitterPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :twitter_posts do |t|
      t.string :tweet
      t.string :username

      t.timestamps
    end
  end
end
