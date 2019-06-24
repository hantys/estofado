# frozen_string_literal: true

module UsersHelper
  def label_status_user(user)
    if user.deleted_at.nil?
      "<span class='badge badge-pill badge-success'>Habilitado</span>".html_safe
    else
      "<span class='badge badge-pill badge-danger'>Desabilitado</span>".html_safe
    end
  end

  def roles_humanize(roles)
    aux = ''
    roles.each do |role|
      aux = aux + '- ' + ((t :"enums.roles.#{role}") + '<br>')
    end
    aux.html_safe
  end
end
