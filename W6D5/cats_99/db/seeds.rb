# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create!(birth_date: '1997/06/14', name: 'Lisa', sex: 'F', color: 'orange')
cat2 = Cat.create!(birth_date: '2000/05/14', name: 'Jeremy', sex: 'M', color: 'blue')
cat3 = Cat.create!(birth_date: '1829/02/14', name: 'Dean', sex: 'M', color: 'red')