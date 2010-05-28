# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def marker_variable_icon(marker)
    ActiveSupport::Inflector.underscore(marker.markable.class)
  end
end
