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

  def link_to_modal(name = nil, options = nil, html_options = nil, &block)
    if block_given?
      html_options = options
      options = name
      name = block
    end
    options ||= {}
    html_options = convert_options_to_data_attributes(options, html_options)

    url = url_for(options)
    html_options.merge! data: { toggle: 'modal', target: '#show_object', link: url }
    html_options['href'] ||= 'javascript:;'

    content_tag('a', name || url, html_options, &block)
  end

  def link_to_modal_form(name = nil, options = nil, html_options = nil, &block)
    if block_given?
      html_options = options
      options = name
      name = block
    end
    options ||= {}
    html_options = convert_options_to_data_attributes(options, html_options)

    url = url_for(options)
    html_options.merge! data: { toggle: 'modal', target: '#form_object', link: url }
    html_options['href'] ||= 'javascript:;'

    content_tag('a', name || url, html_options, &block)
  end
end
