# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
  	 "jacki#{n}@jackie.com"
  end

  factory :user do
  	 email
  	 password 'password'
  	 password_confirmation 'password'
    name 'Jackie'
  end

end
