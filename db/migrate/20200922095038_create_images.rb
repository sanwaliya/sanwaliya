class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
    	t.string :file
    	t.references :imageable, polymorphic: true
      t.timestamps
    end
    add_index(:images, [ :file, :imageable_type, :imageable_id ])
  end
end
