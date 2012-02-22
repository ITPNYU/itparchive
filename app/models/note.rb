class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :notable, :polymorphic => true

  scope :recent, find(:all, :order => ["created_at DESC"], :limit => 10, :include => [:user, :notable])
  
  def is_public
    public ? "Public" : "Private"
  end
end
