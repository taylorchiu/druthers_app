# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poll do
    name 'MyString'
    url 'MyString'
    start_date 'MyString'
    end_date 'MyString'
    book_list 'MyString'
    winning_book 'MyString'
    user nil
  end
end
