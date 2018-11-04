class AddFieldsToSound < ActiveRecord::Migration[5.2]
  def change
    add_column :sounds, :commons, :boolean, null: false, default: true
    add_column :sounds, :public, :boolean, null: false, default: false
    add_column :sounds, :finished, :boolean, null: false, default: false
    add_column :sounds, :placement_location, :string
    add_column :sounds, :placement_name, :string
    add_column :sounds, :placement_address_dictionary, :string
    add_column :sounds, :placement_iso_country_code, :string
    add_column :sounds, :placement_country, :string
    add_column :sounds, :placement_postal_code, :string
    add_column :sounds, :placement_administrative_area, :string
    add_column :sounds, :placement_sub_administrative_area, :string
    add_column :sounds, :placement_locality, :string
    add_column :sounds, :placement_sub_locality, :string
    add_column :sounds, :placement_thoroughfare, :string
    add_column :sounds, :placement_sub_thoroughfare, :string
    add_column :sounds, :placement_region, :string
    add_column :sounds, :placement_inland_water, :string
    add_column :sounds, :placement_ocean, :string
    add_column :sounds, :placement_areas_of_interest, :string
    add_column :sounds, :abuse, :boolean, null: false, default: false
    add_column :sounds, :device_name, :string
    add_column :sounds, :device_system_name, :string
    add_column :sounds, :device_version, :string
    add_column :sounds, :device_model, :string
    add_column :sounds, :device_localized_model, :string
    add_column :sounds, :device_screen_bounds, :string
    add_column :sounds, :plays, :integer

    add_index :sounds, :public
  end
end
