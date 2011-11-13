$(function(){
  $('.add-favorite').click(function(){
    event.preventDefault();
    $.ajax({
      url : '/favorites',
      type : 'POST',
      data : {thesis_id : $(this).attr('href').substring(1)}
    });
    return false;
  });
});