class CategoryPolicy < ApplicationPolicy
    # our authorization rules will go here
    def destroy?
        member.role.name == 'Admin'
    end
    
    def index?
        member.role.name == 'Admin'
    end

    def show?
        member.role.name == 'Admin'
    end

    def create?
    member.role.name == 'Admin'
    end

    def update?
    member.role.name == 'Admin'
    end

  end