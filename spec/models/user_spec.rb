require 'spec_helper'

describe User do
  describe 'email' do
  	it 'should have a valid email address' do
  		user = User.create(password_digest: '12345', remember_token: '12345')
  		user.should_not be_valid
  	end
  end
end
