module ApplicationHelper

  def welcome_message
    current_user ? "Logged in as #{ current_user.username}" : "Default welcome msg!"
  end

  def prev_page(model)
    (model.current_page == 1) ? 1 : (model.current_page - 1)
  end

  def next_page(model)
    (model.current_page == model.total_pages) ? model.total_pages : (model.current_page + 1)
  end
end
