removeFavorite = ($favorite) ->
  id = $favorite.data 'id'
  $favorite.removeClass 'favorited'
  if $favorite.find('li').length <= 1
    $favorite.find('.current-user').remove()
    $favorite.removeClass('has-favorites')
  else
    $favorite.find('.current-user').remove()
  $.ajax
    url : '/favorites/'+id
    type : 'DELETE'

addFavorite = ($favorite) ->
  $favorite
    .addClass('favorited')
    .addClass('has-favorites')
    .find('.star').text("★")
  $('<li class="current-user">You</li>').appendTo($favorite.find('.favorites-list'))
  $.ajax
    url : '/favorites'
    type : 'POST'
    data :
      favoritable_type : $favorite.data('favoritable-type')
      favoritable_id : $favorite.attr('href').substring(1)
    success : (response) ->
      console.log response
      $favorite.data({
        'favoritable-id' : response['favoritable_id']
        'favoritable-type' : response['favoritable_type']
        'id' : response['id']
      })

jQuery ->
  $('a.favorite-star').live 'click', ->
    if $(this).hasClass 'favorited'
      removeFavorite($(this))
    else
      addFavorite($(this))
    return false