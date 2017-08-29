class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :start_date
      t.date :end_date
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :organizer
      t.text :detail

      t.timestamps
    end
  end
end
