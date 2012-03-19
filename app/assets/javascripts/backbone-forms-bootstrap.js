;(function() {
  var templates = {
    form: '\
      <form class="form-horizontal">\
        <div>{{fieldsets}}</div>\
        <div class="form-actions">\
          <button class="btn primary js-save-button">Save</button>\
          <button class="btn js-back-button">Back</button>\
        </div>\
      </form>\
    ',

    fieldset: '\
      <fieldset>\
        {{legend}}\
        {{fields}}\
      </fieldset>\
    ',

    field: '\
      <div class="control-group">\
        <label class="control-label" for="{{id}}">{{title}}</label>\
        <div class="controls">\
          <div class="input-xlarge">{{editor}}</div>\
          <div class="help-block">{{help}}</div>\
        </div>\
      </div>\
    '
  };
  
  var classNames = {
    error: 'error'
  };

  Backbone.Form.helpers.setTemplates(templates, classNames);
})();
