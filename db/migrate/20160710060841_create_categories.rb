class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      # t.string :name           # add by myself
      t.timestamps null: false
    end
  end
end
