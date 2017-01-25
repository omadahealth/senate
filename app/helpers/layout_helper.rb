module LayoutHelper

  def site_title_helper
    "Senate" + (Rails.env == "production" ? "" : " #{Rails.env}")
  end

  def page_heading_helper
    if content_for? :heading
      content_for :heading
    elsif @heading == false
      # Suppress heading
    else
      heading = @heading || title || "MISSING HEADING, SET title OR content_for :heading"
      content_tag :h1, heading, class: 'page-heading'
    end
  end

  def main_navbar_data
    [
      {
        items: [
          {
            name: 'Home', href: root_path
          },
        ]
      },
      {
        class: "navbar-right",
        items: [
          {
            unless: user_signed_in?,
            name: "Log In",
            href: new_user_session_path
          },
          {
            if: user_signed_in?,
            name: current_user.try(:username),
            href: "#",
            submenu: [
              {
                name: "Log Out",
                href: destroy_user_session_path,
                link_options: { method: "delete" },
              }
            ]
          }
        ]
      }
    ]
  end
end
