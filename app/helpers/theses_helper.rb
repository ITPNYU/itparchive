# encoding: UTF-8
module ThesesHelper
  def check_mark(check_value)
    (check_value ? "<span class='pictos positive'>3</span>" : "<span class='pictos negative'>*</span>").html_safe
  end

  def star(favoritors, thesis)
    favorites_list = []
    current_user_favorite_id = nil
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
        current_user_favorite_id = user.favorites.where("favoritable_id = ?", thesis.id).first.id
      else
        favorites_list << "<li>#{user}</li>"
      end
    end

    link_to("#{star}<ul class='favorites-list'>#{favorites_list.join("")}</ul>".html_safe, "##{thesis.id}", :class => classes, :'data-favoritable-type' => thesis.class, :'data-id' => current_user_favorite_id)
  end

end
