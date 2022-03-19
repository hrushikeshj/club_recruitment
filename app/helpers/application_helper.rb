module ApplicationHelper
  def card(**options, &block)
    render 'shared/card', **options, &block
  end
end
