module ApplicationHelper
  def nav_link(link_text, link_path, icon='')
    class_name = current_page?(link_path) ? 'active' : ''
    icon_class = "glyphicon glyphicon-" + icon

    content_tag(:li, :class => class_name) do
      (class_name == '') ? (link_to content_tag(:span, " "+link_text, class: icon_class), link_path)
      : (link_to content_tag(:span, " "+link_text, class: ""), '#')
    end
  end
end
