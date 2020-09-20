class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
    	t.string :name
    	t.references :category
    	t.string :measure
    	t.float :weight
    	t.float :price
      t.timestamps
    end
  end
end
