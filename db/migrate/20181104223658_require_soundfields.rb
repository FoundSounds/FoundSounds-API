class RequireSoundfields < ActiveRecord::Migration[5.2]
  def change
    change_table :sounds do |s|
      s.change :plays, :integer, default: 0, null: false
      s.change :abuse, :boolean, { null: false, default: false }
    end
  end
end
