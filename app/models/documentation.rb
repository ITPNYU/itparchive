class Documentation < ActiveRecord::Base

  belongs_to :thesis

  has_attached_file :media, 
                    :storage => :s3, 
                    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
                    :s3_permissions => :public_read,
                    :path => "/documentation/:id/:filename"

  before_save :default_values
  
  def default_values
    self.integrity = 0 unless self.integrity
    self.flag = false
  end

  def condition_word
    words = { 1 => "Unusable", 2 => "Fragment", 3 => "Good", 4 => "Perfect"}
    words[condition]
  end

  def link_to_pdf(text)
    "<a href='http://s3.amazonaws.com/itp_archive#{media.path}'>#{text}</a>".html_safe
  end

  def integrity_word
    words = ["-","Unacceptable","Fragment","Great"]
    return words[self.integrity] if self.integrity
    return words[0]
  end

end
