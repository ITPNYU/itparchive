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
        puts "Text file #{filename}"
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
      if filename[2].to_i >= 1970

        # loop through csv for a match
        match = []
        csv.each do |r| 
          match=r if(r[2].class == String && r[2].downcase == filename[0] && r[3] == filename[2])
        end

        # We have match, make a Thesis.
        if match.length > 0

          thesis = Thesis.new({
            :title => match[4],
            :year => match[3],
            :notes => [match[6],match[7]].join(" "),
          })

          thesis.person = Person.new(:first => match[1], :last => match[2])

          if(match[9])
            paper_as_text = txt_to_string(match[9])
          else
            paper_as_text = nil
          end

          # Generate Article model
          thesis.documentations << Article.new({
            :media => File.open(pdf),
            :thesis_id => thesis.id,
            :paper => paper_as_text
          })

          if thesis.save
            puts ""
            puts "Save Successful"
            puts "#{thesis.title} (#{thesis.year})"
            puts "  #{thesis.person.full_name}" if thesis.person
            puts "  #{thesis.documentations.last.media.path}" if thesis.documentations
            puts ""
          else
            puts ""
            puts "*****ERROR*****"
            puts "#{pdf} not saved"
            puts ""
          end

        # No match, let's just upload the pdf
        else
          paper = Article.new({
            :media => File.open(pdf)
          })
          
          if paper.save
            puts ""
            puts "Saved PDF only"
            puts "#{paper.media.path}"
            puts ""
          else
            puts ""
            puts "*****ERROR*****"
            puts "#{pdf} not saved"
          end
        end
      else
        error_log ||= []
        error_log << pdf
      end
    end

    if f = File.open("#{Rails.root}/log/upload.log")
      f.write(Time.now+"\n")
      error_log.each do |e|
        f.write(e+"\n")
      end
      f.close
    end

  end

end