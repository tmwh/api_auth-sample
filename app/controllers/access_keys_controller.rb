class AccessKeysController < ApplicationController
  before_action :authenticate_user!

  def index
    @access_keys = current_user.access_keys
  end

end
