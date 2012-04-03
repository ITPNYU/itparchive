class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favoritable, :polymorphic => true, :touch => true

  scope :recent, find(:all, :order => ["created_at DESC"], :include => [:user, :favoritable])
end
