class InfoMailer < ActionMailer::Base
	default from: "info@treasure-hunter.com"

	def congratulations(email)
		@email = email
		mail(to: @email, subject: 'Congratulations Hunter!')
	end
end
