/**
 * @Author sirLiu
 * @Date 2017/12/24 11:00
 */

var goods;

$(function () {
    $.get(
        "/ttt_ssm/goodCategory/getAllGoodCategories",
        function (data) {
            var goodCategories = JSON.parse(data).goodCategories;
            $.each(goodCategories, function (i, goodCategory) {
                var content = '<li> <span class="checkit"> <input class="checkbox" type="checkbox"/> </span> <label class="check-label"> <a href="#">' + goodCategory.name + '</a> </label></li>';
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
    quantityOfGoodsPage(12);
    showGoodsInGriedView(1, 12);
});

function goodFilter() {
    var selectedCategories = [];
    $("#ulForCategories").find("input:checked").parents("li").find("a").each(function (index, object) {
        selectedCategories.push($(object).text());
    });
    console.log(selectedCategories.join(","));
    $.get({
            contentType: "application/json",
            url: "/ttt_ssm/good/getGoodsFilterByGoodCategories",
            data:{goodCategories: selectedCategories.join(",")},
            success: function (data) {
                data = JSON.parse(data);
                console.log(data);
            }
        }
    );
}

function quantityOfGoodsPage(size) {
    $("#ulForGoodsPage").html("");
    const index = parseInt(goods.length / size) + 1;
    for (var i = index; i > 0; i--) {
        var content;
        if (i === 1) {
            content = '<li class="active"> <a onclick="showGoodsInGriedView(1,' + size + ')">' + i + '</a></li>';
        } else {
            content = '<li> <a onclick="showGoodsInGriedView(' + i + ',' + size + ')">' + i + '</a></li>';
        }
        $("#ulForGoodsPage").prepend(content);
    }
    var lastContent = '<li> <a onclick="showGoodsInGriedView(' + index + ',' + size + ')">' + '\>' + '</a></li>';
    $("#ulForGoodsPage").append(lastContent);
}

function showGoodsInGriedView(page, size) {
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
                '<a href="#"><img src="' + projectName + '/resources/img/singlepro/' + good.category.name + '/' + good.id + '.jpg" alt=""/></a>';
            if (good.ifNew) {
                content += '<span class="new-box"> <span class="new">New</span> </span>';
            }
            if (good.ifDiscount) {
                content += '<span class="sale-box"> <span class="sale">Sale</span> </span>'
            }
            content += '</div> <div class="single-product-content"> <div class="product-title">' +
                ' <h5> <a href="#">' + good.name + '</a> </h5> </div> <div class="rating"> <div class="star star-on"></div> <div class="star star-on"></div>' +
                ' <div class="star star-on"></div> <div class="star star-on"></div> <div class="star star-on"></div> </div> <div class="price-box"> ' +
                '<span class="price">£' + good.price.toFixed(2) + '</span> <span class="old-price">£' + (good.price * 1.2).toFixed(2) + '</span> </div> <div class="product-action"> ' +
                '<button class="button btn btn-default add-cart"title="add to cart" onclick="addCart(' + good.id + ',1,false)">Add to cart </button> ' +
                '<a class="add-wishlist" href="#" title="add to wishlist"> ' +
                '<i class="fa fa-heart"></i> </a> ' +
                '<a class="quick-view" href="#" title="quick view" data-toggle="modal" data-target="#myModal" onclick="goodDetail(' + good.id + ')"> ' +
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
                '                                                                    <a href="#">\n' +
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
                '                                                                            <a href="#">' + good.name + '</a>\n' +
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
                '                                                                        <a class="add-wishlist" href="#"\n' +
                '                                                                           title="add to wishlist">\n' +
                '                                                                            <i class="fa fa-heart"></i>\n' +
                '                                                                        </a>\n' +
                '                                                                        <a class="quick-view" href="#"\n' +
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


$('#selectSizeOfEachPage').on('change', function (e) {
    var size = $("option:selected", this).val();
    quantityOfGoodsPage(size);
    showGoodsInGriedView(1, size);
});