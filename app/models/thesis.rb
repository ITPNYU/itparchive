class Thesis < ActiveRecord::Base

  has_one :person
  has_many :documentations
  accepts_nested_attributes_for :person, :documentations

  has_many :favorites, :as => :favoritable
  has_many :notes, :as => :notable
  
  def to_s
    title
  end
end
