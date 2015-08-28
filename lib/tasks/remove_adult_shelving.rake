desc "load records from csv into database"
task :remove_adult => :environment do
  require 'csv'
  require 'open-uri'
  require 'json'
  require 'nokogiri'

	@films = Film.all
	

	@films.each do |f|
		if f.updated_by != 42
			puts "checking " + f.title
			i = 0
			url = 'https://ilscatcher3.herokuapp.com/mock/details.json?id=' + f.record_id
			json_feed = JSON.parse(open(url).read)
			json_feed["copies"].each do |c|
				if c["shelving_location"] == "Adult"
					i = i + 1
				end
			end
			if i > 0
				puts "I am deleting " + f.title + " record id " + f.record_id
				f.destroy
			else
				f.updated_by = 42
				f.save
			end
		end
	end
end