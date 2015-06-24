class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
  
  def index?
    true
  end
  
  def show?
    if wiki.private?
      user.present? && user.admin? || (user.premium? && user.wikis.include?(wiki))
    else
      user.present? && user.premium? || user.admin? || user.standard?
    end
  end
  
  def edit?
    user.present? && user.premium? || user.admin? || user.standard?
  end  
  
  def update?
    edit?
  end
  
  def destroy?
    user.present? && user.admin? || user.premium?
  end
end