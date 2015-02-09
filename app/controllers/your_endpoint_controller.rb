class YourEndpointController < ApplicationController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	before_action :set_endpoint

	def index
		@endpoints = YourEndpoint.all
	end

	def create
		@your_endpoint = YourEndpoint.new(email: @email, latitude: @latitude, longitude: @longitude)
		if @your_endpoint.save
			treasure_hunting
		else
			render json: { status: 'error', error: 'Your endpoint is invalid.'}
		end
	end

	def treasure_location
		treasure_location = [50.051227, 19.945704]
	end

	def current_location
		current_location = [@latitude, @longitude]
	end
	
	def counted_distance(current_location, treasure_location)
		Geocoder::Calculations.distance_between(current_location, treasure_location, options = {:units => :km}) * 1000
	end

	def treasure_hunting
		distance = counted_distance(current_location, treasure_location)
		puts distance

		if distance <= 5
			InfoMailer.congratulations(@email, treasure_location).deliver_now
			render json: { status: 'ok' }
		else
			render json: { status: 'error', error: 'Not even close.'}
		end
	end

	def set_endpoint
		@email = params[:email]
		@latitude = params[:current_location][0].to_d
		@longitude = params[:current_location][1].to_d
	end
end
