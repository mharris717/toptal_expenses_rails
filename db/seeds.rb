# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user = User.create! email: "jsmith@fake.com", password: "password", password_confirmation: "password"

Expense.delete_all
Expense.create! description: 'Lunch for Team', amount: 75, expense_dt: Time.local(2014,8,12,13), user: user
Expense.create! description: 'Dinner for Team', amount: 100, expense_dt: Time.local(2014,8,12,19), user: user

