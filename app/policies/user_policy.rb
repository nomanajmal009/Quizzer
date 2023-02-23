# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
    attr_reader :user, :scope
  
    def index?
      user.teacher?
    end
  
    def show?
      user.teacher?
    end
  
    def create?
      user.teacher?
    end
  
    def new?
      create?
    end
  
    def update?
      user.teacher?
    end
  
    def edit?
      update?
    end
  
    def destroy?
        user.teacher?
    end
  
    class Scope
      def initialize(user, scope)
        @user = user
        @scope = scope
      end
  
      def resolve
        raise NotImplementedError, "You must define #resolve in #{self.class}"
      end
  
      private
  
      attr_reader :user, :scope
    end
  end
  