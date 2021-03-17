class GroupController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @user = current_user.id
  end
end
