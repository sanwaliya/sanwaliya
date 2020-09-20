class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
    	t.string :name
    	t.string :fathers_name
    	t.datetime :dob
    	t.string :mobile
    	t.string :email
    	t.text :address
      t.timestamps
    end
  end
end
