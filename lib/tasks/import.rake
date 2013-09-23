require 'open-uri'
require 'addressable/uri'

namespace :import do
  task actors: :environment do
    url = 'https://www.googleapis.com/freebase/v1/mqlread'
    uri = Addressable::URI.parse(url)
    uri.query_values = {
      query: '[{"type":"/film/actor","id":null,"name":null}]'
    }

    result = open(uri.to_s).readlines.join
    json = JSON.parse(result)
    actors = json['result']

    actors.each do |actor|
      Actor.create!(name: actor['name'])
    end
  end
end
