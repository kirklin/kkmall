$(".sl_ext a:nth-child(1)").hover(function () {
    $(this).children("b").stop(true).animate({top: "3px"}, 50);
    $(this).children("i").stop(true).animate({top: "-23px"}, 50)
}, function () {
    $(this).children("b").stop(true).animate({top: "24px"}, 50);
    $(this).children("i").stop(true).animate({top: "3px"}, 50)
});
$(".sl_ext a:nth-child(2)").hover(function () {
    $(this).children("span").stop(true).animate({top: "-1px"}, 100);
    $(this).children("i").stop(true).animate({top: "-14px"}, 100).css({display: "none"})
}, function () {
    $(this).children("span").stop(true).animate({top: "14px"}, 100);
    $(this).children("i").stop(true).animate({top: "-1px"}, 100).css({display: "block"})
});
$('.tab_im img').hover(function () {
    var a = $(this).prop('src');
    var index = $(this).parents('li').index();
    $(this).parents('li').css('border', '2px solid red').siblings('li').css('border', '1px solid #ccc');
    $(this).parents('ul').prev().find('img').prop('src', a);
    $(this).parents('ul').siblings('.tab_JE').find('a').eq(index).css('display', 'block').siblings('a').css('display', 'none');
    $(this).parents('ul').siblings('.tab_R').find('span').eq(index).css('display', 'block').siblings('span').css('display', 'none')
});

$(".JD_ipone_one").hover(function () {
    $(this).children("div").css({display: "block"})
}, function () {
    $(this).children("div").css({display: "none"})
});

$("#tab>li").click(function () {
    var i = $(this).index();
    $("#container>div").hide().eq(i).show()
});
$(".dizhi_show").hover(function () {
    $(".dizhi_con").css({display: "block"})
}, function () {
    $(".dizhi_con").css({display: "none"})
});
$(".dizhi_con").hover(function () {
    $(this).css({display: "block"})
}, function () {
    $(this).css({display: "none"})
});
//显示隐藏
var $li = $(".JD_nav_logo>div:gt(3)").hide();
$('.JD_show span').click(function () {
    if ($li.is(':hidden')) {
        $li.show();
        $(this).css({width: "86px"}).text('收起 ^');
    } else {
        $li.hide();
        $('.JD_show span').css({width: "291px"}).text('更多选项（ CPU核数、网络、机身颜色 等）');
    }
    return false;
});


$(".rig_tab>div").hover(function () {
    var i = $(this).index();
    $(this).find('.ico').css({display: 'block'}).stop(true).animate({top: "190px"}, 300)
}, function () {
    var i = $(this).index();
    $(this).find('.ico').css({display: 'none'}).stop(true).animate({top: "230px"})
});

$('.header_main_left>ul>li').hover(function () {
    $(this).css({
        background: "#f0f0f0"
    }).find('.header_main_left_main').stop(true).fadeIn(300)
}, function () {
    $(this).css({
        background: "#fff"
    }).find(".header_main_left_a").css({
        color: "#000"
    });
    $(this).find('.header_main_left_main').stop(true).fadeOut(100)
});
$(".header_sj a").hover(function () {
    $(this).css({
        background: "#444"
    })
}, function () {
    $(this).css({
        background: "#6e6568"
    })
});


$(".nav_li1 a").hover(function () {
    $(".header_main_left").stop(true).fadeIn()
}, function () {
    $(".header_main_left").stop(true).fadeOut()
});
$(".header_main_left").hover(function () {
    $(this).stop(true).fadeIn()
}, function () {
    $(this).stop(true).fadeOut()
});


//右侧侧边栏
$(".header_bar_box ul li").hover(function () {
    $(this).css({
        background: "#7A6E6E"
    }).children(".div").css({
        display: "block"
    }).stop(true).animate({
        left: "-60px"
    }, 300)
}, function () {
    $(this).css({
        background: "#7A6E6E"
    }).children(".div").css({
        display: "none"
    }).stop(true).animate({
        left: "0"
    }, 300)
});


