class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.jsonb :brewery_db_json

      t.timestamps
    end
  end
end
