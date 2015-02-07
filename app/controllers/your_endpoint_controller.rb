class YourEndpointController < ApplicationController
	#before_action :your_endpoint_params

	def index
		@email = params[:email]
		InfoMailer.congratulations(@email).deliver_now
	end

	def your_endpoint_params
		@latitude = params[:current_location][0]
		@longitude = params[:current_location][1]
		@email = params[:email]
	end

end
