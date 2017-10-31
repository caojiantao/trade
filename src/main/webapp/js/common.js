/** 动态创建editor */
function createEditor(selectors) {
  if (selectors) {
    KindEditor.ready(function (K) {
      $.each(selectors, function(index, selector){
        K.create(selector, {
          width : '100%',
          autoHeightMode: true,
          afterCreate: function () {
            this.loadPlugin('autoheight');
          }
        });
      });
    });
  }
}