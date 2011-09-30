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

def txt_to_string(f)
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  filename = '../ThesisTXT/'+f
  if File.file?(filename)
    paper = File.open(filename).readlines
    while paper.class == Array
      paper = paper.join("\n")
    end
    paper = ic.iconv(paper + ' ')[0..-2]
  end
  paper
end

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

  if row[6] # If there is a text document listed.
    article = Article.new(:url => row[6])
    paper = txt_to_string row[6]
    if row[7]
      paper += '\n\n\n\n DOC 2 \n\n\n\n' +txt_to_string row[7]
      puts "secondary text"
    end
  end

  thesis.paper = paper
  thesis.documentation = article
  thesis.notes = ''
  thesis.notes = 'Collaborator: ' + row[3] if row[3]
  thesis.notes += row[4] if row[4]
  thesis.notes = [thesis.notes,row[5]].join(' ') if row[5]
  thesis.save
end