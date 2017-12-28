/**
 * @Author sirLiu
 * @Date 2017/12/24 11:00
 */

var goods;
var sizeOfEachPage = 12;
var currentPage = 1;

$(function () {
    $.get(
        "/ttt_ssm/goodCategory/getAllGoodCategories",
        function (data) {
            var goodCategories = JSON.parse(data).goodCategories;
            $.each(goodCategories, function (i, goodCategory) {
                var content = '<li> <span class="checkit"> <input class="checkbox" type="checkbox"/> </span> <label class="check-label"> <a href="javascript:;">' + goodCategory.name + '</a> </label></li>';
                $("#ulForCategories").append(content);
            });
        }
    );
    $.get({
            url: "/ttt_ssm/good/getAllGoods",
            async: false,
            success: function (data) {
                data = JSON.parse(data);
                console.log(data);
                goods = data.goods;
            }
        }
    );
    quantityOfGoodsPage(sizeOfEachPage);
    showGoodsInView(currentPage, sizeOfEachPage);
});

/**
 * 商品显示过滤条件
 */
function goodFilter() {
    //过滤参数
    var goodFilterData = {};
    //过滤详细参数
    var selectedCategories = [];
    var goodPriceRanges;
    var selectedGoodIfNew = null;
    var selectedGoodIfDiscount = null;
    var selectedGoodIfStockOver100 = null;
    //商品类别过滤
    $("#ulForCategories").find("input:checked").parents("li").find("a").each(function (index, object) {
        selectedCategories.push($(object).text());
    });
    if (selectedCategories.length !== 0) {
        goodFilterData.goodCategories = selectedCategories.join(",");
    }
    //商品价格区间过滤
    var selectedGoodRangesTemp = $("#amount").val().match(/^£(\d+)\s-\s£(\d+)/);
    goodPriceRanges = (selectedGoodRangesTemp[1] + "," + selectedGoodRangesTemp[2]);
    goodFilterData.goodPriceRange = goodPriceRanges;
    //商品是否为新品 过滤
    if ($("#ulForGoodIfNew").find("input:checked").parents("li").find("a").length === 1) {
        var temp = $("#ulForGoodIfNew").find("input:checked").parents("li").find("a").text();
        if (temp === "yes") {
            selectedGoodIfNew = true;
        } else {
            selectedGoodIfNew = false;
        }
        goodFilterData.goodIfNew = selectedGoodIfNew;
    }
    //商品是否为折扣商品 过滤
    if ($("#ulForGoodIfDiscount").find("input:checked").parents("li").find("a").length === 1) {
        var temp = $("#ulForGoodIfDiscount").find("input:checked").parents("li").find("a").text();
        if (temp === "yes") {
            selectedGoodIfDiscount = true;
        } else {
            selectedGoodIfDiscount = false;
        }
        goodFilterData.goodIfDiscount = selectedGoodIfDiscount;
    }
    //商品库存是否超过100 过滤
    if ($("#ulForGoodIfOver100").find("input:checked").parents("li").find("a").length === 1) {
        var temp = $("#ulForGoodIfDiscount").find("input:checked").parents("li").find("a").text();
        if (temp === "more than 100") {
            selectedGoodIfStockOver100 = true;
        } else if (temp === "less than 100") {
            selectedGoodIfStockOver100 = false;
        }
        goodFilterData.goodStockDivisionWith100 = selectedGoodIfStockOver100;
    }

    $.get({
            contentType: "application/json",
            url: "/ttt_ssm/good/getGoodsWithFilter",
            data: {
                goodCategories: goodFilterData["goodCategories"],
                goodPriceRange: goodFilterData.goodPriceRange,
                goodIfNew: goodFilterData.goodIfNew,
                goodIfDiscount: goodFilterData.goodIfDiscount,
                goodStockDivisionWith100: goodFilterData.goodStockDivisionWith100
            },
            success: function (data) {
                goods = JSON.parse(data).selectedGoods;
                console.log(JSON.parse(data));
                quantityOfGoodsPage(sizeOfEachPage);
                showGoodsInView(currentPage, sizeOfEachPage);
            }
        }
    );
    // }
}

/**
 * 显示右上角的页面切换
 * @param size
 */
