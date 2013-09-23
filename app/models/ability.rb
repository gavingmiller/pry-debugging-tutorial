class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.email == 'gavin@petrofeed.com'
      can :manage, :all
    else
      cannot :manage, :all
      can :index, :all
    end
  end
end
