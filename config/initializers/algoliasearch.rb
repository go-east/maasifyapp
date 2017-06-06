application_id = 'OB9KRZQ2SS'
admin_api_key = '1261c3ce95f4e8c68e375a0b673d8e59'

if application_id == 'XXX' || admin_api_key == 'XXX'
  raise 'Wrong Algolia credentials - set them up in config/initializers/algoliasearch.rb'
end

AlgoliaSearch.configuration = {
  application_id: application_id,
  api_key: admin_api_key
}
