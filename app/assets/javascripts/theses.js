(function($) {
  _.templateSettings = {
    interpolate : /\{\{(.+?)\}\}/g
  };

  // Thesis
  window.Thesis = Backbone.Model.extend({});
  
  window.ThesisView = Backbone.View.extend({
    initialize: function() {
      this.template = _.template($('#thesis-template').html());
    }
  });
})(jQuery);