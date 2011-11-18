class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :notable, :polymorphic => true
end
