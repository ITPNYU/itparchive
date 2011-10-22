$(function(){
  $('.file-name').click(function(){
    $(this).closest('td').find('.add-thesis-form').fadeToggle();
  });
  
  $('.add-thesis-form .submit').click(function(){
    $formdata = $(this).closest('.add-thesis-form')
    $.ajax({
      url: '/theses/create',
      type: 'POST'
    });
    event.preventDefault();
    return false;
  });
});