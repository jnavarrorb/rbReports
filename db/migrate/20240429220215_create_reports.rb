class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.text :template
      t.string :sensor_type
      t.string :sensor_name
      t.integer :sensor_id

      t.timestamps
    end
  end
end
