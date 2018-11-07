class CreateSoundLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :sound_logs do |t|
      t.string :type
      t.string :os
      t.string :version
      t.string :build
      t.string :device_name
      t.string :device_system_name
      t.string :device_version
      t.string :device_model
      t.string :device_localized_model
      t.belongs_to :user, foreign_key: true
      t.belongs_to :sound, foreign_key: true

      t.timestamps
    end
  end
end
