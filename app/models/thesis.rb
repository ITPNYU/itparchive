class Thesis < ActiveRecord::Base

  belongs_to :person
  has_many :documentations
  accepts_nested_attributes_for :person, :documentations

end
