require 'test_helper'

class HuntTest < ActiveSupport::TestCase
  def setup
  @winner = hunts(:winner)  
  end

  test 'hunt should be valid' do
    assert @winner.valid?
    assert @winner.errors[:email].empty?
    assert @winner.errors[:latitude].empty?
    assert @winner.errors[:longitude].empty?
  end

  test 'hunt should be invalid without email' do
    @winner.email = nil
    assert @winner.invalid?
    assert @winner.errors[:email]
  end

  test 'hunt should be invalid without latitude' do
    @winner.latitude = nil
    assert @winner.invalid?
    assert @winner.errors[:latitude]
  end

  test 'hunt should be invalid without longitude' do
    @winner.longitude = nil
    assert @winner.invalid?
    assert @winner.errors[:longitude]
  end

  test 'email should be invalid without at sign' do
    @winner.email = "annawon.com"
    assert @winner.invalid?
    assert @winner.errors[:email]
  end

  test 'email should be invalid without domain' do
    @winner.email = "anna@woncom"
    assert @winner.invalid?
    assert @winner.errors[:email]
  end

  test 'latitude should be invalid as a string' do
    @winner.latitude = "onetwothree"
    assert @winner.invalid?
    assert @winner.errors[:latitude]
  end

  test 'longitude should be invalid as a string' do
    @winner.longitude = "threetwoone"
    assert @winner.invalid?
    assert @winner.errors[:latitude]
  end

  test 'should not save hunt without email' do
    @winner.email = nil
    assert_not @winner.save
  end

  test 'should not save hunt without latitude' do
    @winner.latitude = nil
    assert_not @winner.save
  end

  test 'should not save hunt without longitude' do
    @winner.longitude = nil
    assert_not @winner.save
  end

  test 'should not save hunt with invalid email' do
    @winner.email = "anna@woncom"
    assert_not @winner.save
  end

  test 'should not save hunt with invalid latitude' do
    @winner.latitude = "onetwothree"
    assert_not @winner.save
  end

  test 'should not save hunt with invalid longitude' do
    @winner.longitude = "threetwoone"
    assert_not @winner.save
  end
end
