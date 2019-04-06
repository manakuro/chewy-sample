# frozen_string_literal: true

class UserSearch
  include ActiveModel::Model

  attr_accessor :query

  def search
    [query_string].compact.reduce(&:merge)
  end

  def query_string
    index.query(query_string: { fields: [:name, :email, :phone], query: query, default_operator: 'and' }) if query.present?
  end

  private


  def index
    UsersIndex
  end
end
