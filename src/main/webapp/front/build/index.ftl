<#import "/front/layout/default.ftl" as default>

<@default.layout>
  <div class="_banner fn-clear">
    <div class="slideBox">
      <ul class="items">
        <#list ads as ad>
          <li <#if ad_index=0>class='active'</#if>><a href="${ad.url}"><img src="${ad.logoUrl}" alt=""></a></li>
        </#list>
      </ul>
    </div>
  </div>
  <div class="right top fn-clear">
    <div class="_search-list border fn-clear">
      &nbsp;業界:&nbsp;
      <select id="tradeId" name="tradeId">
        <option value="0">選択します</option>
      </select>
      &nbsp;ブランド:&nbsp;
      <select id="brandId" name="brandId">
        <option value="0">選択します</option>
      </select>
      &nbsp;分類:&nbsp;
      <select id="productId" name="productId">
        <option value="0">選択します</option>
      </select>
      &nbsp;価格:&nbsp;
      <input name="lowestPrice" type="text" value="0" class="price p1">
      &nbsp;-&nbsp;
      <input name="highestPrice" type="text" value="88000" class="price p2">
      <input type="button" value="检索" class="search-btn btn" onclick="searchByForm()">
    </div>
    <div class="fn-clear">
      <div class="_widget fn-clear wid-side-l">
        <div class="title"><i class="icon-item"></i><span>一番新しいアップロード</span></div>
        <div class="content">
          <div class="box border _pro-new-txt fn-clear">
            <ul>
              <#list latestGoods as goods>
                <li><i></i><a href="/goods.action?id=${goods.id}">${goods.updateTime?string("yyyy-MM-dd")}
                  &nbsp;${goods.title}</a></li>
              </#list>
            </ul>
          </div>
        </div>
      </div>
      <div class="_widget fn-clear wid-side-r">
        <div class="title">
          <i class="icon-item"></i>
          <span>EMS追踪</span>
          <a class="fn-right"></a>
        </div>
        <div class="content">
          <div class="_ems">
            <div data-height="198" class="demo js-scroll-v">
              <ul class="demo1 js-scroll1">
                <#list emsList as ems>
                  <li class="js-item">
                    <a href="/ems.action?id=${ems.id}">•${ems.name}&nbsp;番号：${ems.emsNo}</a>
                  </li>
                </#list>
              </ul>
              <ul class="demo2 js-scroll2"></ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="fn-clear">
      <div class="_widget fn-clear">
        <div class="title"><i class="icon-item"></i><span>売り上げランキング</span></div>
        <div class="content">
          <div class="_pro-sell fn-clear js-scroll-h">
            <div class="scroll-auto fn-clear">
              <#list scrollGoods as goods>
                <div class="item">
                  <span>${goods_index+1}</span>
                  <div class="ibox">
                    <div class="img"><a href="/goods.action?id=${goods.id}"><img src="${goods.logoUrl}" alt=""></a></div>
                  </div>
                  <p class="t"><a href="">${goods.title}</a></p>
                  <p class="p">N品：${goods.price}円 </p>
                </div>
              </#list>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="_widget fn-clear">
      <div class="title"><i class="icon-item"></i><span>人気商品</span></div>
      <div class="content">
        <div class="_pro-hot fn-clear">
          <#list hotGoods as goods>
            <div class="item">
              <div class="ibox">
                <div class="img"><a href="/goods.action?id=${goods.id}"><img src="${goods.logoUrl}" alt=""></a></div>
              </div>
              <p class="t"><a href="">${goods.title}</a></p>
              <p class="p">N品：${goods.price}円 </p><a href="javascript:saveGoods(${goods.id})" class="btn">購入商品</a>
            </div>
          </#list>
        </div>
      </div>
    </div>
    <div class="_widget fn-clear">
      <div class="title"><i class="icon-item"></i><span>一番新しいアップロード</span></div>
      <div class="content">
        <div class="_pro-new-pic">
          <div class="pro-tab top fn-clear">
            <#list tabNames as name>
              <span class="t-${name_index+1}">${name}</span>
            </#list>
          </div>
          <div class="tab-pro-box fn-clear">
            <#list tabGoods as goodsList>
              <div class="box fn-clear">
                <#list goodsList as goods>
                  <div class="item">
                    <div class="ibox">
                      <div class="img"><a href="/goods.action?id=${goods.id}"><img src="${goods.logoUrl}" alt=""></a>
                      </div>
                    </div>
                    <p class="t"><a href="">${goods.title}</a></p>
                    <p class="p">N品：${goods.price}円 </p><a href="javascript:saveGoods(${goods.id})" class="btn">購入商品</a>
                  </div>
                </#list>
              </div>
            </#list>
          </div>
        </div>
      </div>
    </div>
  <#-- <div class="_widget fn-clear">
      <div class="title"><i class="icon-item"></i><span>ご利用案内</span></div>
      <div class="content">
          <div class="_handbook">
              <div class="alone-left"><img src="${img}/alone_04.png" alt="">
                  ${businessInfo.content}
              </div>

              <div class="alone-right"><img src="${img}/alone_05.png" alt="">
                  ${deliveryInfo.content}
              </div>
          </div>
      </div>
  </div> -->
    <div class="_widget fn-clear">
      <div class="title"><i class="icon-item"></i><span>ブランド專區 </span><a href="" class="fn-right">もっと見る&gt;&gt;</a>
      </div>
      <div class="content">
        <div class="_brand fn-clear">
          <#list brands as brand>
            <a href="/brand.action?id=${brand.id}"><img src="${brand.logoUrl}" alt=""></a>
          </#list>
        </div>
      </div>
    </div>
  </div>
  <div class="left fn-clear">
  <#-- <#include "${component}/login.ftl" /> -->
                  <#-- <#include "${component}/ems.ftl" /> -->
                  <#include "${component}/category.ftl" />
                  <#include "${component}/introduction.ftl" />
                  <#-- <#include "${component}/lastest.ftl" /> -->
  </div>
