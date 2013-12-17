class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :client
      can [:read, :update], Contact
      can :read, Order, :company => user.company
    elsif user.role? :manager
      can :manage, [Order, OrderType]
      can :read, Contact
    elsif user.role? :qc
      can :manage, Contact
    elsif user.role? :agent
      can :read, Order
      can :create, Contact
      
    end
    
  end
end
