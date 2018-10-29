class CreateSounds < ActiveRecord::Migration[5.2]
  def change
    create_table :sounds do |t|
      t.string :description
      t.float :longitude
      t.float :latitude
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
