$(function(){
  $('.file-name').css('cursor','pointer');
  $('.file-name').click(function(){
    $(this).closest('td').find('.add-thesis-form').fadeToggle();
  });

  $('.add-thesis-form .submit').click(function(){
    $theform = $(this).closest('.add-thesis-form');
    if($theform.find('input[name="thesis[title]"]').val() == "" || $theform.find('input[name="thesis[year]"]').val() == "")
    {
        alert("You must fill in the Thesis Title and Year");
    }
    else
    {
      form = {
        id : $theform.find('input[name="documentation"]').val(),
        integrity : $theform.find('select[name="integrity"]').val(),
        flag : $theform.find('select[name="flag"]').val(),
        thesis : {
          title : $theform.find('input[name="thesis[title]"]').val(),
          year : $theform.find('input[name="thesis[year]"]').val(),
          notes : $theform.find('input[name="thesis[notes]"]').val(),
        },
        person : {
          first : $theform.find('input[name="person[first]"]').val(),
          last : $theform.find('input[name="person[last]"]').val(),
          year : $theform.find('input[name="person[year]"]').val()
        }
      }
      $(this).text('Saving...');
      $.ajax({
        url : '/documentations/'+form["id"],
        type : 'PUT',
        data : form,
        success : function(response){
          $theform.empty();
          $theform.html("<h5>Thesis created!</h5>");
        }
      });
    }
    event.preventDefault();
    return false;
  });
});