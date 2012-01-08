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

  def favorite_status
    
  end

  def has_media?
    does_have_media = false
    documentations.each do |d|
      does_have_media = d.media_file_name ? true : does_have_media
    end
    does_have_media
  end

  def has_text?
    does_have_text = false
    documentations.each do |d|
      does_have_text = d.paper ? true : does_have_text
    end
    does_have_text
  end

  def read_status
    read_count = 0

    documentations.each do |d|
      read_count +=1 if d.reads.length > 0
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
