class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id    # add by myself
      t.string :title           # add by myself
      t.text :body              # add by myself

      t.timestamps null: false
    end
  end
end
