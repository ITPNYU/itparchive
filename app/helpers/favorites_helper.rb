# encoding: UTF-8
module FavoritesHelper
  def favorite_star(item, user)
    favorites_list = []
    classes = ["favorite-star"]
    star = "<span class='star'>☆</span>"
    if item.favorites.length > 0
      classes << "has-favorites"
      star = "<span class='star'>★</span>"

      item.favorites.each do |f|
        if f.user == current_user
          favorites_list << "<li class='current-user'>You</li>"
          classes << "favorited"
        else
          favorites_list << "<li>#{f.user}</li>"
        end
      end
    end
    return link_to("#{star}<ul class='favorites-list'>#{favorites_list.join("")}</ul>".html_safe, "##{item.id}", :class => classes, :title => item.class)
  end
end
