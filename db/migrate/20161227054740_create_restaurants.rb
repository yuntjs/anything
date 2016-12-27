class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id
      t.string :yelp_url

      t.timestamps(null: false)
    end
  end
end
