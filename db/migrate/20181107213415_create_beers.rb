class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.jsonb :brewery_db_json
      t.references :brewery
      t.timestamps
    end
  end
end
