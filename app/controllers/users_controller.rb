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
    @query = UsersIndex.query(match: { name: params[:name] })
    ids = @query.map(&:id)

    render json: User.where(id: ids).page(2).per(2), status: :ok
  end
end
