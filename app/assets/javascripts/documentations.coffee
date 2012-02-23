jQuery ->
  $('.file-name').css('cursor','pointer')
  $('.file-name').click ->
    $(this).closest('td').find('.add-thesis-form').fadeToggle()

  $('.add-thesis-form .submit').click ->
    $theform = $(this).closest('.add-thesis-form')
    if($theform.find('input[name="thesis[title]"]').val() == "" || $theform.find('input[name="thesis[year]"]').val() == "")
        alert("You must fill in the Thesis Title and Year")
    else
      form = {
        id : $theform.attr('data-documentationID')
        integrity : $theform.find('[name="documentation[integrity]"]').val()
        flag : $theform.find('[name="documentation[flag]"]').val()
        physical_location : $theform.find('[name="documentation[physical_location]"]').val()
        read : $theform.find('[name="documentation[reads]"]').is(':checked')
        has_images : $theform.find('[name="documentation[has_images]"]').is(':checked')
        thesis : {
          title : $theform.find('[name="thesis[title]"]').val()
          year : $theform.find('[name="thesis[year]"]').val()
        }
        person : {
          first : $theform.find('[name="person[first]"]').val()
          last : $theform.find('[name="person[last]"]').val()
        }
      }
      $(this).text('Saving...')
      $.ajax({
        url : '/documentations/'+form["id"]
        type : 'PUT'
        data : form
        success : (response) ->
          console.log(response)
          $theform.empty()
          $theform.html("<h5>Thesis created!</h5>")
      })
    return false

  $('#new-documentation-form-button').click ->
    $('.documentations-list ul').append(Mustache.render($('#new-documentation-form').html(), "{}"))
    $(this).remove()
    return false

  $('button.delete').click ->
    if confirm "Delete Documentation!\n Are you sure? All files will be immediately deleted. This cannot be undone."
      deleteDocumentation $(this).closest('.documentation')
    return false

deleteDocumentation = ($documentation) ->
  id = $documentation.data('id')
  $documentation.remove()
  $.ajax
    url : '/documentations/'+id
    type : 'DELETE'
  