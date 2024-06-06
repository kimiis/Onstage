module ApplicationHelper
  def render_header
    render(partial: 'components/header/header')
  end
end
