class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :author_id
      t.integer :comments_count

      t.timestamps
    end
  end
end
