class Thesis < ActiveRecord::Base

  belongs_to :person
  has_many :documentation
  accepts_nested_attributes_for :person, :documentation

end
