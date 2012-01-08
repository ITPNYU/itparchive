# encoding: UTF-8
module DocumentationsHelper
  def read_status(readers, documentation)
    readers_list = []
    classes = ["read-icon"]
    status = "<span class='read-status'>○</span>"
    
    if readers.length > 0
      classes << "has-reads"
      status = "<span class='read-status'>●</span>"
    end

    readers.each do |user|
      if user == current_user
        readers_list << "<li class='current-user'>You</li>"
        classes << "read"
      else
        readers_list << "<li>#{user}</li>"
      end
    end

    link_to "#{status} <ul clas='readers-list'>#{readers_list.join}</ul>".html_safe, "##{documentation.id}", class: classes
  end
end
