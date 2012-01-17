# encoding: UTF-8
module ThesesHelper
  def check_mark(check_value)
    (check_value ? "<span class='positive'>✔</span>" : "<span class='negative'>✘</span>").html_safe
  end

  def star(favoritors, thesis)
    favorites_list = []
    classes = ["favorite-star"]
    star = "<span class='star'>☆</span>"
    if favoritors.length > 0
      classes << "has-favorites"
      star = "<span class='star'>★</span>"
    end

    favoritors.each do |user|
      if user == current_user
        favorites_list << "<li class='current-user'>You</li>"
        classes << "favorited"
      else
        favorites_list << "<li>#{user}</li>"
      end
    end

    link_to("#{star}<ul class='favorites-list'>#{favorites_list.join("")}</ul>".html_safe, "##{thesis.id}", :class => classes, :title => thesis.class)
  end

end
