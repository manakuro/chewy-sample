class UsersController < ApplicationController
  def search
    user_search = UserSearch.new(search_params)
    @users = user_search.search

    render json: @users, status: :ok
  end

  private

  def search_params
    params.permit(:query, :page, :per)
  end
end
