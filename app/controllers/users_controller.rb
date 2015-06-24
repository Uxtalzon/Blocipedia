class UsersController < ApplicationController
  
  def downgrade
    current_user.role = "standard" 
    current_user.save!
    current_user.wikis.where(private: true).each do |wiki|
      wiki.private = "false"
      wiki.save!
    end 
    redirect_to root_path
  end
end