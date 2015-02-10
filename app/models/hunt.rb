class Hunt < ActiveRecord::Base
	validates :email, :latitude, :longitude, presence: true 
end
