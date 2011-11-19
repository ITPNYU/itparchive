(function($) {
  // Thesis
  window.Thesis = Backbone.Model.extend({
    hasFavorites: function(){
      if(this.get('favorites').length >= 1) {
        return true;
      }
      return false;
    },
  });

  window.Theses = Backbone.Collection.extend({
    model: Thesis,
    url: '/theses.json'
  });

  window.ThesisTableRow = Backbone.View.extend({
    tagName: 'tr',
    
    initialize: function() {
      _.bindAll(this, 'render');
      this.model.bind('change', this.render);
      
      this.template = _.template($('#thesis-table-row').html());
    },

    render: function() {
      var renderedContent = this.template(this.model.toJSON());
      $(this.el).html(renderedContent);
      return this;
    }
  });
  
  window.ThesesTableRow = ThesisTableRow.extend({
    events: {
      'click .favorite.add': 'addFavorite'
    },

    addFavorite: function(){
      this.model.set({favorites: 'yes'});
      console.log("Selected",this.model);
    },
  });
  
  window.ThesesView = Backbone.View.extend({
    tagName: 'table',
    id: 'theses-table',

    initialize: function(){
      _.bindAll(this, 'render');
      this.template = _.template($('#theses-template').html());
      this.collection.bind('reset', this.render);
    },
    
    render: function(){
      var $theses,
        collection = this.collection;
      
      $(this.el).html(this.template({}));
      $theses = this.$('tbody');
      collection.each(function(thesis){
        var view = new ThesesTableRow({
          model: thesis,
          collection: collection
        });
        $theses.append(view.render().el);
      });
      return this;
    }
  });
})(jQuery);