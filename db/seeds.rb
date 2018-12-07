# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './app/models/book'

User.destroy_all
Review.destroy_all
Book.destroy_all

user_1 = User.create(username: "SleeplessInSeattle")
user_2 = User.create(username: "InsomniaMadness")
user_3 = User.create(username: "HaventSleptInDays")
user_5 = User.create(username: "NeedMedication")
user_6 = User.create(username: "LastResort")
user_8 = User.create(username: "JonesingForZanax")
user_9 = User.create(username: "LunestaLover")
user_10 = User.create(username: "HeartsForHalcyon")
user_11 = User.create(username: "SonataIsMySweetyPie")
user_12 = User.create(username: "AmbienIsEverything")
user_13 = User.create(username: "ZombieJoe")
user_14 = User.create(username: "RestlessRoger")
user_15 = User.create(username: "MidnightDreary")
user_16 = User.create(username: "AllNighter")



# Single Author
book_1 = Book.create(title: 'Being and Time')
book_2 = Book.create(title: 'Philosophical Investigations')
book_3 = Book.create(title: 'Critique of Pure Reason')
book_4 = Book.create(title: 'Phenomenology of Spirit')
book_5 = Book.create(title: 'Thus Spake Zarathustra')
book_6 = Book.create(title: 'Building, Dwelling, Thinking')
book_7 = Book.create(title: 'The Archaeology of Knowledge')
book_8 = Book.create(title: 'Différance')
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

review_1 = Review.create(rating: 1, title: "Ineffective", user: user_1, book: book_1)
review_2 = Review.create(rating: 2, title: "Not the Best", user: user_1, book: book_2)
review_3 = Review.create(rating: 2, title: "Could Be Better", user: user_1, book: book_3)
review_4 = Review.create(rating: 1, title: "I Want A Refund", user: user_14, book: book_1)
review_5 = Review.create(rating: 2, title: "Not as Tiresome as I Hoped", user: user_16, book: book_16)
review_6 = Review.create(rating: 1, title: "Not Useful", user: user_2, book: book_15)
review_7 = Review.create(rating: 1, title: "There Are Better Sleep Aids Out There", user: user_3, book: book_14)
review_8 = Review.create(rating: 1, title: "Not As Effective As I Hoped", user: user_4, book: book_13)
review_9 = Review.create(rating: 2, title: "It Helped, But Not Much", user: user_5, book: book_12)
review_10 = Review.create(rating: 1, title: "This Book Did Not Help Me Sleep", user: user_6, book: book_11)
review_11 = Review.create(rating: 1, title: "Not As Dry As Advertised", user: user_7, book: book_10)
review_12 = Review.create(rating: 1, title: "Is It Only Me?", user: user_8, book: book_9)
review_13 = Review.create(rating: 2, title: "Mediocre Effectiveness", user: user_9, book: book_8)
review_14 = Review.create(rating: 1, title: "Other Books Will Help You Sleep Better", user: user_10, book: book_7)
review_15 = Review.create(rating: 1, title: "I Was Awake All Night", user: user_11, book: book_6)
review_16 = Review.create(rating: 3, title: "Mediocre Sleep Aid", user: user_12, book: book_5)
review_17 = Review.create(rating: 2, title: "Marketing Scam - Take a Nyquil Instead", user: user_13, book: book_4)
review_18 = Review.create(rating: 1, title: "Boring, but Not Boring Enough", user: user_14, book: book_3)
review_19 = Review.create(rating: 1, title: "Didn't Work for Me", user: user_15, book: book_2)
review_20 = Review.create(rating: 2, title: "Wachet Auf!!", user: user_16, book: book_1)

author_1 = Author.create(name: 'Martin Heideger')
author_2 = Author.create(name: 'Ludwig Wittgenstein')
author_3 = Author.create(name: 'Immanuel Kant')
author_4 = Author.create(name: 'Friedrich Hegel')
author_5 = Author.create(name: 'Friedrich Nietzsche')
author_6 = Author.create(name: 'Michel Foucault')
author_7 = Author.create(name: 'Jacque Derrida')
author_8 = Author.create(name: 'Wilfrid Sellars')
author_9 = Author.create(name: 'Jean-Paul Sartre')
author_10 = Author.create(name: 'Albert Camus')
author_11 = Author.create(name: 'Thomas Aquinas')
author_12 = Author.create(name: 'Plato')
author_13 = Author.create(name: 'Aristotle')
author_14 = Author.create(name: 'Socrates')
author_15 = Author.create(name: 'Anselm of Canterbury')
author_16 = Author.create(name: 'Peter Abelard')
author_17 = Author.create(name: 'William of Ockham')
