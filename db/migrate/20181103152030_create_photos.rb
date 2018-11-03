class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :filename
      t.belongs_to :user, foreign_key: true
      t.belongs_to :sound, foreign_key: true

      t.timestamps
    end
  end
end
