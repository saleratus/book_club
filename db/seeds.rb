# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './app/models/author'
require './app/models/book'

Author.destroy_all
Book.destroy_all

author_1 = Author.create(last_name: 'Heideger', first_name: 'Martin', thumbnail: '/images/martin_heideger.jpg')
author_2 = Author.create(last_name: 'Wittgenstein', first_name: 'Ludwig', thumbnail: 'images/ludwig_wittgenstein.jpg')
author_3 = Author.create(last_name: 'Kant', first_name: 'Emmanuel', thumbnail: 'images/emmanuel_kant.jpg')

book_1 = Book.create(title: 'Being and Time', artwork: '/images/being_and_time.jpg')
book_2 = Book.create(title: 'Philosophical Investigations', artwork: '/images/philosophical_investigations.jpg')
book_3 = Book.create(title: 'Critique of Pure Reason', artwork: '/images/critique_of_pure_reason.jpg')
book_4 = Book.create(title: 'Phenomenology of Spirit', hegel)
book_5 = Book.create(title: 'Thus Spake Zarathustra' nietsche)

Kant, Critique of Pure Reason
Hegel, Phenomenology of Spirit
Nietzsche, Thus Spake Zarathustra
Heidegger, Being and Time, Building Dwelling Thinking
Baudrillard, Simulacra and Simulation
Foucault, The Archaeology of Knowledge
Derrida, Differance
Wittgenstein, Tractatus Logico-Philosophicus
Sellars, Empiricism and the Philosophy of Mind
Sartre, No Exit
Camus, The Myth of Sissyphus

Aristotle
Plato
Thomas Aquinas  Summa Theologica
Socrates
