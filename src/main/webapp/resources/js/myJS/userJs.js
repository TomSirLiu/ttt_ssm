/**
 * @Author sirLiu
 * @Date 2017/12/3 16:35
 */

function forMyModal3() {
    $('#myModal3').modal({backdrop: 'static', keyboard: false});
}

function registerUserFormVerify() {
    // --校验数据是否正确 BEGIN
    if ($("#registerUserName").val() === "") {
        alert("请填写用户名");
        return false;
    }
    if ($("#registerUserPassword").val() === "") {
        alert("请填写密码");
        return false;
    }
    if ($("#registerUserAddress").val() === "") {
        alert("请填写地址");
        return false;
    }
    if ($("#registerUserMobile").val() === "") {
        alert("请填写电话");
        return false;
    }
    if ($("#registerUserEmail").val() === "") {
        alert("请填写邮箱吧");
        return false;
    }
    // --校验数据是否正确 END
}

function updateUserFormVerify() {
    // --校验数据是否正确 BEGIN
    if ($("#updateUserName").val() === "") {
        alert("请填写用户名");
        return false;
    }
    if ($("#updateUserPassword").val() === "") {
        alert("请填写密码");
        return false;
    }
    if ($("#updateUserAddress").val() === "") {
        alert("请填写地址");
        return false;
    }
    if ($("#updateUserMobile").val() === "") {
        alert("请填写电话");
        return false;
    }
    if ($("#updateUserEmail").val() === "") {
        alert("请填写邮箱吧");
        return false;
    }
    // --校验数据是否正确 END
}

$(document).ready(function () {
    //判断用户是否登陆
    $.ajax({
        url: "/ttt_ssm/user/ifUserHadLogin",
        success: function (ifUserHadLogin) {
            if (!ifUserHadLogin) {
                $('#myModal2').modal({backdrop: 'static', keyboard: false});
            }
        }
    });

    //绑定注册用户的表单  $("#registerForm").submit();
    $("#registerForm").ajaxForm(function (data) {
        data = JSON.parse(data);
        if (data.code === "SUCCESS") {
            $("#confirmHint").bind("click", function () {
                window.location.reload();
            });
            var userName = $("#registerUserName").val();
            $("#myModal4 p").html("&nbsp;&nbsp;&nbsp;恭喜，&nbsp;<b>" + userName + "</b>&nbsp;!注册用户成功！将为您自动登陆!");
            $('#myModal4').modal({
                keyboard: false
            });
        } else {
            $("#confirmHint").bind("click", function () {
                $('#myModal4').modal('hide');
            });
            $("#myModal4 p").html("&nbsp;&nbsp;&nbsp;" + data.error);
            $('#myModal4').modal({
                keyboard: true
            });
        }
    });

    //绑定修改用户资料的表单
    $("#updateAccountForm").ajaxForm(function (data) {
        $('#myModal5').modal('hide');
        data = JSON.parse(data);
        if (data.code === "SUCCESS") {
            $("#confirmHint").bind("click", function () {
                window.location.reload();
            });
            var userName = $("#updateUserName").val();
            $("#myModal4 p").html("&nbsp;&nbsp;&nbsp;恭喜，&nbsp;<b>" + userName + "</b>&nbsp;!修改账户成功");
            $('#myModal4').modal({
                keyboard: false
            });
        } else {
            $("#confirmHint").bind("click", function () {
                $('#myModal4').modal('hide');
            });
            $("#myModal4 p").html("&nbsp;&nbsp;&nbsp;" + data.error);
            $('#myModal4').modal({
                keyboard: true
            });
        }
    });

});

function login() {
    $.ajax({
        type: "post",//请求方式
        url: "/ttt_ssm/user/userLogin",//发送请求地址
        data: {//发送给数据库的数据
            userName: $("#loginUserName").val(),
            userPassword: $("#loginUserPassword").val()
        },
        //请求成功后的回调函数有两个参数
        success: function (data, textStatus) {
            data = JSON.parse(data);
            if (data.code === "SUCCESS") {
                $("#confirmHint").bind("click", function () {
                    window.location.reload();
                });
                var userName = data.userName;
                if (!data.userName === "000000000") {
                    $("#myModal4 p").html("&nbsp;&nbsp;&nbsp;恭喜，&nbsp;<b>" + userName + "</b>&nbsp;!用户登陆成功！将为您自动登陆!");
                } else {
                    $("#myModal4 p").html("&nbsp;&nbsp;&nbsp;恭喜，&nbsp;<b>" + userName + "</b>&nbsp;!管理员登陆成功！将为您自动登陆!");
                }
                $('#myModal4').modal({
                    keyboard: false
                });
            } else if (data.code === "FAIL") {
                $("#myModal4 p").html("   " + data.error);
                $('#myModal4').modal({
                    keyboard: false
                });
            }
        }
    });
}

function reLoadPage() {
    $.ajax({
        type: "post",//请求方式
        url: "/ttt_ssm/user/reLogin",//发送请求地址
        data: {},
        //请求成功后的回调函数有两个参数
        success: function (data) {
            data = JSON.parse(data);
            if (data.code === "SUCCESS") {
                window.location.reload();
            }
        }
    });
}
