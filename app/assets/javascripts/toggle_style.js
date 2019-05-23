$( document ).ready(function() {
  $( ".deleteButton" ).hide();
});

toggleStyle = () => {
  if ($( ".deleteButton" ).is(":visible")) {
    $( ".deleteButton" ).hide();
  } else {
    $( ".deleteButton" ).show();
  };
}

deleteRoute = () => {

}
