class CreateUsersRestaurantsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :restaurants do |t|
      t.index :user_id
      t.index :restaurant_id
    end
  end
end
