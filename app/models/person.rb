class Person < ActiveRecord::Base

  has_one :thesis
  
  def full_name
    first + " " + last
  end
end
