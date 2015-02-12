require 'test_helper'

class InfoMailerTest < ActionMailer::TestCase
  
  test "congratulations email" do
    email = InfoMailer.congratulations('anna@won.com', [50.0636153,19.9317813]).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ['info@huntee.com'], email.from
    assert_equal ['anna@won.com'], email.to
    assert_equal 'Congratulations Hunter!', email.subject
  end
end
