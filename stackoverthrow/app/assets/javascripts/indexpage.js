var Navigation = {
  bindEvents: function() {
    $('.new_question').on('submit', this.appendQuestion);
    // $('.nav-tabs.units').on('click', 'li a', this.showTab);
    // $('.nav-tabs.content').on('click', 'li a', this.showContent);
  },
  appendQuestion: function(){
    event.preventDefault();
    
  }
  // showTab: function() {
  //   event.preventDefault();
  //   $('.tab-pane').removeClass('active');
  //   var contentLink = $(this).data('toggle');
  //   $(contentLink).addClass('active');
  // },

  // showContent: function() {
  //   event.stopPropagation();
  //   $(this).siblings('.challenge-content').toggleClass('hidden');
  // }
}

$(document).ready(function() {
  Navigation.bindEvents();
})