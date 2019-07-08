class CreateGig < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs do |t|
      t.integer :fan_id
      t.integer :artist_id
      t.string :name
      t.string :city
      t.string :venue
      t.text :address
      t.string :postcode
      t.datetime :date 
      t.integer :start_time
      t.integer :end_time
      t.boolean :past
    end
  end
end
