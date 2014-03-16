var Answer = {
  bindEvents: function() {
    $('.button_to').bind('ajax:success', this.appendAnswerForm);
  },

  appendAnswerForm: function(evt, data){
    $('.answerForm').remove();
    var $form = $(data).find('.answerForm');
    $('.question').after($form);
  },
};

$(document).ready(function(){
  Answer.bindEvents();
});