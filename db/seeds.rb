# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

file = File.read('db/seeds/categories.json')
data_hash = JSON.parse(file)
categories = ["restaurants","food"]

if Category.all.count == 0
  categories.each {|cat| Category.create(category: cat)}
end

data_hash.each do |data|
  category = data["parents"].join
  alia = data["alias"]
  title = data["title"]

  if categories.include? category
    category_object = Category.find_by(category: category)
    category_object.sub_categories.create(alias: alia, title: title)
  end
end
