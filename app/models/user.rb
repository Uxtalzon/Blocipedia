class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def after_initialize 
    return unless new_record?
    self.status = ACTIVE
  end
  
  def admin?
    role == 'admin'
  end
  
  def premium?
    role == 'premium'
  end
  
  def standard?
    role == 'standard'
  end  
end
