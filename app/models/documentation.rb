class Documentation < ActiveRecord::Base

  belongs_to :thesis

  validates_uniqueness_of :aws_url

  def condition_word
    words = { 1 => "Unusable", 2 => "Fragment", 3 => "Good", 4 => "Perfect"}
    words[condition]
  end

end
