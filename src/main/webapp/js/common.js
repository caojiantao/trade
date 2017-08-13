function createEditor(selectors) {
  if (selectors) {
    KindEditor.ready(function (K) {
      $.each(selectors, function(index, selector){
        K.create(selector, {
          width: '750px',
          autoHeightMode: true,
          cssData: 'body {font-size:14px;}',
          afterCreate: function () {
            this.loadPlugin('autoheight');
          }
        });
      });
    });
  }
}