module ReadsHelper

  def reads_list(documentation, current_user)
    readers = []
    users_read = nil

    documentation.reads.each do |read|
      if read.user == current_user
        users_read =read
      else
        readers << read.user.username
      end
    end

    output = "<div class='reads-list' data-id='#{documentation.id}' data-type='#{documentation.class}'><span class='pictos'>N</span> "
    output += readers.join(", ")
    if users_read.nil?
      output += "<button class='green read-star pictos'>+ N</button>"
    else
      output += "<button class='red read-star pictos is-read' data-id='#{users_read.id}'>- N</button>"
    end
    (output + "</div>").html_safe
  end

end
