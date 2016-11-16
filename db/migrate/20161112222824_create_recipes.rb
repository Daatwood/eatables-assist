class CreateRecipes < ActiveRecord::Migration[5.0]
  def change

    create_table :users do |t|
      t.boolean :enabled, default: true
      t.string :username, null: false, default: ""
      t.column :data, :hstore
      
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      # History
      t.integer :ingredient_history, array: true, default: []
      t.integer :recipe_history, array: true, default: []
      t.string :search_history, array: true, default: []

      t.timestamps
    end

    create_table :recipes do |t|
      t.string :name, null: false
      t.string :description
      t.column :data, :hstore
      t.belongs_to :user
      t.timestamps
    end

    create_table :eatables do |t|
      t.string :name, null: false, unique: true
      t.column :data, :hstore
      t.timestamps
    end

    create_table :ingredients do |t|
      t.string :measurement, null: :false
      t.belongs_to :eatable
      t.belongs_to :recipe
      t.timestamps
    end

    create_table :directions do |t|
      t.integer :sequence
      t.string  :instruction
      t.belongs_to :recipe
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email,    unique: true
    add_index :recipes, :name
    add_index :eatables, :name,  unique: true

  end
end
