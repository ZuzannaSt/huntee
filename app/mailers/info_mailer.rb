class InfoMailer < ActionMailer::Base
	default from: "info@huntee.com"

	def congratulations(email, treasure_location)
		@email = email
		@treasure_location = treasure_location
		mail(to: @email, subject: 'Congratulations Hunter!')
	end
end
