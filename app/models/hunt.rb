class Hunt < ActiveRecord::Base
	validates :latitude, :longitude, presence: true, numericality: true 
	validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end
