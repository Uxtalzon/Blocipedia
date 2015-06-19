class WikiPolicy < ApplicationPolicy
  
  def index?
    true
  end
  
  def show?
    user.present? && user.premium? || user.admin?
  end
  
  def edit?
    user.present? && user.premium? || user.admin?
  end  
  
  def update?
    edit?
  end
end