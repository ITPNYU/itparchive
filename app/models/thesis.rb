class Thesis < ActiveRecord::Base

  has_one :person
  has_many :documentations
  accepts_nested_attributes_for :person, :documentations

end
