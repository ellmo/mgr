class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.id
      can :manage, :all
    else
      can :read, :all
    end    
  end
end
