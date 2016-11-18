class FruitPolicy
  attr_reader :user, :record

  def initialize(user, record, params)
    @role = params[:role]
    @user = user
    @record = record
  end

  def index?
    if @role == 'admin'
      true
    else
      raise "Must be an admin to do that"
    end
  end

  def show?
    scope.where(:id => record.id).exists?
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

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
