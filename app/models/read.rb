class Read < ActiveRecord::Base
  belongs_to :user
  belongs_to :readable, :polymorphic => true

  scope :recent, find(:all, :order => ["created_at DESC"], :limit => 5, :include => [:user, :readable])
end