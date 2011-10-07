class Thesis < ActiveRecord::Base

  belongs_to :person
  has_many :documentation

end