//底部
$(".footer_foot .p1 a").hover(function () {
    $(this).css("color", "#D70B1C")
}, function () {
    $(this).css("color", "#727272")
});

$(".footer .footer_center ol li a").hover(function () {
    $(this).css("color", "#D70B1C")
}, function () {
    $(this).css("color", "#727272")
})

function searchProduct(name, value) {
    location.href = replaceAndAddParamVal(location.href, name, value, true);
}

function searchByKeyword() {
    searchProduct("keyword", $("#keyword_input").val());
}

$(".page_a").click(function () {
    var pn = $(this).attr("pn");
    var href = location.href;
    if (href.indexOf("pageNum") != -1) {
        // 路劲包含这个就进行替换
        location.href = replaceAndAddParamVal(href, "pageNum", pn);
    } else {
        location.href = location.href + "&pageNum=" + pn;
    }
    return false;
})

function replaceAndAddParamVal(url, paramName, replaceVal, forceAdd) {
    var oUrl = url.toString();
    // 有pageNum参数就是替换  否则就是添加
    var nUrl = "";
    if (oUrl.indexOf(paramName) != -1) {
        if (forceAdd) {
            if (oUrl.indexOf("?") != -1) {
                nUrl = oUrl + "&" + paramName + "=" + replaceVal;
            } else {
                nUrl = oUrl + "?" + paramName + "=" + replaceVal;
            }
        } else {
            //  /(skuPrice=)([^&]*)/gi
            var re = eval('/(' + paramName + '=)([^&]*)/gi');
            var nUrl = oUrl.replace(re, paramName + '=' + replaceVal);
        }
    } else {
        if (oUrl.indexOf("?") != -1) {
            nUrl = oUrl + "&" + paramName + "=" + replaceVal;
        } else {
            nUrl = oUrl + "?" + paramName + "=" + replaceVal;
        }
    }
    return nUrl;
}

$(".sort_a").click(function () {
    // 改变样式
    // changeStyle(this);
    $(this).toggleClass("desc")
    // 跳转到指定位置
    var sort = $(this).attr("sort");
    sort = $(this).hasClass("desc") ? sort + "_desc" : sort + "_asc";
    location.href = replaceAndAddParamVal(location.href, "sort", sort);
    return false;
})

// 当点击的时候改变按钮样式
function changeStyle(ele) {
    // 默认样式 color: #333;border-color:#ccc;background: #FFF
    // 高亮样式 color: #FFF;border-color:#e4393c;background: #e4393c
    // 1.清空之前元素的样式 改变当前被点击的元素变成被选中状态
    $(".sort_a").css({"color": "#333", "border-color": "#ccc", "background": "#FFF"})
    // 去掉兄弟元素的标志
    $(".sort_a").each(function () {
        var text = $(this).text().replace("↓", "").replace("↑", "");
        $(this).text(text);
    })
    $(ele).css({"color": "#FFF", "border-color": "#e4393c", "background": "#e4393c"})
    // 2.改变升降序 被点击自动加上 desc的样式 再次点击就会取消
    var text = $(ele).text().replace("↓", "").replace("↑", "");
    $(ele).toggleClass("desc")
    if ($(ele).hasClass("desc")) {
        // 降序
        text = text + "↓";
    } else {
        text = text + "↑";
    }
    $(ele).text(text);
}

$("#skuPriceSearchBtn").click(function () {
    // 1.拼上价格区间
    var from = $("#skuPriceFrom").val();
    var to = $("#skuPriceTo").val();

    var query = from + "_" + to;

    location.href = replaceAndAddParamVal(location.href, "skuPrice", query);
})

$("#showHasStock").change(function () {
    // 如果是 true 选择有库存的
    if ($(this).prop('checked')) {
        location.href = replaceAndAddParamVal(location.href, "hasStock", 1)
    } else {
        // 没选中的状态
        var re = eval('/(hasStock=)([^&]*)/gi');
        location.href = (location.href + "").replace(re, '');
    }
    return false;
})
