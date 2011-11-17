class Thesis < ActiveRecord::Base

  has_one :person
  has_many :documentations
  has_many :favorites
  accepts_nested_attributes_for :person, :documentations

  has_many :notes, :as => :notable
end
