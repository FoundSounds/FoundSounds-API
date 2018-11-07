class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :device
      t.string :device_string
      t.string :os
      t.string :uid
      t.string :version
      t.string :build
      t.string :device_name
      t.string :device_system_name
      t.string :device_version
      t.string :device_model
      t.string :device_localized_model
      t.string :device_screen_bounds

      t.timestamps
    end
  end
end
