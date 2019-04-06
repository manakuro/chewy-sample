class UsersController < ApplicationController
  def index
    u = User.new(
      status: :confirmed,
      name: 'manato kuroda',
      email: 'hey@gmail.com',
      phone: '0920205020'
    )
    u.save!

    render json: { ok: true, test: 'hi' }, status: :ok
  end

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
