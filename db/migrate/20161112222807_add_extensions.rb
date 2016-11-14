class AddExtensions < ActiveRecord::Migration[5.0]
  def self.up
    execute 'CREATE EXTENSION IF NOT EXISTS hstore;'
  end
end
