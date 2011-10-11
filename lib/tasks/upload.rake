namespace :db do

  desc "Upload PDFs to S3 and create "
  task :upload => :environment do
    require 'csv'
    pdf_list = Dir.glob("../Thesis/*.pdf") + Dir.glob("../Thesis/*.PDF")
    csv = CSV.read('../ThesisProjectDatabase.csv')

    def txt_to_string(f)
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      filename = '../ThesisTXT/'+f
      if File.file?(filename)
        puts "Opened #{filename}"
        paper = File.open(filename).readlines
        while paper.class == Array
          paper = paper.join("\n")
        end
        paper = ic.iconv(paper + ' ')[0..-2]
      end
      paper
    end

    matches = 0

    pdf_list.each do |pdf|
      filename = pdf.split("/").last.split(".")

      # assume that if the year is good and in the right spot the PDF name is good.
      if filename[2].to_i >= 1960

        # loop through csv for a match
        match = []
        csv.each do |r| 
          match=r if(r[2].class == String && r[2].downcase == filename[0] && r[3] == filename[2])
        end

        # We have match, make a Thesis.
        if match.length > 0
          author = Person.new(:first => match[1], :last => match[2])
          author.save

          thesis = Thesis.new({
            :title => match[4],
            :year => match[3],
            :notes => [match[6],match[7]].join(" "),
            :person_id => author.id
          })
          thesis.save

          # Generate Article model
          unique_id = Time.now.to_i.to_s+rand(99999).to_s
          article = Article.new({
            :title => filename,
            :aws_url => "article/"+unique_id+".pdf",
            :thesis_id => thesis.id
          })
          puts article.save

          if match[9] # If there is a text document listed.
            article.paper = txt_to_string match[9]
            article.save
          end
        # No match, let's just upload the pdf
        else
        end
      end
    end

  end

end