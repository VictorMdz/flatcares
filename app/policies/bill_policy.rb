class BillPolicy < ApplicationPolicy

  def index?
    raise
    record.first.flat == user.flats.first
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
