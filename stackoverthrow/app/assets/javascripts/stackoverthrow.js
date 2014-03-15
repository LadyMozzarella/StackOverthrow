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
    $(this.sel.answerButtonSelector).on('click', function(e){
      e.preventDefault();
      controller.answerFormEvent(e);
    });
  },

  bindSubmitAnswerButton: function(){
    var controller = this.controller
    $(this.sel.submitAnswerButtonSelector).on('click', function(e){
      e.preventDefault();
      controller.submitAnswerEvent(e);
    });
  }

}



//view

StackOverthrow.View = function(sel){
  this.sel = sel
}

StackOverthrow.View.prototype = {

  answerQuestionForm: function(e){
     e.preventDefault()
  },

  updateQuestionAnswers: function(e){
     e.preventDefault()
  }

}



//controller

StackOverthrow.Controller = function(view){
  this.view = view
}

StackOverthrow.Controller.prototype = {

  answerFormEvent: function(e){
    console.log(e)
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




