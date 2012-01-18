$(function(){
  $('a.favorite-star').live('click', function(){

    if($(this).hasClass('favorited')) {
      // $(this).removeClass('favorited');
      // $.ajax({
      //   url : '/favorites/',
      //   type : 'DELETE'
      // });

      // if($(this).find('li').length <= 1) {
      //   $(this).find('.current-user').remove();
      //   $(this).removeClass('has-favorites');
      // } else {
      //   $(this).find('.current-user').remove();
      // }
    } else {
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
    }

    return false;

  });
});