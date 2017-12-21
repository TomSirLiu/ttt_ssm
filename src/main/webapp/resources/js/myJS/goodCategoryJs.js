/**
 * @Author sirLiu
 * @Date 2017/12/3 16:35
 */

$(function () {
    $.get(
        "/ttt_ssm/goodCategory/getAllGoodCategories",
        function (data) {
            data =  JSON.parse(data);
            console.log(data);
        }
    );
});