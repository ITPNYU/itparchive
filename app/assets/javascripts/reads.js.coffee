# Asynchronous add/delete of Read Status on Documentations
removeRead = ($read) ->
  id = $read.data 'id'
  $read.removeClass('is-read').removeClass('red').addClass('green').html("+ N")
  if $read.find('li').length <= 1
    $read.find('.current-user').remove()
    $read.removeClass('has-reads')
  else
    $read.find('.current-user').remove()
  $.ajax
    url : '/reads/'+id
    type : 'DELETE'

addRead = ($read) ->
  $read.addClass('is-read').addClass('red').removeClass('green')
  $('<li class="current-user">You</li>').appendTo($read.find('.reads-list'))
  $.ajax
    url : '/reads'
    type : 'POST'
    data :
      readable_type : $read.closest('div').data('type')
      readable_id : $read.closest('div').data('id')
    success : (response) ->
      console.log response
      $read.data({
        'readable-id' : response['readable_id']
        'readable-type' : response['readable_type']
        'id' : response['id']
      }).html('- N')
jQuery ->
  $('button.read-star').live 'click', ->
    if $(this).hasClass 'is-read'
      removeRead($(this))
    else
      addRead($(this))
    return false
