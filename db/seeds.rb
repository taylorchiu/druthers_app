User.create(name: 'Test1', email: 'test2@gmail.com', password_digest: 'abcdef', remember_token: 'abcdef')

User.create(name: 'Test2', email: 'test3@gmail.com', password_digest: '98765', remember_token: '98765')

User.create(name: 'Test3', email: 'test4@gmail.com', password_digest: 'cow', remember_token: 'moo')

User.create(name: 'Test4', email: 'test5@gmail.com', password_digest: 'cat', remember_token: 'meow')

Poll.create(name: 'Poll1', url: 'https://www.google.com', start_date: '20140505', end_date: '20140512', book_list: 'Great Gatsby, Redwall, Anna Karenina', winning_book: 'Anna Karenina')