class Person < ActiveRecord::Base

  belongs_to :thesis
  
  def full_name
    if first
      if last
        full = first + " " + last
      else
        full = first
      end
    elsif last
      full = last
    end
    full
  end
end
