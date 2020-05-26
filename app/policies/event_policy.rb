class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    # We dont need new?, because new? action already calls
    # create? action in ApplicationPolicy

    def create?
      true
    end
  end
end
