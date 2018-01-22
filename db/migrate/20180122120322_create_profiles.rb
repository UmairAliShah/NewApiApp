class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :state
      t.string :city
      t.string :country
      t.string :code
      t.string :provider
      t.string :phone_no
      t.string :provider_id
      t.string :img_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
