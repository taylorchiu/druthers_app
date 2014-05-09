# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    poll nil
    title "MyString"
    author "MyString"
    img_url "MyString"
    reviews "MyString"
    book_id "MyString"
  end
end
