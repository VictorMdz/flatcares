class FlatPolicy < ApplicationPolicy

  def create?
    true
  end

  def new?
    true
  end

  def show?
    record.user_ids.include?(user.id)
  end

  def edit?
    true
  end


  def update?
    user.flatmembers.first.is_admin?
  end

  def destroy?
    user.flatmembers.first.is_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
