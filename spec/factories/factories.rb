# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
  	"jacki#{n}@jackie.com"
  end

  factory :user do
  	email
  	password_digest "password"
  	remember_token "remember_token"
    name "Jackie"
  end

end