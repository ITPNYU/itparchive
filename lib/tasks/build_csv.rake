require 'csv'

namespace :csv do
  
  desc "Build CSV of thesis data."
  task :build => :environment do
  	
  	csv_string = CSV.generate do |csv|
  		csv << ["title", "year", "author", "text"]

  		n = Thesis.count
  		Thesis.all.each_with_index do |t, i|
  			puts "Saving #{i} of #{n} theses."

  			p = ""

  			if t.documentations.first
  				p = t.documentations.first.paper
  			end
			csv << [t.title, t.year, t.person.full_name, p]
  		end
  	end

  	File.open("#{Rails.root}/public/thesis_archive.csv", "w"){|f| f << csv_string}

  end
end