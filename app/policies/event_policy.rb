class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    # We dont need new?, because new? action already calls
    # create? action in ApplicationPolicy
  end

  def show?
    true
  end

  def create?
    true
  end

  def summary?
    true
  end
end
