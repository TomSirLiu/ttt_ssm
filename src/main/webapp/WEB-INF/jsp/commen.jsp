<%--
  Created by IntelliJ IDEA.
  User: Sir_Liu
  Date: 2017/12/28
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- userLogin modal -->
<div class="modal fade" id="myModal2">
    <div class="modal-dialog" style="width:588px">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">请先登陆/注册</h3>
            </div>
            <br>
            <form class="form-horizontal">
                <input type="hidden" name="operate" value="update"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">用户名</label>
                    <div class=" col-sm-8">
                        <input class="form-control" id="loginUserName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">密码</label>
                    <div class="col-sm-8 ">
                        <input type="password" class="form-control" id="loginUserPassword">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-10">
                        <button class="btn btn-default btn-primary col-sm-offset-3" data-dismiss="modal"
                                onclick="forMyModal3()">去注册
                        </button>
                        <button type="button" class="btn btn-default btn-primary col-sm-offset-1"
                                onclick="login()">
                            登陆
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- userRegister modal -->
<div class="modal fade" id="myModal3">
    <div class="modal-dialog" style="width:588px">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">用户注册</h3>
            </div>
            <br>
            <form id="registerForm" class="form-horizontal" action="/ttt_ssm/user/userRegister">
                <%--<input type="hidden" name="userOperate" value="registerUser"/>--%>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">用户名</label>
                    <div class=" col-sm-8">
                        <input class="form-control" name="userName" id="registerUserName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">密码</label>
                    <div class="col-sm-8 ">
                        <input type="password" class="form-control" name="userPassword"
                               id="registerUserPassword">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">地址</label>
                    <div class=" col-sm-8">
                        <input class="form-control" name="userAddress" id="registerUserAddress">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">电话</label>
                    <div class=" col-sm-8">
                        <input class="form-control" onkeyup="value=value.replace(/[^\d.]/g,'')"
                               name="userMobile"
                               id="registerUserMobile">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">邮箱</label>
                    <div class=" col-sm-8">
                        <input class="form-control" name="userEmail" type="email" id="registerUserEmail">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-10">
                        <button class="btn btn-default btn-primary col-sm-offset-3"
                                onclick="registerUserFormVerify()">确定注册
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- hint modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal4">
    <div class="modal-dialog" role="document" style="width:588px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">提示</h3>
            </div>
            <div class="modal-body">
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirmHint">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- updateUser modal -->
<div class="modal fade" id="myModal5">
    <div class="modal-dialog" style="width:588px">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">用户资料修改</h3>
            </div>
            <br>
            <form id="updateAccountForm" class="form-horizontal" action="/ttt_ssm/user/userUpdateAccount">
                <%--<input type="hidden" name="userOperate" value="updateUser"/>--%>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">用户名</label>
                    <div class=" col-sm-8">
                        <input class="form-control" name="userName" id="updateUserName" readonly="true"
                               value="${sessionScope.get("user").name}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">密码</label>
                    <div class="col-sm-8 ">
                        <input type="password" class="form-control" name="userPassword" id="updateUserPassword"
                               value="${sessionScope.get("user").password}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">地址</label>
                    <div class=" col-sm-8">
                        <input class="form-control" name="userAddress" id="updateUserAddress"
                               value="${sessionScope.get("user").address}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">电话</label>
                    <div class=" col-sm-8">
                        <input class="form-control" onkeyup="value=value.replace(/[^\d.]/g,'')"
                               name="userMobile"
                               id="updateUserMobile" value="${sessionScope.get("user").mobile}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" style="font-size:17px">邮箱</label>
                    <div class=" col-sm-8">
                        <input class="form-control" name="userEmail" type="email" id="updateUserEmail"
                               value="${sessionScope.get("user").email}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-10">
                        <button class="btn btn-default btn-primary col-sm-offset-3"
                                onclick="updateUserFormVerify()">确定修改
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

