# frozen_string_literal: true

class BlogPolicy < ApplicationPolicy
  # our authorization rules will go here
  def destroy?
    member.role.name == 'Admin' or member.id == member.blogs.find_by(member_id: member.id)
  end

  def index?
    member.role.name == 'Admin'
  end

  def show?
    member.role.name == 'Admin' or member.role.name == 'Writer' or member.role.name == 'Reader'
  end

  def create?
    member.role.name == 'Admin' or member.role.name == 'Writer'
  end

  def update?
    member.role.name == 'Admin' or member.id == member.blogs.find_by(member_id: member.id)
  end
end
