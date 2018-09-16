/** 动态创建editor */
function createEditor(ids) {
  if (ids && ids.length > 0) {
    window.editors = [];
    KindEditor.ready(function (K) {
      $.each(ids, function (index, id) {
        window.editors.push(
            K.create('#' + id, {
              width: '100%',
              autoHeightMode: true,
              uploadJson: '/files.action',
              afterCreate: function () {
                this.loadPlugin('autoheight');
              }
            })
        );
      });
    });
  }
}

/**
 * 同步富文本框数据
 */
function syncEditor() {
  if (window.editors && window.editors.length > 0) {
    $.each(window.editors, function (index, editor) {
      editor.sync();
    })
  }
}

function getItem(datas, key, value) {
  if (datas && datas.length > 0) {
    for (var i = 0; i < datas.length; i++) {
      var item = datas[i];
      if (item[key] === value) {
        return item;
      }
    }
  }
  return null;
}