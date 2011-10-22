$(function(){
  $('.file-name').click(function(){
    $(this).closest('td').find('.add-thesis-form').fadeToggle();
  });
  
  $('.add-thesis-form .submit').click(function(){
    $theform = $(this).closest('.add-thesis-form');
    form = {
      id : $('input[name="documentation"]').val(),
      thesis : {
        title : $('input[name="thesis[title]"]').val(),
        year : $('input[name="thesis[year]"]').val(),
        notes : $('input[name="thesis[notes]"]').val(),
      },
      person : {
        first : $('input[name="person[first]"]').val(),
        last : $('input[name="person[last]"]').val(),
        year : $('input[name="person[year]"]').val()
      }
    }
    $.ajax({
      url : '/documentations/'+form["id"],
      type : 'PUT',
      data : form,
      success : function(response){
        $theform.empty();
        $theform.html("<h5>Thesis created!</h5>");
      }
    });
    event.preventDefault();
    return false;
  });
});