module BootstrapNavHelper

  # Construct Bootstrap navbar HTML.
  #
  # Arguments:
  #   * array of navbar segment hashes containing navbar item data (see below).
  #   * a CSS class for the outermost nav item, which can be one of the Bootstrap
  #     standard classes 'navbar-default' or 'navbar-inverse', or one that you
  #     have styled yourself, e.g. 'navbar-omada'.
  #
  # A navbar segment hash must contain an _items_ array and may contain:
  #   * class: css classes to apply to this segment, e.g. "navbar-right"
  #   * if: a boolean value indicating if this segment should be included
  #   * unless: an boolean indicating if this segment should be omitted
  #
  # The navbar segment _items_ is an array of hashes containing the displayed
  # navbar menu items.  They must contain a _name_ and _href_ strings, and
  # may also contain:
  #   * if: [boolean] indicates if this item should be displayed at this time
  #   * unless: [boolean] indicates if this item should be omitted at this time
  #   * link_options: [hash] extra values to pass to the link_to() method
  #   * submenu: [array] hashes describing navbar submenu items
  #
  # For example, here is a navbar with a single "Home" item on the left, and
  # on the right, depending whether the user is signed in, either a "Log In"
  # item, or a username item with a submenu containing "Log Out".
  #
  #   [
  #     {
  #       # Left navbar segment
  #       items: [
  #         {
  #           name: 'Home', href: root_path
  #         }
  #       ]
  #     },
  #     {
  #       # Right navbar segment
  #       class: "navbar-right",
  #       items: [
  #         {
  #           unless: user_signed_in?,
  #           name: "Log In",
  #           href: new_user_session_path
  #         },
  #         {
  #           if: user_signed_in?,
  #           name: current_user.try(:username),
  #           href: "#",
  #           submenu: [
  #             {
  #               name: "Log Out",
  #               href: destroy_user_session_path,
  #               link_options: { method: "delete" },
  #             }
  #           ]
  #         }
  #       ]
  #     }
  #   ]
  #
  def bootstrap_navbar_helper(navbar_data, nav_css_class='navbar-default')
    navbar_css_classes = CssClassList.new 'navbar', nav_css_class
    content_tag(:nav, class: navbar_css_classes, role: "navigation") do
      content_tag(:div, class: "container-fluid") do
        navbar_header + navbar_segments(navbar_data)
      end
    end
  end

  private

  def navbar_header
    # Brand and toggle get grouped for better mobile display
    content_tag(:div, navbar_header_toggle, class: "navbar-header") +
      navbar_header_brand
  end

  def navbar_header_toggle
    content_tag(:button, class: "navbar-toggle",
                data: { target: "#navbar-collapse", toggle: "collapse" },
                type: "button") do
      content_tag(:span, "Toggle navigation", class: "sr-only") +
        (1..3).map { content_tag(:span, "", class: "icon-bar") }.join.html_safe
    end
  end

  def navbar_header_brand
    link_to(Rails.application.class.parent_name.titleize, root_path, class: "navbar-brand")
  end

  def navbar_segments(navbar_data)
    content_tag(:div, id: "navbar-collapse", class: "collapse navbar-collapse") do
      enabled_nav_items(navbar_data).map do |nav_segment_data|
        navbar_segment nav_segment_data
      end.join.html_safe
    end
  end

  def navbar_segment(nav_segment_data)
    nav nav_segment_data[:items], class: ["navbar-nav", nav_segment_data[:class]]
  end

  def nav(nav_data, options={})
    ul_css_classes = CssClassList.new "nav", options[:class]
    content_tag(:ul, class: ul_css_classes) do
      enabled_items = enabled_nav_items nav_data
      enabled_items.map do |item_data|
        nav_item item_data
      end.join.html_safe
    end
  end

  def enabled_nav_items(items)
    items.reject do |item|
      (item.has_key?(:if) && item[:if] == false) || (item.has_key?(:unless) && item[:unless] == true)
    end
  end

  def nav_item(item_data)
    li_classes = CssClassList.new
    li_classes << "active" if item_is_active?(item_data)
    li_classes << "dropdown" if item_data[:submenu]
    content_tag(:li, class: li_classes) do
      nav_item_content item_data
    end
  end

  def nav_item_content(item_data)
    if item_data[:content]
      item_data[:content].html_safe
    elsif item_data[:submenu]
      nav_item_with_submenu(item_data).html_safe
    else
      link_to item_data[:name], item_data[:href], item_data[:link_options]
    end
  end

  def nav_item_with_submenu(item_data)
    nav_submenu_link(item_data) + nav_submenu(item_data[:submenu])
  end

  def nav_submenu_link(item_data)
    link_to "#", class: "dropdown-toggle", data: {toggle: "dropdown"} do
      (item_data[:name] + content_tag(:b, "", class: "caret")).html_safe
    end
  end

  def nav_submenu(submenu_item_data)
    content_tag(:ul, class: "dropdown-menu") do
      submenu_item_data.map do |subitem_data|
        nav_item subitem_data
      end.join.html_safe
    end
  end

  def item_is_active?(item_data)
    if item_data[:active] && item_data[:active].is_a?(Regexp)
      request.path =~ item_data[:active]
    elsif item_data[:active].is_a?(Proc)
      item_data[:active].call
    else
      request.path == item_data[:href]
    end
  end
end
