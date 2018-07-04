module ApplicationHelper

  def nav_link(titulo, path)
    classValue = current_page?(path) ? 'active' : ''

    content_tag(:li, class: classValue) do
      link_to titulo, path
    end
  end


  def title(titulo)
    content_tag(:div, class: "page-header") do
      content_tag(:h1) do
        titulo
      end
    end
  end
end
