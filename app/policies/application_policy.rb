class ApplicationPolicy

  attr_reader :context, :user, :session, :record

  def initialize(context, record)
    @context = context
    @record = record
  end

  delegate :user, to: :context
  delegate :session, to: :context

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
