module ApplicationHelper

  # Returns __ | ML@B full title on a per-page basis
  def full_title(page_title = '')
    base_title = "ML@B"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
