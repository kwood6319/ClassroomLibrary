puts "Cleaning database..."
Loan.destroy_all
Student.destroy_all
Book.destroy_all
Author.destroy_all

puts "Creating students..."
student1 = Student.create!(school_id: "OL001", first_name: "Kendall", second_name: "Brown", email: "kendallbrown@gmail.com")
puts "Created #{student1.first_name}."
student2 = Student.create!(school_id: 2, first_name: "Alex", second_name: "Smith", email: "alexsmith@gmail.com")
puts "Created #{student2.first_name}."
student3 = Student.create!(school_id: 3, first_name: "Jamie", second_name: "Johnson", email: "jamiejohnson@gmail.com")
puts "Created #{student3.first_name}."

puts "Created #{Student.count} students."

puts "Creating authors..."

author1 = Author.create!(first_name: "George", second_name: "Orwell")
puts "Created author #{author1.first_name} #{author1.second_name}."
author2 = Author.create!(first_name: "Jane", second_name: "Austen")
puts "Created author #{author2.first_name} #{author2.second_name}."
author3 = Author.create!(first_name: "Mark", second_name: "Twain")
puts "Created author #{author3.first_name} #{author3.second_name}."

puts "Created #{Author.count} authors."

puts "Creating books..."
book1 = Book.create!(title: "1984", author: author1)
puts "Created book #{book1.title} by #{book1.author.first_name} #{book1.author.second_name}."
book2 = Book.create!(title: "Pride and Prejudice", author: author2)
puts "Created book #{book2.title} by #{book2.author.first_name} #{book2.author.second_name}."
book3 = Book.create!(title: "Adventures of Huckleberry Finn", author: author3)
puts "Created book #{book3.title} by #{book3.author.first_name} #{book3.author.second_name}."

puts "Created #{Book.count} books."

puts "Creating loans..."

loan1 = Loan.create!(student: student1, book: book1, date_borrowed: Date.today, date_due: Date.today + 7.days, active: true)
puts "Created loan of #{loan1.book.title} to #{loan1.student.first_name}."
loan2 = Loan.create!(student: student2, book: book2, date_borrowed: Date.today, date_due: Date.today + 14.days, active: true)
puts "Created loan of #{loan2.book.title} to #{loan2.student.first_name}."
loan3 = Loan.create!(student: student1, book: book3, date_borrowed: Date.today, date_due: Date.today + 21.days, active: true)
puts "Created loan of #{loan3.book.title} to #{loan3.student.first_name}."

puts "Created #{Loan.count} loans."
