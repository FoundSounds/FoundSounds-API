class ChangeSoundLocationData < ActiveRecord::Migration[5.2]
  def change
    change_table :sounds do |s|
      s.change :latitude, :float, default: 0, null: false
      s.change :longitude, :float, default: 0, null: false
    end
    add_column :sounds, :file_name, :string, default: "", null: false
  end
end
