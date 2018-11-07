class CreateAbuses < ActiveRecord::Migration[5.2]
  def change
    create_table :abuses do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :sound, foreign_key: true

      t.timestamps
    end
  end
end
