brewery_db = BreweryDB::Client.new do |config|
  config.api_key = Rails.application.credentials.dig(:brewerydb_api_key)
end

brewery_ids = []
brewery_db.locations.all(region: "CO").each do |location|
  brewery_ids << location.brewery.id
end
brewery_ids.uniq!
brewery_ids.each do |brewery_id|
  brewery = brewery_db.breweries.find(brewery_id)
  brewery_object = Brewery.where_brewery_db_id(brewery.id).first || Brewery.create(brewery_db_json: brewery)
  beers = brewery_db.brewery(brewery_id).beers
  beers.each do |beer|
    brewery_object.beers.create(brewery_db_json: beer)
  end
end

User.create(email: 'foo@test.com', password: 'yagni')