# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './app/models/book'

Book.destroy_all

# Single Author
book_1 = Book.create(title: 'Being and Time')
book_2 = Book.create(title: 'Philosophical Investigations')
book_3 = Book.create(title: 'Critique of Pure Reason')
book_4 = Book.create(title: 'Phenomenology of Spirit')
book_5 = Book.create(title: 'Thus Spake Zarathustra')
book_6 = Book.create(title: 'Building, Dwelling, Thinking')
book_7 = Book.create(title: 'The Archaeology of Knowledge')
book_8 = Book.create(title: 'Difference')
book_9 = Book.create(title: 'Tractatus Logico-Philosophicus')
book_10 = Book.create(title: 'Empiricism and the Philosophy of Mind')
book_11 = Book.create(title: 'La Nausée')
book_12 = Book.create(title: 'The Myth of Sissyphus')
book_13 = Book.create(title: 'Summa Theologica')
book_14 = Book.create(title: 'The Republic')
book_15 = Book.create(title: 'Nicomachean Ethics')
book_16 = Book.create(title: 'Lost Epistemological Discourses')

# Multiple Authors
book_17 = Book.create(title: 'Medieval Scholasticism')
book_18 = Book.create(title: 'German Philosophy in the 19th Century')
