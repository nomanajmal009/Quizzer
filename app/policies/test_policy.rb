# frozen_string_literal: true

class TestPolicy < ApplicationPolicy
    attr_reader :user, :test
  
    def initialize(user, test)
      @user = user
      @test = test
    end
  
    def index?
      true
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
      def initialize(user, test)
        @user = user
        @test = test
      end
  
      def resolve
        raise NotImplementedError, "You must define #resolve in #{self.class}"
      end
  
      private
  
      attr_reader :user, :test
    end
  end
  