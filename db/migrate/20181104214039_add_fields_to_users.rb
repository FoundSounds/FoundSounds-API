class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :string
    add_column :users, :url, :string
    add_column :users, :twitter, :string
    add_column :users, :portrait, :string
  end
end
