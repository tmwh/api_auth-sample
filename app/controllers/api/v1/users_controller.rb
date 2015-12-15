class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_external_service!

  def all
    @users = User.all.includes(:access_keys)
  end
end
