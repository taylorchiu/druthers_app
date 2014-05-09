# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_poll do
    book_id 1
    poll_id 1
    votecount 1
  end
end
