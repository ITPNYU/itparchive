class Documentation < ActiveRecord::Base

  belongs_to :thesis

  validates_uniqueness_of :aws_url

  has_attached_file :media, 
                    :storage => :s3, 
                    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
                    :path => "/documentation/:id/:filename"

  def condition_word
    words = { 1 => "Unusable", 2 => "Fragment", 3 => "Good", 4 => "Perfect"}
    words[condition]
  end

end
