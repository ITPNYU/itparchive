class Documentation < ActiveRecord::Base

  belongs_to :thesis

  def condition_word
    words = { 1 => "Unusable", 2 => "Fragment", 3 => "Good", 4 => "Perfect"}
    words[condition]
  end

end
