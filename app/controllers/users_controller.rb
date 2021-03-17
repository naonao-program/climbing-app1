class UsersController < ApplicationController
  def show
    @nickname = current.user.nickname
  end
end
