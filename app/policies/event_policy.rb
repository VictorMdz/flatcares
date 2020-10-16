class EventPolicy < ApplicationPolicy

  def show?
    user.flats.first.id == record.flat.id
  end

  def edit?
    show?
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
