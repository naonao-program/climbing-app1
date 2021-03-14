class GroupController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @user = current_user.id
  end
end
