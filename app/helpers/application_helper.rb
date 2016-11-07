module ApplicationHelper
  def nav_entry(body, path)
    content_tag(:li, link_to(body, path), class: ('active' if current_page?(path)))
  end
end