function quantityOfGoodsPage(size) {
    $("#ulForGoodsPage").html("");
    const index = parseInt(goods.length / size) + 1;
    if (currentPage > index) {
        currentPage = index;
    }
    for (var i = index; i > 0; i--) {
        var content;
        if (i === 1) {
            content = '<li class="active"> <a href="javascript:;" onclick="showGoodsInView(1,' + size + ')">' + i + '</a></li>';
        } else {
            content = '<li> <a href="javascript:;" onclick="showGoodsInView(' + i + ',' + size + ')">' + i + '</a></li>';
        }
        $("#ulForGoodsPage").prepend(content);
    }
    var lastContent = '<li> <a onclick="showGoodsInView(' + index + ',' + size + ')">' + '\>' + '</a></li>';
    $("#ulForGoodsPage").append(lastContent);
}

/**
 * 切换页面
 * @param page
 * @param size
 */
function showGoodsInView(page, size) {
    currentPage = page;
    $("#ulForGoodsPage li").removeClass("active");
    $("#ulForGoodsPage li:nth-child(" + page + ")").addClass("active");

    //格子形式展示-- start
    $("#gried_view").html("");
    for (const index in goods) {
        if (index > (page - 1) * size && index <= page * size) {
            var good = goods[index];
            var content = '<div class="col-md-4 col-sm-6 col-xs-12 top-mar" style="height: 480px">' +
                ' <div class="single-product">' +
                ' <div class="single-product-img"> ' +
                '<a href="javascript:;"><img src="' + projectName + '/resources/img/singlepro/' + good.category.name + '/' + good.id + '.jpg" alt=""/></a>';
            if (good.ifNew) {
                content += '<span class="new-box"> <span class="new">New</span> </span>';
            }
            if (good.ifDiscount) {
                content += '<span class="sale-box"> <span class="sale">Sale</span> </span>'
            }
            content += '</div> <div class="single-product-content"> <div class="product-title">' +
                ' <h5> <a href="javascript:;">' + good.name + '</a> </h5> </div> <div class="rating"> <div class="star star-on"></div> <div class="star star-on"></div>' +
                ' <div class="star star-on"></div> <div class="star star-on"></div> <div class="star star-on"></div> </div> <div class="price-box"> ' +
                '<span class="price">£' + good.price.toFixed(2) + '</span> <span class="old-price">£' + (good.price * 1.2).toFixed(2) + '</span> </div> <div class="product-action"> ' +
                '<button class="button btn btn-default add-cart"title="add to cart" onclick="addCart(' + good.id + ',1,false)">Add to cart </button> ' +
                '<a class="add-wishlist" href="javascript:;" title="add to wishlist"> ' +
                '<i class="fa fa-heart"></i> </a> ' +
                '<a class="quick-view" href="javascript:;" title="quick view" data-toggle="modal" data-target="#myModal" onclick="goodDetail(' + good.id + ')"> ' +
                '<i class="fa fa-search"></i> </a> </div> </div> </div></div> ';
            $("#gried_view").append(content);
        }
    }
    //--格子形式展示 end

    //列表形式展示-- start
    $("#list_view .row").html("");
    for (const index in goods) {
        if (index > (page - 1) * size && index <= page * size) {
            var good = goods[index];
            var temp = '                                                    <div class="col-md-12 col-sm-12 col-xs-12">\n' +
                '                                                        <div class="col-md-4 col-sm-4 col-xs-12">\n' +
                '                                                            <!-- single-product-start -->\n' +
                '                                                            <div class="single-product">\n' +
                '                                                                <div class="single-product-img">\n' +
                '                                                                    <a href="javascript:;">\n' +
                '                                                                        <img src="' + projectName + '/resources/img/singlepro/' + good.category.name + '/' + good.id + '.jpg"\n' +
                '                                                                             alt=""/>\n' +
                '                                                                    </a>';
            if (good.ifNew) {
                temp += '<span class="new-box"> <span class="new">New</span> </span>';
            }
            if (good.ifDiscount) {
                temp += '<span class="sale-box"> <span class="sale">Sale</span> </span>'
            }
            temp += '                                                                </div>\n' +
                '                                                            </div>\n' +
                '                                                            <!-- single-product-end -->\n' +
                '                                                        </div>\n' +
                '                                                        <div class="col-md-8 col-sm-8 col-xs-12">\n' +
                '                                                            <!-- single-product-start -->\n' +
                '                                                            <div class="single-product">\n' +
                '                                                                <div class="single-product-content">\n' +
                '                                                                    <div class="product-title">\n' +
                '                                                                        <h5>\n' +
                '                                                                            <a href="javascript:;">' + good.name + '</a>\n' +
                '                                                                        </h5>\n' +
                '                                                                    </div>\n' +
                '                                                                    <div class="rating">\n' +
                '                                                                        <div class="star star-on"></div>\n' +
                '                                                                        <div class="star star-on"></div>\n' +
                '                                                                        <div class="star star-on"></div>\n' +
                '                                                                        <div class="star star-on"></div>\n' +
                '                                                                        <div class="star star-on"></div>\n' +
                '                                                                    </div>\n' +
                '                                                                    <div class="price-box">\n' +
                '                                                                        <span class="price">£' + good.price.toFixed(2) + '</span>\n' +
                '                                                                        <span class="old-price">£' + (good.price * 1.2).toFixed(2) + '</span>\n' +
                '                                                                    </div>\n' +
                '                                                                    <p class="product-desc">' + good.description + '\n' +
                '                                                                    </p>\n' +
                '                                                                    <div class="product-action">\n' +
                '                                                                        <button class="button btn btn-default add-cart"\n' +
                '                                                                                title="add to cart"  onclick="addCart(' + good.id + ',1,false)">Add to cart\n' +
                '                                                                        </button>\n' +
                '                                                                        <a class="add-wishlist" href="javascript:;"\n' +
                '                                                                           title="add to wishlist">\n' +
                '                                                                            <i class="fa fa-heart"></i>\n' +
                '                                                                        </a>\n' +
                '                                                                        <a class="quick-view" href="javascript:;"\n' +
                '                                                                           title="quick view" data-toggle="modal"\n' +
                '                                                                           data-target="#myModal"  onclick="goodDetail(' + good.id + ')">\n' +
                '                                                                            <i class="fa fa-search"></i>\n' +
                '                                                                        </a>\n' +
                '                                                                    </div>\n' +
                '                                                                    <div class="availability">\n' +
                '                                                                        <span>In stock</span>\n' +
                '                                                                    </div>\n' +
                '                                                                </div>\n' +
                '                                                            </div>\n' +
                '                                                            <!-- single-product-end -->\n' +
                '                                                        </div>\n' +
                '                                                    </div>';
            $("#list_view .row").append(temp);
        }
    }
    //--列表形式展示 end
}

