class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all

    elsif user.role == 'user'
      can :read, :all, user_id: user.id
      can :read, Inventory, user_id: user.id
      can :show, Inventory, user_id: user.id
      can :show, Recipe, public: true
      can :create, :all
      can :update, :all, user_id: user.id
      # can :destroy, :all, user_id: user.id
      can :destroy, Inventory, user_id: user.id
      can :destroy, Recipe, user_id: user.id

      can :show_inventory_foods, Inventory, user_id: user.id
      can :add_food_item, Inventory, user_id: user.id

      can :show_recipe_foods, Recipe, user_id: user.id
      can :add_food_item, Recipe, user_id: user.id
      can :remove_food_item, Recipe, user_id: user.id
      can :generate_shopping_list, Recipe, user_id: user.id
      can :toggle_public, Recipe, user_id: user.id
    end
  end
end
