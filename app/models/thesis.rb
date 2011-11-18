# encoding: UTF-8
class Thesis < ActiveRecord::Base

  has_one :person
  has_many :documentations
  accepts_nested_attributes_for :person, :documentations

  has_many :favorites, :as => :favoritable
  has_many :notes, :as => :notable
  
  def to_s
    title
  end

  def read_status
    read_count = 0

    documentations.each do |d|
      read_count +=1 if d.read?
    end
    
    if read_count == 0
      return "-"
    elsif read_count < documentations.length
      return "○".html_safe
    else
      return "●".html_safe
    end
  end
end
