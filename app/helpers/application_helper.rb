module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap,  :autolink, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe
  end
end
