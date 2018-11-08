class CreateBeerUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_users do |t|
      t.references :beer
      t.references :user
      t.timestamps
    end
  end
end
