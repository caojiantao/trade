!(function ($) {
    //配置选项
    var defaults = {
        url: '',//ajax接口地址(必选)
        className: '',//分页组件外层结构类(必选)
        onClick: function (index, pageNum, total, rows) {
            console.info(index, pageNum, total, rows);
        },//点击分页回调(必选)
        data: {},
        maxPage: 7,//最多分页按钮数(可选)
        edge: 1,//左右最少分页按钮数(可选)
        showSide: true
    };

    $.extend({
        setPages: function (options) {
            var opts = $.extend({}, defaults, options || {});
            var PAGING = {
                SL: {
                    $pageOuter: $('.' + opts.className)
                },
                DOM: {
                    ellipsis: '<span class="x-ellipsis">...</span>',//省略号
                    $pageBox: $('<div class="x-pageBoxer"></div>'),//分页组件最外层结构
                    prev: '<a class="x-pageBtn x-prev">上一页</a>',
                    next: '<a class="x-pageBtn x-next">下一页</a>',
                    prevD: '<a class="x-pageBtn x-prev disabled">上一页</a>',
                    nextD: '<a class="x-pageBtn x-next disabled">下一页</a>'
                },//虚拟dom存储对象
                pIndex: 1,//当前分页下标
                pageNum: 0,

                maxPage: (opts.maxPage % 2 == 0) ? (opts.maxPage + 1) : opts.maxPage,//最多显示多少个分页按钮
                url: opts.url,//ajax接口地址(必选)
                limit: opts.data.limit ? opts.data.limit : 10,//每页商品数//(必选)
                headL: opts.edge,//左边最少页数(可选)
                tailL: opts.edge, //右边最少页数(可选)
                className: opts.className,//自定义样式类(可选)
                onClick: opts.onClick,//点击分页回调(必选)
                showSide: opts.showSide,
                _data: opts.data,
                //填充分页按钮
                fillPages: function (bool, index) {
                    if (bool) {
                        return '<a class="active x-pageBtn">' + index + '</a>';
                    } else {
                        return '<a class="x-pageBtn">' + index + '</a>';
                    }
                },
                // 页面加载
                initPaging: function () {
                    var start = (PAGING.pIndex - 1) * PAGING.limit;//偏移量
                    this._data.start = start;
                    $.ajax({
                        type: 'get',
                        dataType: 'json',
                        url: PAGING.url,
                        data: PAGING._data,
                        success: function (data) {
                            //处理data
                            //console.log(PAGING.limit,123);
                            var total = data.total,
                                rows = data.rows,
                                pageNum = PAGING.pageNum = Math.ceil(total / PAGING.limit);
                            PAGING.switchPages();
                            opts.onClick(PAGING.pIndex, pageNum, total, rows);
                        }
                    });
                },
                //点击分页按钮
                clickPaging: function () {
                    var pageOuter = this.SL.$pageOuter,
                        pageBtn = pageOuter.find('.x-pageBtn');
                    pageOuter.on('mouseup', pageBtn, function (e) {
                        var _this = $(e.target),
                            index = _this.html();
                        e.stopPropagation();
                        if (_this.is('.x-pageBtn')) {
                            if (_this.is('.disabled')) {
                                e.preventDefault();
                                //console.log('点了页没用');
                            } else if (_this.html() == '...') {
                                //console.log('点了页没用');
                            } else {
                                if (_this.is('.x-prev')) {
                                    PAGING.pIndex = PAGING.pIndex - 1;
                                    PAGING.initPaging();
                                } else if (_this.is('.x-next')) {
                                    PAGING.pIndex = PAGING.pIndex + 1;
                                    PAGING.initPaging();
                                } else {
                                    PAGING.pIndex = parseInt(index);
                                    _this.addClass('active').siblings().removeClass('active');
                                    PAGING.initPaging();
                                }
                            }
                        }
                    });

                    pageOuter.on('mousemove', function (e) {
                        e.preventDefault();
                        e.stopPropagation();
                    });
                },
                //切换分页选项
                switchPages: function () {
                    this.SL.$pageOuter.find('.x-pageBoxer').remove();//清空
                    var i = '',
                        j = '',//索引
                        totalP = this.pageNum,//一共的页数
                        pageL = this.maxPage,//可展现页数
                        half = (pageL - 1) / 2,//分页半长
                        mainL = pageL - this.headL - this.tailL,//中间长度
                        code = '';//分页字符串
                    if (totalP < this.pIndex) {
                        //console.log('总页数不能小于当前页数！');
                        return false;
                    }
                    //不需要省略
                    if (totalP < pageL) {
                        // console.log('不需要省略');
                        for (i = 0; i < totalP; i++) {
                            code += (i + 1 == this.pIndex) ? this.fillPages(true, i + 1) : this.fillPages(false, i + 1);
                        }
                    } else {
                        //只需要右边省略
                        if (this.pIndex <= half + 1) {
                            // console.log('只需要右边省略', this.pIndex, half + 1);
                            var tailer = '';
                            for (i = 0; i < this.headL + mainL; i++) {
                                code += (i + 1 == this.pIndex) ? this.fillPages(true, i + 1) : this.fillPages(false, i + 1);
                            }
                            code += this.DOM.ellipsis;
                            for (i = totalP; i > totalP - this.tailL; i--) {
                                tailer = this.fillPages(false, i) + tailer;
                            }
                            code += tailer;
                        }
                        //只需要左边省略
                        else if (this.pIndex >= totalP - half) {
                            // console.log('只需要左边省略', this.pIndex, totalP - half);
                            var header = '';
                            for (j = 0, i = totalP; j < pageL - this.headL; i--, j++) {
                                code = ((this.pIndex == i) ? this.fillPages(true, i) : this.fillPages(false, i)) + code;
                            }
                            code = this.DOM.ellipsis + code;
                            for (i = 0; i < this.headL; i++) {
                                header += this.fillPages(false, i + 1);
                            }
                            code = header + code;
                        }
                        //两边需要省略
                        else {
                            var header = '',
                                tailer = '',
                                partA = '',
                                partB = '';
                            for (i = 0; i < this.headL; i++) {
                                header += this.fillPages(false, i + 1);
                            }
                            header += this.DOM.ellipsis;
                            for (i = totalP; i > totalP - this.tailL; i--) {
                                tailer = this.fillPages(false, i) + tailer;
                            }
                            tailer = this.DOM.ellipsis + tailer;
                            var offset_m = Math.floor((mainL + 1) / 2),
                                counter = (parseInt(this.pIndex) + parseInt(offset_m));
                            for (i = j = this.pIndex; i < counter; i++, j--) {
                                partA = ((i == j) ? '' : this.fillPages(false, j)) + partA;
                                partB += (i == j) ? this.fillPages(true, i) : this.fillPages(false, i);
                            }
                            code = header + partA + partB + tailer;
                        }
                    }
                    //是否需要上下分页按钮
                    if (this.showSide) {
                        if (this.pIndex == 1) {
                            if (this.pIndex == totalP) {
                                code = this.DOM.prevD + code + this.DOM.nextD;
                            } else {
                                code = this.DOM.prevD + code + this.DOM.next;
                            }
                        } else if (this.pIndex == totalP) {
                            code = this.DOM.prev + code + this.DOM.nextD;
                        } else {
                            code = this.DOM.prev + code + this.DOM.next;
                        }
                    }
                    var $pageBox = this.DOM.$pageBox.clone();
                    $pageBox.append($(code));
                    this.SL.$pageOuter.append($pageBox);
                    // this.clickPaging();
                },
                init: function () {
                    this.initPaging();
                    this.clickPaging();
                }
            };
            PAGING.init();
        }
    });
})(jQuery);