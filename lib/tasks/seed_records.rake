desc "Expire and regenerate cache"
task :records_from_txt => :environment do
  require 'csv'
  require 'open-uri'
  require 'json'
  require 'nokogiri'
  
  record_ids = CSV.foreach("#{Rails.root}/db/records.csv") do |row|    
    record = row.join
    json_url = 'http://catalog.tadl.org/osrf-gateway-v1?service=open-ils.search&method=open-ils.search.biblio.record.mods_slim.retrieve&locale=en-US&param=' + record.strip
    record_info = JSON.parse(open(json_url).read)
    xml_url = 'http://catalog.tadl.org/opac/extras/supercat/retrieve/mods32/record/' + record.strip
    genre_info_request = Nokogiri::XML(open(xml_url).read)
    genres = Array.new
    all_genres = genre_info_request.xpath('//xmlns:genre')
    all_genres.each do |g|
      if g.content != 'videorecording'
        genres = genres.push(g.content)
      end
    end
    genre_string = String.new
    genres.uniq.each do |g|
      genre_string += g + ', '
    end
    puts genre_string
    film = Film.new
    film.record_id = record.strip.to_s
    puts film.record_id
    film.title = record_info["payload"][0]['__p'][0]
    puts film.title
    film.artist = record_info["payload"][0]['__p'][1]
    puts film.artist
    film.abstract = record_info["payload"][0]['__p'][13]
    puts film.abstract
    film.release_date = record_info["payload"][0]['__p'][4]
    puts film.release_date
    film.publisher = record_info["payload"][0]['__p'][6]
    puts film.publisher
    film.track_list = record_info["payload"][0]['__p'][15]
    puts film.track_list
    film.legacy_genres = genre_string
    puts film.legacy_genres
    sleep(1)
    if film.valid?
      film.save
    end
  end
end 