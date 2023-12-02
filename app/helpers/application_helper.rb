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

  def show_div(title, value)
    "
    <div class='row mt-3'>
      <div class='col-sm-2'><strong>#{title}</strong></div>
      <div class='col-sm-10'>#{value}</div>
    </div>
    ".html_safe
  end

  def oauth_display_info
    JSON.parse(oauth_access.get('/users/info.json').body)
  rescue
    "---"
  end
end
