module ApplicationHelper
  def card(**options, &block)
    render 'shared/card', **options, &block
  end

  def sidebar_link(text, link, _class='')
    link_to text, link, class: "nav-link link-dark #{_class}"
  end

  def current_user_application_url
    current_user.application ? edit_application_path(current_user.application) : new_user_application_path(current_user)
  end
end
