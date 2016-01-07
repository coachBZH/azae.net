$("#search-form").submit(function(){
  var $input = $("#query");
  var $query = $input.val() + " site:azae.net";
  $input.val($query);
});
