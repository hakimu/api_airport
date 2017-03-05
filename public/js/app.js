$(document).ready(function(){
  console.log("jQuery loaded");
  $("#city_select").change(function(){
    var selection = $(this).val();
    console.log(selection);
  });
});