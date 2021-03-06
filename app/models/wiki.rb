class Wiki < ActiveRecord::Base
  belongs_to :user
  
  # scope :visible_to, -> { where(public: true) }
  scope :visible_to, -> (user) { user ? all : where(public: true) }
end
