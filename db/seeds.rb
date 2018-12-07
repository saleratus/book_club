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
