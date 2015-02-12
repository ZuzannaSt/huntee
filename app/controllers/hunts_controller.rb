class HuntsController < ApplicationController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	before_action :set_hunt, except: [:index]

	def index
		@hunts = Hunt.all
		@hash = Gmaps4rails.build_markers(@hunts) do |hunt, marker|
  			marker.lat hunt.latitude
  			marker.lng hunt.longitude
  			marker.infowindow hunt.email
		end
	end

	def create
		@hunt = Hunt.new(email: @email, latitude: @latitude, longitude: @longitude)
		if @hunt.save
			treasure_hunting
		else
			render json: { status: 'error', error: 'Wrong data.'}, status: 500
		end
	end

	def treasure_location
		treasure_location = [50.0636153,19.9317813]
	end

	def current_location
		current_location = [@latitude, @longitude]
	end
	
	def counted_distance(current_location, treasure_location)
		Geocoder::Calculations.distance_between(current_location, treasure_location, options = {:units => :km}) * 1000
	end

	def treasure_hunting
		distance = counted_distance(current_location, treasure_location).round(2)

		if distance <= 5
			InfoMailer.congratulations(@email, treasure_location).deliver_now
			render json: { status: 'ok', distance: distance, message: 'Mail with coordinates sent.' }
		else
			render json: { status: 'error', distance: distance, error: 'Not even close.'}
		end
	end

	def set_hunt
		@email = params[:email]
		@latitude = params[:current_location][0].to_d
		@longitude = params[:current_location][1].to_d
	end
end
