class CreateInstagramPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :instagram_posts do |t|
      t.string :picture
      t.string :username

      t.timestamps
    end
  end
end
