/**
 * @Author sirLiu
 * @Date 2017/12/3 16:24
 */

//获取当前网址，如： http://localhost:8080/chenThree/jspPage/pages/projectImplementation.html
var curWwwPath = window.document.location.href;
//获取主机地址之后的目录如：/chenThree/jspPage/pages/projectImplementation.html
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
//获取主机地址，如： http://localhost:8080/chenThree
var localhostPath = curWwwPath.substring(0, pos);
//获取带"/"的项目名，如：/chenThree
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

$(function () {
    $.get(
        "/ttt_ssm/good/getAllGoods",
        function (data) {
            data = JSON.parse(data);
            console.log(data.goodCategories);
        }
    );
});

function goodDetail(goodId, categoryName) {
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
            $("#pro-tab1").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + ".jpg");
            $("#pic11 img").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + ".jpg");
            $("#pro-tab2").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + "1.jpg");
            $("#pic12 img").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + "1.jpg");
            $("#pro-tab3").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + "2.jpg");
            $("#pic13 img").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + "2.jpg");
            $("#pro-tab4").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + "3.jpg");
            $("#pic14 img").attr("src", projectName + "/resources/img/singlepro/" + categoryName + "/" + data.good.id + "3.jpg");
        }
    );
    // $("#myModal").modal('show');
}

function addCart(goodId, goodAmount) {
    $.get(
        "/ttt_ssm/good/selectGoodByGoodId",
        {
            goodId: goodId
        },
        function (data) {
            var good = JSON.parse(data).good;
            var content = '<div class="media header-middle-checkout" id="cart'+good.id+'">\n' +
                '                                <div class="media-left check-img">\n' +
                '                                    <a href="#"><img src="' + projectName + '/resources/img/cart/' + good.category.name + '/' + good.id + '.jpg"\n' +
                '                                                     alt=""/></a>\n' +
                '                                </div>\n' +
                '                                <div class="media-body checkout-content">\n' +
                '                                    <h4 class="media-heading">\n' +
                '                                        <span class="cart-count">' + goodAmount + 'x</span>\n' +
                '                                        <a href="#">' + good.name + '</a>\n' +
                '                                        <span class="btn-remove checkout-remove"\n' +
                '                                              title="remove this product from my cart" onclick="removeCart('+goodId+')"><i class="fa fa-times"\n' +
                '                                                                                          aria-hidden="true"></i></span>\n' +
                '                                    </h4>\n' +
                '                                    <p><fmt:formatNumber value="5" type="currency" pattern="£.00"/></p>\n' +
                '                                </div>\n' +
                '                            </div>';
            $("#cart-content").prepend(content);
        }
    );
}

function  removeCart(cartId) {
    $("#cart"+cartId).remove();
}