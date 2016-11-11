class TemplatePolicy < ApplicationPolicy
  def create?
  	user.has_role? :admin or user.has_role? :superuser
end
def update?
  	user.has_role? :admin or user.has_role? :superuser
end
def destroy?
  	user.has_role? :admin or user.has_role? :superuser
end
end


  class Scope < Scope
    def resolve
      scope
    end
  end
end