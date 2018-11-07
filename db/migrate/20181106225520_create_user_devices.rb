class CreateUserDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_devices do |t|
      t.string :device_key
      t.string :device
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