</@default.layout>

<script src="${plugins}/carousel.js"></script>
<script src="${plugins}/common.js"></script>
<script src="/js/select.js"></script>
<script>
  var $c = $('.slideBox');
  $c.setCarousel({
    width: 1000,
    height: 426
  });
</script>
<script>
  function searchByForm() {
    var tradeId = $("select[name='tradeId']").val();
    var brandId = $("select[name='brandId']").val();
    var productId = $("select[name='productId']").val();
    var lowestPrice = $("input[name='lowestPrice']").val();
    var highestPrice = $("input[name='highestPrice']").val();
    window.location.href = "/list.action"
            + "?tradeId=" + tradeId
            + "&brandId=" + brandId
            + "&productId=" + productId
            + "&lowestPrice=" + lowestPrice
            + "&highestPrice=" + highestPrice;
  }

  function switchPic(_a, _b) {
    _a.each(function (ele, i) {
      var _this = $(this);
      if (_this.hasClass('active')) {
        var _index = _a.index(_this);
        var b_this = _b.eq(_index);
        b_this.addClass('active').siblings().removeClass('active');
      }
    })
  }

  function intv(_a, _b) {
    var c = _a.filter(function () {
      return $(this).hasClass('active');
    });
    if (_a.index(c) < _a.length - 1) {
      c.removeClass('active').next().addClass('active');
    } else {
      c.removeClass('active');
      _a.eq(0).addClass('active');
    }
    switchPic(_a, _b);
  }

  $(function () {
    var $b = $('._banner'),
            $b_l = $b.find('.box'),
            $b_l_i = $b_l.find('a'),
            $b_r = $b.find('.list'),
            $b_r_i = $b_r.find('span'),
            blank = 2500;//- 时间间隔

    var t = setInterval(function () {
      intv($b_r_i, $b_l_i)
    }, blank);

    $b_r_i.each(function () {
      var _this = $(this);
      _this.on('click', function (t) {
        clearInterval(t);
        _this.addClass(_this.hasClass('active') ? '' : 'active');
        _this.siblings().removeClass('active');
        switchPic($b_r_i, $b_l_i);
      });
      var t = setInterval(function () {
        intv($b_r_i, $b_l_i)
      }, blank);
    })
  });
</script>
<script>
  $(function () {
    var $t = $('.pro-tab'),
            $t_i = $t.find('span'),
            $c = $('.tab-pro-box'),
            $c_i = $c.find('.box');
    $t_i.each(function (index, element) {
      var _this = $(this);
      _this.on('mouseover', function (e) {
        $c.css({
          marginLeft: -778 * ($t_i.index(_this)) + 'px'
        });
      })
    })
  });
</script>
