jQuery -> 
  # $('[class="favorite"][class!="favorited"]').click ->
  #   $(this)
  #     .addClass('favorited')
  #     .addClass('has-favorites')
  #     .find('.star').text("★")
  #   $('<li class="current-user">You</li>').appendTo($(this).find('.favorites-list'))
  #   $.ajax(
  #     url : '/favorites',
  #     type : 'POST',
  #     data : {thesis_id : $(this).attr('href').substring(1)})
  #   false
  # 
  # $('.favorited').click ->
  #   false