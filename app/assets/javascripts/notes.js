var saveNote = function(note) {
  $.ajax({
    url : '/notes.js',
    type : 'POST',
    data : note,
    success : function(response) {
      $('.notes ul').append(Mustache.render($('#note-template').html(), response));
    }
  });
}

var deleteNote = function($note) {
  id = $note.data('id');
  $.ajax({
    url : '/notes/'+id,
    type : 'DELETE'
  });
}

$(document).ready(function() {
  $('.new-note .add-note-button').click(function() {
    $('.new-note').html(Mustache.render($('#add-note-template').html(), $(this).closest('.new-note').data()));
  });
  
  $('.new-note .submit').live('click', function(){
    $noteForm = $(this).closest('.new-note');
    data = {
      note : {
        'body' : $noteForm.find('textarea').val().replace(/^\s+|\s+$/g, ''),
        'notable_type' : $noteForm.data('notable-type'),
        'notable_id' : $noteForm.data('notable-id'),
        'user_id' : $noteForm.data('user-id'),
        'public' : $noteForm.find('input[type="checkbox"]').is(':checked')
      }
    }
    if(data.note.body.length == 0) {
      alert("Note field must not be blank")
    } else {
      $('.new-note textarea').val('');
      saveNote(data);
    }
    return false;
  });
  
  $('.delete-note').live('click', function() {
    if(confirm("Are you sure you want to delete this note?")) {
      $note = $(this).closest('li');
      $note.remove();
      deleteNote($note);
    }
  });
});