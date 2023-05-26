class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
   
    if user.role == "admin"
    	can :manage, :all

    elsif user.role == "user"
    	can :read, :all
    	can :create, :all
    	can :update, :all
    	can :destroy, :all
      can :show_inventory_foods, Inventory
      can :add_food_item, Inventory
    else
    	can :read, :all
    end
  end
end
