class AssessmentTypePolicy < ApplicationPolicy
	def create?
  	user.has_role? :superuser
    end
	def update?
  	user.has_role? :superuser
	end
	def destroy?
  	user.has_role? :superuser
	end



  class Scope < Scope
    def resolve
      scope
    end
  end
end