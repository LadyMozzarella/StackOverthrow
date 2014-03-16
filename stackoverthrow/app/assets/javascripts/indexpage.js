var Navigation = {
  bindEvents: function() {
    $('.login_btn').bind('ajax:success', this.appendLoginForm);
    $('.signup_btn').bind('ajax:success', this.appendSignUp);
  },
  
  appendLoginForm: function(evt, data){
    var form = $(data).find('form');
    $('.login_btn').append(form);
  },

  appendSignUp: function(evt, data){
    var form = $(data).find('form');
    $('.signup_btn').append(form);
  }
};

$(document).ready(function() {
  Navigation.bindEvents();
});