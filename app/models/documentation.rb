class Documentation < ActiveRecord::Base

  belongs_to :thesis

  has_attached_file :media, 
                    :storage => :s3, 
                    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
                    :s3_permissions => :public_read,
                    :path => "/documentation/:id/:filename"

  def condition_word
    words = { 1 => "Unusable", 2 => "Fragment", 3 => "Good", 4 => "Perfect"}
    words[condition]
  end

  def link_to_pdf(text)
    "<a href='http://s3.amazonaws.com/itp_archive#{media.path}'>#{text}</a>".html_safe
  end

end
