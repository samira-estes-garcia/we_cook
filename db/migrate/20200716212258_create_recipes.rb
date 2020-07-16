class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :instructions
      t.string :category_id
      t.string :user_id

      t.timestamps
    end
  end
end
