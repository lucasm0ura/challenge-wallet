class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new
      
      if user.role?(:administrator)
        can :manage, :all
      end 
    end
  end
  