class AreaPolicy < ApplicationPolicy

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
      user.flats.first.areas
    end
  end
end
