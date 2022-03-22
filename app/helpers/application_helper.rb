module ApplicationHelper
  def card(**options, &block)
    render 'shared/card', **options, &block
  end

  def sidebar_link(text, link)
    link_to text, link, class: 'nav-link link-dark'
  end
end
