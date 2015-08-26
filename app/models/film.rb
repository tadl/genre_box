class Film < ActiveRecord::Base
	validates_uniqueness_of :record_id
end
