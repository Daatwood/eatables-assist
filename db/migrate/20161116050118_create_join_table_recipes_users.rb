class CreateJoinTableRecipesUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :recipes, :users, force: :cascade do |t|
      t.integer :user_id, null: false
      t.integer :recipe_id, null: false
    end

    add_index "recipes_users", ["recipe_id"], name: "index_recipes_users_on_recipes_id", using: :btree
    add_index "recipes_users", ["user_id"], name: "index_recipes_users_on_user_id", using: :btree

    add_foreign_key "recipes_users", "recipes"
    add_foreign_key "recipes_users", "users"
  end
end
