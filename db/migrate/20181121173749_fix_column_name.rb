class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :filename, :file_name
  end
end
