# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv = CSV.read('../ThesisProjectDatabase.csv')

name_split = Regexp.new('(^.*)( [a-zA-Z\-]*$)')

csv.each do |row|
  if name_split.match(row[0])
    name_match = name_split.match(row[0])
    if name_match.length == 3
      first_name = name_match[1].strip
      last_name = name_match[2].strip
    else
      first_name = ""
      last_name = name_match[1].strip
    end
  else
    first_name = ""
    last_name = row[0]
  end

  author = Person.new(:last => last_name, :first => first_name)
  author.save

  thesis = Thesis.new(:title => row[2], :year => row[1], :person_id => author.id)

  if row[6]
    paper = Article.new(:url => row[6])
    paper.save
  end

  thesis.documentation = paper
  thesis.notes = row[5] if row[5]
  thesis.save
end