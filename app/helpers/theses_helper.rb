# encoding: UTF-8
module ThesesHelper
  def check_mark(check_value)
    (check_value ? "<span class='positive'>✔</span>" : "<span class='negative'>✘</span>").html_safe
  end
end
