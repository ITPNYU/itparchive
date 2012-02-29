namespace :ocr do
  desc "Remove all documentation.paper values"
  task :remove_papers => :environment do
    @documentations = Documentation.all
    @documentations.each do |documentation|
      documentation.update_attributes(:paper => nil)
    end
  end

  desc "Upload new OCR documents, output to terminal mismatches"
  task :save_texts => :environment do

    @documentations = Documentation.all
    text_list = Dir.glob("../ThesisTXT_round2/*.txt")

    text_names = []
    text_list.each do |text|
      text_array = text.split("/")
      text_names << text_array[2]
    end

    matched = 0
      unmatched = 0
      matched_text_files = []
      unmatched_text_files = []
      matched_pdfs = []
      text_names.each do |text|
        find_match = false
        match = nil
        @documentations.each do |documentation|
          pdf = documentation.media_file_name
          split_pdf = pdf.split(".")
          split_text = text.split(".")
          # if split_text.length >= 3
            if split_pdf[0] == split_text[0] && split_pdf[1] == split_text[1] #&& split_pdf[2] == split_text[2]
              matched_pdfs << documentation.id
              find_match = true
              match = documentation
            end
          # end
        end
        if find_match
          matched += 1
          matched_text_files << text
          paper = File.open("../ThesisTXT_round2/#{text}").readlines
          while paper.class == Array
            paper = paper.join("\n")
          end
          match.update_attributes paper: paper
        else
          unmatched += 1
          unmatched_text_files << text
        end
      end

    puts "MATCHED = #{matched}"
    if f = File.new("#{Rails.root}/log/matched_text_files.txt", "w")
      f.write(Time.now.to_s+"\n")
      matched_text_files.each do |e|
        f.write(e+"\n")
      end
      f.close
    end
    puts ""
    puts "UNMATCHED = #{unmatched}"
    # puts unmatched_text_files
    if f = File.new("#{Rails.root}/log/unmatched_text_files.txt", "w")
      f.write(Time.now.to_s+"\n")
      unmatched_text_files.each do |e|
        f.write(e+"\n")
      end
      f.close
    end
    puts ""

    unmatched_documentations = []
    @documentations.each do |documentation|
      if ! matched_pdfs.include? documentation.id
        unmatched_documentations << documentation.id
      end
    end

    if f = File.new("#{Rails.root}/log/unmatched_documentation_ids.txt", "w")
      f.write(Time.now.to_s + "\n")
      unmatched_documentations.each do |e|
        f.write("#{e}\n")
      end
      f.close
    end

  end
end