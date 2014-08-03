$(document).ready(function (){
  var availableTags_questions = <%= (Question.all.collect { |question| "#{question.title}" }) %>;

  $('#autocomplete').autocomplete({source: availableTags_questions });
// {source: availableTags_questions }
  // alert("jquery working ");
});