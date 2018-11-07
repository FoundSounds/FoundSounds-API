class ChangeSoundLogType < ActiveRecord::Migration[5.2]
  def change
    rename_column :sound_logs, :type, :device_type
  end
end
