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

function quantityOfGoodsPage(size) {
    const index = parseInt(goods.length / size) + 1;
    for (let i = index; i > 0; i--) {
        let content;
        if (i === 1) {
            content = '<li class="active"> <a onclick="showGoodsInGriedView(1,' + size + ')">' + i + '</a></li>';
        } else {
            content = '<li> <a onclick="showGoodsInGriedView(' + i + ',' + size + ')">' + i + '</a></li>';
        }
        $("#ulForGoodsPage").prepend(content);
    }
}

function showGoodsInGriedView(page, size) {
    $("#ulForGoodsPage li").removeClass("active");
    $("#ulForGoodsPage li:nth-child("+page+")").addClass("active");

    $("#gried_view").html("");
    for (const index in goods) {
        if (index > (page - 1) * size && index <= page * size) {
            let good = goods[index];
            let content = '<div class="col-md-4 col-sm-6 col-xs-12 top-mar" style="height: 480px">' +
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

};


function goodDetail2(goodId) {
    $.get(
        "/ttt_ssm/good/selectGoodByGoodId",
        {
            goodId: goodId
        },
        function (data) {
            data = JSON.parse(data);
            $("#goodDetailDescription").html(data.good.description);
            $("#goodDetailPrice").html("£" + data.good.price.toFixed(2));
            $("#goodDetailOldPrice").html("£" + ((data.good.price) * 1.2).toFixed(2));
            $("#goodDetailTitle").html(data.good.name);
            $("#goodDetailAddToCartButton").bind("click", function () {
                addCart(data.good.id, $("#goodDetailQuantity").val(), false);
                $("#myModal").modal('hide');
            });
            $("#pro-tab1").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + ".jpg");
            $("#pic11 img").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + ".jpg");
            $("#pro-tab2").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + "1.jpg");
            $("#pic12 img").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + "1.jpg");
            $("#pro-tab3").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + "2.jpg");
            $("#pic13 img").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + "2.jpg");
            $("#pro-tab4").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + "3.jpg");
            $("#pic14 img").attr("src", projectName + "/resources/img/singlepro/" + data.good.category.name + "/" + data.good.id + "3.jpg");
        }
    );
}