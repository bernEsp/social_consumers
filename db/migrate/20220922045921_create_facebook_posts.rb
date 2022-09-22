class CreateFacebookPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :facebook_posts do |t|
      t.string :status
      t.string :name

      t.timestamps
    end
  end
end
