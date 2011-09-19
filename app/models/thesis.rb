class Thesis < ActiveRecord::Base

  belongs_to :person
  has_many :media

end
