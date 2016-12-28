class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def miles_to_meter(miles)
    1609.34 * miles
  end

  helper_methods :miles_to_meter
end
