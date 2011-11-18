$(function(){
  $('[class*="favorite-star"][class!="favorited"]').click(function(){
    $(this)
      .addClass('favorited')
      .addClass('has-favorites')
      .find('.star').text("★");
    $('<li class="current-user">You</li>').appendTo($(this).find('.favorites-list'));
    $.ajax({
      url : '/favorites',
      type : 'POST',
      data : {
        favoritable_type : $(this).attr('title'),
        favoritable_id : $(this).attr('href').substring(1)
      }
    });
    return false;
  });

  $('.favorited').click(function(){
    return false;
  });
});