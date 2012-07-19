class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      can :access, :rails_admin # grant access to rails_admin
      #can :dashboard
    else
      can :manage, :all
      cannot :access, :rails_admin # grant access to rails_admin
      #cannot :dashboard
      cannot [:edit, :destroy, :new, :create, :update], Account
    end
  end
end

