module ApplicationHelper

  def full_title(page_title)
    title = "Shop Cart"
    if page_title.empty?
      title
    else
      page_title + " | " + title
    end
  end

end
