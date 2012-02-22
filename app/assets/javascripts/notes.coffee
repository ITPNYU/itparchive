saveNote = (note) ->
  $.ajax
    url : '/notes.js'
    type : 'POST'
    data : note
    success : (response) ->
      console.log response
      $('.notes ul').append Mustache.render($('#note-template').html(), response)

deleteNote = ($note) ->
    id = $note.data('id')
    $.ajax
      url : '/notes/'+id
      type : 'DELETE'

jQuery ->
  $('.new-note .add-note-button').click ->
    $('.new-note').html Mustache.render($('#add-note-template').html(), $(this).closest('.new-note').data())
  
  $('.new-note .submit').live 'click', ->
    $noteForm = $(this).closest '.new-note'
    data =  {
      note : {
        body: $noteForm.find('textarea').val().replace(/^\s+|\s+$/g, '')
        notable_type : $noteForm.data('notable-type')
        notable_id : $noteForm.data('notable-id')
        user_id : $noteForm.data('user-id')      
      }
    }
    if data.note.body.length == 0
      alert("Note field must not be blank")
    else
      $('.new-note textarea').val('')
      saveNote data
    return false
  
  $('.delete-note').live 'click', ->
    if confirm("Are you sure you want to delete this note?")
      $note = $(this).closest('li')
      $note.remove()
      deleteNote $note