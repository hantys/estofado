# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :update, :destroy, to: :save
    alias_action :index, :find_by_address, :find_city, to: :home_access

    # Define abilities for the passed in user here. For example:
    #
    # can :manage, :all if user.role? :admin
    if user.role? :admin
      can :crud, :all
      # home
      can :home_access, :home
    end

    if user.role? :employee
      can :crud, :all
      cannot :crud, User

      # home
      can :home_access, :home
    end
  end
end
