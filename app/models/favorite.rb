class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :thesis
  belongs_to :documentation

  attr_accessible :user_id, :thesis_id, :documentation_id
end
