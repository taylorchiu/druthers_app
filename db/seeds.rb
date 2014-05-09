User.create(name: 'Test1', email: 'test2@gmail.com', password: '1234567', password_confirmation: '1234567')

User.create(name: 'Test2', email: 'test3@gmail.com', password: '1234567', password_confirmation: '1234567')
User.create(name: 'Test3', email: 'test4@gmail.com', password: '1234567', password_confirmation: '1234567')

Poll.create(name: 'Poll1', url: 'https://www.google.com', start_date: '20140505', end_date: '20140512', book_list: 'Great Gatsby, Redwall, Anna Karenina', winning_book: 'Anna Karenina')

Guest.create(name: 'Guest1', poll_id: '1')