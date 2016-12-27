class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string :alias, {null: false}
      t.string :title, {null: false}
      t.integer :category_id

      t.timestamps(null: false)
    end
  end
end
