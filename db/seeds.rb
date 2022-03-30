# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
branches = Branch.create([
  {name: 'Computer science', code: 'CSE'},
  {name: 'Information Technology', code: 'IT'},
  {name: 'Electronics and Communication Engineering', code: 'ECE'}
])

roles = Role.create([
  {name: 'Admin'},
  {name: 'Council'},
  {name: 'Convener'}
])

# Admin
admin = User.create(name: 'Admin', email: 'admin@rails.com', password: '12345678')
admin.assign_role(Role.find_by(name: 'Admin').id)
