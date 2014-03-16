var StackOverthrow = {}
//Binder

StackOverthrow.Binder = function(sel, controller){
  this.sel = sel
  this.controller = controller
}

StackOverthrow.Binder.prototype = {

  bindEvents: function(){
    this.bindAnswerButton();
    this.bindSubmitAnswerButton();
  },

  bindAnswerButton: function(){
    var controller = this.controller
    $('.button_to').bind('ajax:success', controller.answerFormEvent);
  },

  bindSubmitAnswerButton: function(){
    var controller = this.controller
    $(this.sel.submitAnswerButtonSelector).on('ajax:success', function(e, data){
      e.preventDefault();
      console.log(data)
      controller.submitAnswerEvent(e);
    });
  }

}



//view

StackOverthrow.View = function(sel){
  this.sel = sel
}

StackOverthrow.View.prototype = {

  answerQuestionForm: function(data){

  },

  updateQuestionAnswers: function(e){
     e.preventDefault()
  }

}



//controller

StackOverthrow.Controller = function(view){
  this.view = view;
}

StackOverthrow.Controller.prototype = {

  answerFormEvent: function(e, data){
    var $form = $(data).find('.answerForm')
    console.log($form.get(0))
    $('.answersContainer').before($form.html());
  },

  submitAnswerEvent: function(e){

  }

}



$(document).ready(function(){

  var Selectors = {
    answerButtonSelector: ".answerButton",
    submitAnswerButtonSelector: ".submitAnswer",
    editQuestionButtonSelector: ".editQuestionButton",
    deleteQuestionButtonSelector: ".deleteQuestionButton",
    answerFormContainerSelector: ".answerFormContainer",
    answersContainerSelector: ".answersContainer",
    questionContainerSelector: ".question"
  }

  StackOverthrow.view = new StackOverthrow.View(Selectors);
  StackOverthrow.controller = new StackOverthrow.Controller(StackOverthrow.view)
  new StackOverthrow.Binder(Selectors, StackOverthrow.controller).bindEvents()

});




