# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[nickname boulder_gym_grade_id lead_gym_grade_id
                                               boulder_rock_grade_id lead_rock_grade_id gender_id region_id age_id])
  end
end