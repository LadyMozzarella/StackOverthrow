var Answer = {
  bindEvents: function() {
    $('.button_to').bind('ajax:success', this.appendAnswerForm);
    $('.button_to').bind('ajax:success', this.appendCommentForm);
  },

  appendAnswerForm: function(evt, data){
    $('.answerForm').remove();
    var $form = $(data).find('.answerForm');
    $('.question').after($form);
  },

  appendCommentForm: function(evt, data){
  	console.log("hi")
  	$('.commentForm').remove();
  	var form = $(data).find('.commentForm');
  	$('.question').after(form);
  }
};

$(document).ready(function(){
  Answer.bindEvents();
});