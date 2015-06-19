class UsersController < ApplicationController
  
  def downgrade
    current_user.role = "standard"
    current_user.save!
    redirect_to root_path
  end
end