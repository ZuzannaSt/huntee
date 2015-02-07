class YourEndpointController < ApplicationController
	before_action :treasure_found

	def index
	end

	def counted_distance(current_location, treasure_location)
		Geocoder::Calculations.distance_between(current_location, treasure_location, options = {:units => :km}) / 1000
	end

	def treasure_found
		@email = params[:email]
		distance = counted_distance(current_location, treasure_location)

		if distance <= 5
			InfoMailer.congratulations(@email, treasure_location).deliver_now
			render json: { status: 'ok', distance: distance }
		else
			render json: { status: 'error', distance: distance, error: 'Not even close.'}
		end
	end

	def treasure_location
		treasure_location = [50.051227, 19.945704]
	end

	def current_location
		@latitude = params[:current_location][0].to_d
		@longitude = params[:current_location][1].to_d

		current_location = [@latitude, @longitude]
	end
end
