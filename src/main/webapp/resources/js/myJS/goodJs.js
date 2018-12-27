/**
 * @Author sirLiu
 * @Date 2017/12/3 16:24
 */

$(function () {
    $.get(
        "/ttt_ssm/good/getAllGoods",
        function (data) {
            data = JSON.parse(data);
            console.log(data);
        }
    );
    if (window.sessionStorage.getItem("goodIdAndGoodQuantityMap") !== null && window.sessionStorage.getItem("goodIdAndGoodQuantityMap") !== "") {
        goodIdAndGoodQuantityMap = window.sessionStorage.getItem("goodIdAndGoodQuantityMap").split(",");
        for (var i = 0; i < goodIdAndGoodQuantityMap.length; i++) {
            var cart = goodIdAndGoodQuantityMap[i];
            var temp = cart.split("&&");
            addCart(temp[0], temp[1], true);
        }
    }

    //绑定添加或删除商品的表单
    $("#addOrDeleteGoodForm").ajaxForm(function (data) {
        data = JSON.parse(data);
        if (data.code === "SUCCESS") {
            alert(data.message);
            window.location=location;
        } else {
            alert("出错了！");
            window.location=location;
        }
    });

    //绑定删除商品的表单
    $("#deleteGoodByNameForm").ajaxForm(function (data) {
        data = JSON.parse(data);
        if (data.code === "SUCCESS") {
            alert("删除商品成功！");
            window.location=location;
        } else {
            alert("没有该商品！");
            window.location=location;
        }
    });

});

function goodDetail(goodId) {
    $.get(
        "/ttt_ssm/good/selectGoodByGoodId",
        {
            goodId: goodId
        },
        function (data) {
            data = JSON.parse(data);
            $("#goodDetailDescription").html(data.good.description);
            $("#goodDetailStock").html("库存 ："+data.good.stock);
            $("#goodDetailPrice").html("£" + data.good.price.toFixed(2));
            $("#goodDetailOldPrice").html("£" + ((data.good.price) * 1.2).toFixed(2));
            $("#goodDetailTitle").html(data.good.name);
            $("#goodDetailAddToCartButton").one("click", function () {
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

var itemsQuantityInCart = 0;
var totalAmount = 0;
var goodIdAndGoodQuantityMap = [];

/**
 * session也要存进购物车的数据
 * @param goodId
 * @param goodQuantity
 */
function addCart(goodId, goodQuantity, ifFirst) {
    $.get(
        "/ttt_ssm/good/selectGoodByGoodId",
        {
            goodId: goodId
        },
        function (data) {
            var good = JSON.parse(data).good;
            var cartId = parseInt(Math.random() * 1000);
            var content = '<div class="media header-middle-checkout" id="cart' + cartId + '">\n' +
                '                                <div class="media-left check-img">\n' +
                '                                    <a href="javascript:;"><img src="' + projectName + '/resources/img/cart/' + good.category.name + '/' + good.id + '.jpg"\n' +
                '                                                     alt=""/></a>\n' +
                '                                </div>\n' +
                '                                <div class="media-body checkout-content">\n' +
                '                                    <h4 class="media-heading">\n' +
                '                                        <span class="cart-count">' + goodQuantity + 'x</span>\n' +
                '                                        <a href="javascript:;">' + good.name + '</a>\n' +
                '                                        <span class="btn-remove checkout-remove"\n' +
                '                                              title="remove this product from my cart" onclick="removeCart(' + cartId + ',' + goodId + ',' + good.price + ',' + goodQuantity + ')"><i class="fa fa-times"\n' +
                '                                                                                          aria-hidden="true"></i></span>\n' +
                '                                    </h4>\n' +
                '                                    <p>£' + (good.price * goodQuantity).toFixed(2) + ' </p>\n' +
                '                                </div>\n' +
                '                            </div>';
            $("#cart-content").prepend(content);
            itemsQuantityInCart++;
            totalAmount += good.price * goodQuantity;
            $("#conditionInCart").html(itemsQuantityInCart + " item(s) - £" + totalAmount.toFixed(2));
            $("#cartTotalAmountB").html("£ " + totalAmount.toFixed(2));
            if (!ifFirst) {
                goodIdAndGoodQuantityMap.push(goodId + "&&" + goodQuantity);
            }
            window.sessionStorage.setItem("goodIdAndGoodQuantityMap", goodIdAndGoodQuantityMap);
        }
    );
}

function removeCart(cartId, goodId, goodPrice, goodQuantity) {
    $("#cart" + cartId).remove();
    itemsQuantityInCart--;
    totalAmount -= (goodPrice * goodQuantity);
    $("#conditionInCart").html(itemsQuantityInCart + " item(s) - £" + totalAmount.toFixed(2));
    $("#cartTotalAmountB").html("£ " + totalAmount.toFixed(2));
    goodIdAndGoodQuantityMap.splice($.inArray(goodId + "&&" + goodQuantity, goodIdAndGoodQuantityMap), 1);
    window.sessionStorage.setItem("goodIdAndGoodQuantityMap", goodIdAndGoodQuantityMap);
}

function addGoodFormVerify() {
    // --校验数据是否正确 BEGIN
    $('#addGoodForm').each(function(){
        $(this).submit(function(e){
            e.preventDefault();
            alert('it is working!');
            return  false;
        })
    })
    if ($("#exampleFormControlFile1").val() === "") {
        alert("请上传商品图片");
        return false;
    }
    if ($("#addName").val() === "") {
        alert("您还没有添加商品名称");
        // $("#addGoodForm").submit(function(e){
        //     alert('submit intercepted');
        //     e.preventDefault(e);
        // });
    }
    if ($("#addCategory").val() === "") {
        alert("您还没有添加商品类别");
        return false;
    }
    if ($("#addPrice").val() === "") {
        alert("您还没有添加商品价格");
        return false;
    }
    if ($("#addGoodDscribe").val() === "") {
        alert("您还没有添加商品描述");
        return false;
    }
    // --校验数据是否正确 END
}


