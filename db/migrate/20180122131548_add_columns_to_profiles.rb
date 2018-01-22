class AddColumnsToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :about_me, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :interested_in, :string
    add_column :profiles, :address, :string
    add_column :profiles, :longitude, :float
    add_column :profiles, :latitude, :float
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :is_online, :boolean
  end
end
