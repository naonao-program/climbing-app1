class GroupController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
    @user = current_user.id
  end
end
