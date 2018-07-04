module ApplicationHelper

  def nav_link(title, path)
    classValue = current_page?(path) ? 'active' : ''

    content_tag(:li, class: classValue) do
      link_to title, path
    end
  end
end
