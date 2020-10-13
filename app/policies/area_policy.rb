class AreaPolicy < ApplicationPolicy

  def index?
    record.first.flat == user.flats.first
  end

  def show?
    record.first.areas.first.flat == user.flats.first
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
