module ApplicationHelper
  def full_page_title(page_title="")
    base_title = "梗多多"
    page_title.empty? ? base_title : page_title + ' - ' + base_title
  end
end
