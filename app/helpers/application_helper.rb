# frozen_string_literal: true

module ApplicationHelper
  # def active_class(link_path)
  #   current_page?(link_path) ? 'active' : ""
  # end

  def active_class(controller, link_path = '')
    # # current_controller?(link_path) ? 'active' : ""
    # controller_name
    current_page?(link_path) || (controller_name == controller) ? 'active' : ''
  end
end
