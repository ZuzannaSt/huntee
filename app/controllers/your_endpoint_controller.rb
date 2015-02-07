class YourEndpointController < ApplicationController

	def your_endpoint_params
		@latitude = params[:current_location][0]
		@longitude = params[:current_location][1]
		@email = params[:email]
	end
end