/**
 * 切换每页显示的内容个数
 */
$('#selectSizeOfEachPage').on('change', function (e) {
    var size = $("option:selected", this).val();
    sizeOfEachPage = size;
    quantityOfGoodsPage(sizeOfEachPage);
    showGoodsInView(currentPage, sizeOfEachPage);
});

/**
 * 根据商品名称模糊查询
 */
function selectGoodsWithFuzzyGoodName() {
    var fuzzyGoodName = $("#fuzzyGoodName").val();
    $.get({
        url: "/ttt_ssm/good/fuzzyQueryOfGoodsWithGoodName",
        data: {fuzzyGoodName: fuzzyGoodName},
        success: function (data) {
            console.log(JSON.parse(data));
            goods = JSON.parse(data).goodsWithFuzzyGoodName;
            quantityOfGoodsPage(sizeOfEachPage);
            showGoodsInView(currentPage, sizeOfEachPage);
        }
    });
}

$("#selectOrderBy").on('change',function () {
    var type = $("option:selected", this).val();
    console.log(type);
    goodOrderByPriceLowerFirst();
    if(type==="goodOrderByPriceLowerFirst"){
        goods.sort(function (goodA,goodB) {
            return goodA.price-goodB.price;
        });
    }else if(type==="goodOrderByPriceHigherFirst"){
        goods.sort(function (goodA,goodB) {
            return goodB.price-goodA.price;
        });
    }else if(type==="goodOrderByGoodNameFromAToZ"){
        goods.sort(function (goodA,goodB) {
            return goodA.name-goodB.name;
        });
    }else if(type==="goodOrderByGoodNameFromZToA"){
        goods.sort(function (goodA,goodB) {
            return goodB.name-goodA.name;
        });
    }else if(type==="goodOrderByStockMost"){
        goods.sort(function (goodA,goodB) {
            return goodB.stock-goodA.stock;
        });
    }else if(type==="goodOrderByGoodId"){
        goods.sort(function (goodA,goodB) {
            return goodA.id-goodB.id;
        });
    }
    quantityOfGoodsPage(sizeOfEachPage);
    showGoodsInView(currentPage, sizeOfEachPage);
});

/**
 * 价格低的商品优先显示
 */
function goodOrderByPriceLowerFirst() {
    // var resultGoods = [];
    // for(var i=0;i<goods.length;i++){
    //     for (var j=0;j<goods.length;j++){
    //         if(goods[i].price>goods[j].price){
    //             var temp = goods[i];
    //             goods[i]=goods[j];
    //             goods[j]=temp;
    //         }
    //     }
    // }

    var test = goods;
    test.sort(function (goodA,goodB) {
        return goodA.name-goodB.name;
    });
    console.log(test);
}