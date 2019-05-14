function changeImage(routeImage) {
  console.log(routeImage.length)
  if (routeImage.length == 0) {
    $('#bgImage').css("background-image", "url(https://images.unsplash.com/photo-1507034589631-9433cc6bc453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2319&q=80)");
  } else {
    $('#bgImage').css("background-image", "url(\"" + routeImage + "\")");
  };
}
