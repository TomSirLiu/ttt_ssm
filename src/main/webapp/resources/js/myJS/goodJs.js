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
});

//做goodCategory
//下次要做的是 在数据库添加商品  看能不能在页面显示出来

function goodDetail(goodId,categoryName) {
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
            //获取当前网址，如： http://localhost:8080/chenThree/jspPage/pages/projectImplementation.html
            var curWwwPath = window.document.location.href;
            //获取主机地址之后的目录如：/chenThree/jspPage/pages/projectImplementation.html
            var pathName = window.document.location.pathname;
            var pos = curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8080/chenThree
            var localhostPath = curWwwPath.substring(0, pos);
            //获取带"/"的项目名，如：/chenThree
            var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
            $("#pro-tab1").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+".jpg");
            $("#pic11 img").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+".jpg");
            $("#pro-tab2").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+"1.jpg");
            $("#pic12 img").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+"1.jpg");
            $("#pro-tab3").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+"2.jpg");
            $("#pic13 img").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+"2.jpg");
            $("#pro-tab4").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+"3.jpg");
            $("#pic14 img").attr("src",projectName+"/resources/img/singlepro/"+categoryName+"/"+data.good.id+"3.jpg");
        }
    );
    // $("#myModal").modal('show');
}