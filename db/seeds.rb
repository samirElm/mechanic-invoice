# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'roo'
xlsx = Roo::Spreadsheet.open('db/parts.xlsx')

for i in (2..241)
  Part.create(name: xlsx.cell(i,2))
end