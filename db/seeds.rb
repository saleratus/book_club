# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './app/models/book'

Book.destroy_all

book_1 = Book.create(title: 'Being and Time')
book_2 = Book.create(title: 'Philosophical Investigations')
book_3 = Book.create(title: 'Critique of Pure Reason')
book_4 = Book.create(title: 'Phenomenology of Spirit')
book_5 = Book.create(title: 'Thus Spake Zarathustra'
book_6 = Book.create(title: 'Phenomenology of Spirit')

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
