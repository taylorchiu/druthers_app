require 'spec_helper'

describe User do
  describe 'email' do
  	it 'should have a valid email address' do
  		user = FactoryGirl.build(:user, email: nil)
  		user.should_not be_valid
  	end

  	it 'should have the proper format' do
  		user = FactoryGirl.build(:user, email: "fake_email")
  		user.should_not be_valid
  	end

  	it 'should be unique' do
  		user1 = FactoryGirl.create(:user)
  		user2 = FactoryGirl.create(:user, email: user2.email)
			user2.should_not be_valid 
		end 
  end
end
