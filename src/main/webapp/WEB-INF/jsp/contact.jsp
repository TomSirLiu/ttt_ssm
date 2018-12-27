<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <title>Contact</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />

    <!-- Mobile Specific Meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"/>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/style.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="contact">


<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- header-start -->
<header>
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-xs-12 col-sm-12">
                    <div class="header-top-left">
                        <div class="welcome-msg">
                                    <span class="default-msg hidden-xs">
                                        Default welcome msg!
                                    </span>
                            <span class="phone">
                                        Call support free: <span class="number">01234-567890</span>
                                    </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xs-12 col-sm-12">
                    <div class="header-top-right">
                        <ul class="header-links hidden-xs">
                            <li><a class="my-account" href="javascript:;" id="modifyAccount" data-toggle="modal"
                                   data-target="#myModal5">我的账户</a></li>
                            <li><a class="my-wishlist" href="javascript:;">My Wishlist</a></li>
                            <li><a class="login" href="javascript:;">${sessionScope.user==null?'登陆/注册':user.name}</a>
                            </li>
                        </ul>
                        <div class="currency language">
                            <div class="current">
                                <span>Dollar</span>
                            </div>
                            <ul class="lang">
                                <li class="selected">
                                    <span class="dollar">Dollar</span>
                                </li>
                                <li>
                                    <a href="javascript:;" title="">
                                        <span class="euro">Euro</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" title="">
                                        <span class="sheqel">Sheqel</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="language">
                            <div class="current">
                                <span>English</span>
                            </div>
                            <ul class="lang">
                                <li class="selected">
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/1.jpg" alt="en"/>
                                    <span>English</span>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/2.jpg" alt="ar"/>
                                    <a href="javascript:;" title="">
                                        <span>اللغة العربية</span>
                                    </a>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/7.jpg" alt="hb"/>
                                    <a href="javascript:;" title="">
                                        <span>עִברִית</span>
                                    </a>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/3.jpg" alt="es"/>
                                    <a href="javascript:;" title="">
                                        <span>Español</span>
                                    </a>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/4.jpg" alt="ph"/>
                                    <a href="javascript:;" title="">
                                        <span>Pilipino</span>
                                    </a>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/5.jpg" alt="fr"/>
                                    <a href="javascript:;" title="">
                                        <span>français</span>
                                    </a>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/resources/img/lang/6.jpg" alt="sd"/>
                                    <a href="javascript:;" title="">
                                        <span>svensk</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-middle">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12 col-xs-8">
                    <div class="logo">
                        <a href="index.html">
                            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""/>
                        </a>
                    </div>
                </div>
                <div class="col-md-5 col-sm-6 hidden-xs">
                    <div class="search-box">
                        <form action="#">
                            <input class="form-control search-form" type="text" placeholder="Search entire store here"/>
                            <button class="search-button" value="Search" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-md-3 col-xs-4 col-sm-6">
                    <div class="shopping-cart">
                        <a class="cart" href="javascript:;" title="view shopping cart"><span class="hidden-xs">shopping cart <br><small
                                id="conditionInCart">0 item(s) - £0.00</small></span></a>
                        <div class="top-cart-content" id="cart-content">
                            <%--   --%>

                            <div class="cart-total">
                                <span>Total</span>
                                <span><b id="cartTotalAmountB">£ 0.00</b></span>
                            </div>
                            <div class="checkout">
                                <a href="javascript:;"><span>checkout<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-menu-area hidden-xs hidden-sm">
        <div class="container">
            <div class="row">
                <div class="colo-md-12">
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/user/entry">Home</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/about">About</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/shop">Shop</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/contact">contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- mobile-menu-area-start -->
    <div class="mobile-menu-area visible-xs visible-sm">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mobile_menu">
                        <nav id="mobile_menu_active">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="shop.jsp">MyShop</a></li>
                                <li><a href="contact.jsp">contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- mobile-menu-area-end -->
</header>
<!-- header-end -->
<!-- heading-banner-start -->
<div class="heading-banner contact-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="breadcrumb">
                    <a title="Return to Home" href="${pageContext.request.contextPath}/user/entry">
                        <i class="icon-home"></i>
                    </a>
                    <span class="navigation-pipe">></span>
                    <span class="navigation-page">
                                Contact
                            </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- heading-banner-end -->
<!-- contact-area-start -->
<div class="contact-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="contact-form wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <h3>
                        <i class="fa fa-comment-o"></i>
                        Add or Delete Good
                    </h3>
                    <div class="row">
                        <form enctype="multipart/form-data" data-ajax="false" id="addOrDeleteGoodForm" action="/ttt_ssm/good/addOrDeleteGood" method="post">
                            <div class="form-group">
                                <label for="goodImage">请上传商品图片</label>
                                <input type="file" class="file" id="goodImage" name="goodImage" >
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">商品名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Name...">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="category" class="col-sm-2 col-form-label">商品类别</label>
                                <div class="col-sm-10">
                                    <select id="category" name="category" class="form-control">
                                        <option selected>digital_product</option>
                                        <option>clothes</option>
                                        <option>toys</option>
                                        <option>furniture</option>
                                        <option>books</option>
                                        <option>others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="price" class="col-sm-2 col-form-label">商品价格</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="price" name="price" placeholder="Price...">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="stock" class="col-sm-2 col-form-label">商品库存</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="stock" name="stock" placeholder="Stock...">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="isNew" name="isNew">
                                        <label class="form-check-label" for="isNew">
                                            是否为新品
                                        </label>
                                        &nbsp;&nbsp;
                                        <input class="form-check-input" type="checkbox" id="isCommend" name="isCommend">
                                        <label class="form-check-label" for="isCommend">
                                            是否推荐
                                        </label>
                                        &nbsp;&nbsp;
                                        <input class="form-check-input" type="checkbox" id="isLowPrice" name="isLowPrice">
                                        <label class="form-check-label" for="isLowPrice">
                                            是否特价商品
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="goodDescribe">商品描述</label>
                                <textarea class="form-control" id="goodDescribe" name="goodDescribe" rows="3"></textarea>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary" >添加或修改商品（根据名称）</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <br>
                <br>
                <div class="contact-form wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <h3>
                        <i class="fa fa-comment-o"></i>
                        Delete Good
                    </h3>
                    <div class="row">
                        <form id="deleteGoodByNameForm" action="/ttt_ssm/good/deleteGood" method="post">
                            <div class="form-group row">
                                <label for="deleteName" class="col-sm-3 col-form-label">商品名称(准确全称)</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="deleteName" name="deleteName" placeholder="Name...">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary" >确认删除商品</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="contact-info wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <h3>
                        <i class="fa fa-newspaper-o"></i>
                        leave a message
                    </h3>
                    <ul>
                        <li>
                            <i class="fa fa-location-arrow"></i>
                            <span>28 Green Tower, Street Name,</span>
                            <span>New York City, USA</span>
                        </li>
                        <li>
                            <i class="fa fa-mobile"></i>
                            <span>+880 1234 123456</span>
                            <span>+880 1234 123456</span>
                        </li>
                        <li>
                            <i class="fa fa-envelope-o"></i>
                            <span>admin@admin.com</span>
                            <span>admin@admin.com</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- contact-area-end -->
<!-- map-aera-start -->
<div class="map-area">
    <div class="gmap wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
        <div id="googleMap"></div>
    </div>
</div>
<!-- map-aera-end -->
<!-- brand-area-start -->
<div class="brand-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h3>our brands</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="brands wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                <div class="brand-carousel">
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="single-brand">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/resources/img/brand/1.png" alt=""/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- brand-area-end -->
<!-- footer-start -->
<footer>
    <div class="footer-area wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
        <div class="footer-middle">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="row">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <h4>Information</h4>
                                <ul class="toggle-footer">
                                    <li>
                                        <a title="Specials" href="javascript:;">Specials</a>
                                    </li>
                                    <li>
                                        <a title="New products" href="javascript:;">New products</a>
                                    </li>
                                    <li>
                                        <a title="Best sellers" href="javascript:;">Best sellers</a>
                                    </li>
                                    <li>
                                        <a title="Our stores" href="javascript:;">Our stores</a>
                                    </li>
                                    <li>
                                        <a title="Contact us" href="javascript:;">Contact us</a>
                                    </li>
                                    <li>
                                        <a title="Sitemap" href="javascript:;">Sitemap</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <h4>My account</h4>
                                <ul class="toggle-footer">
                                    <li>
                                        <a title="My orders" href="javascript:;">My orders</a>
                                    </li>
                                    <li>
                                        <a title="My credit slips" href="javascript:;"> My credit slips</a>
                                    </li>
                                    <li>
                                        <a title="My addresses" href="javascript:;">My addresses</a>
                                    </li>
                                    <li>
                                        <a title="My personal info" href="javascript:;">My personal info</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <h4>category</h4>
                                <ul class="toggle-footer">
                                    <li>
                                        <a title="My orders" href="javascript:;">women</a>
                                    </li>
                                    <li>
                                        <a title="My credit slips" href="javascript:;">men</a>
                                    </li>
                                    <li>
                                        <a title="My addresses" href="javascript:;">category</a>
                                    </li>
                                    <li>
                                        <a title="My personal info" href="javascript:;">equipment</a>
                                    </li>
                                    <li>
                                        <a title="My personal info" href="javascript:;">watch</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-3  col-sm-3 col-xs-12">
                                <h4>Shop Location</h4>
                                <div class="footer-contact">
                                    <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        Duis dignissim erat ut laoreet pharetra....
                                    </p>
                                    <p class="address add">
                                        <span>No. 96, Jecica City, NJ 07305, New York, USA</span>
                                    </p>
                                    <p class="phone add">
                                        <span> 01234-567890</span>
                                    </p>
                                    <p class="email add">
                                        <a href="javascript:;">admin@admin.com</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="payment">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/resources/img/payment.png" alt=""/>
                    </a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12 footer-link">
                        <ul>
                            <li>
                                <a href="javascript:;">Customer Service</a>
                            </li>
                            <li>
                                <a href="javascript:;">Secure payment</a>
                            </li>
                            <li>
                                <a href="javascript:;">Term of Use</a>
                            </li>
                            <li>
                                <a href="javascript:;">About us</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12 address">
                        Copyright &copy; 2017.Company name All rights reserved.<a target="_blank"
                                                                                  href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer-end -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="product-details">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 col-xs-12 col-sm-5">
                                <div class="picture-tab">
                                    <ul class="pic-tabs">
                                        <li class="active"><a data-toggle="tab" href="#pic11"><img
                                                src="${pageContext.request.contextPath}/resources/img/pro-tab/1.jpg" alt=""/></a></li>
                                        <li><a data-toggle="tab" href="#pic12"><img src="${pageContext.request.contextPath}/resources/img/pro-tab/2.jpg" alt=""/></a>
                                        </li>
                                        <li><a data-toggle="tab" href="#pic13"><img src="${pageContext.request.contextPath}/resources/img/pro-tab/3.jpg" alt=""/></a>
                                        </li>
                                        <li><a data-toggle="tab" href="#pic14"><img src="${pageContext.request.contextPath}/resources/img/pro-tab/4.jpg" alt=""/></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="pic11" class="tab-pane fade in active">
                                            <!-- single-product-start -->
                                            <div class="single-product">
                                                <div class="single-product-img">
                                                    <a href="javascript:;">
                                                        <img src="${pageContext.request.contextPath}/resources/img/singlepro/21.jpg" alt=""/>
                                                    </a>
                                                    <span class="sale-box">
                                                                <span class="sale">Sale</span>
                                                            </span>
                                                    <span class="new-box">
                                                                <span class="new">New</span>
                                                            </span>
                                                </div>
                                            </div>
                                            <!-- single-product-end -->
                                        </div>
                                        <div id="pic12" class="tab-pane fade">
                                            <!-- single-product-start -->
                                            <div class="single-product">
                                                <div class="single-product-img">
                                                    <a href="javascript:;">
                                                        <img src="${pageContext.request.contextPath}/resources/img/singlepro/22.jpg" alt=""/>
                                                    </a>
                                                    <span class="sale-box">
                                                                <span class="sale">Sale</span>
                                                            </span>
                                                    <span class="new-box">
                                                                <span class="new">New</span>
                                                            </span>
                                                </div>
                                            </div>
                                            <!-- single-product-end -->
                                        </div>
                                        <div id="pic13" class="tab-pane fade">
                                            <!-- single-product-start -->
                                            <div class="single-product">
                                                <div class="single-product-img">
                                                    <a href="javascript:;">
                                                        <img src="${pageContext.request.contextPath}/resources/img/singlepro/23.jpg" alt=""/>
                                                    </a>
                                                    <span class="sale-box">
                                                                <span class="sale">Sale</span>
                                                            </span>
                                                    <span class="new-box">
                                                                <span class="new">New</span>
                                                            </span>
                                                </div>
                                            </div>
                                            <!-- single-product-end -->
                                        </div>
                                        <div id="pic14" class="tab-pane fade">
                                            <!-- single-product-start -->
                                            <div class="single-product">
                                                <div class="single-product-img">
                                                    <a href="javascript:;">
                                                        <img src="${pageContext.request.contextPath}/resources/img/singlepro/24.jpg" alt=""/>
                                                    </a>
                                                    <span class="sale-box">
                                                                <span class="sale">Sale</span>
                                                            </span>
                                                    <span class="new-box">
                                                                <span class="new">New</span>
                                                            </span>
                                                </div>
                                            </div>
                                            <!-- single-product-end -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 col-xs-12 col-sm-7">
                                <div class="product-details-info">
                                    <h5 class="product-title">Feugiat justo lacinia</h5>
                                    <div class="price-box">
                                        <span class="price">£50.00</span>
                                        <span class="old-price">£70.00</span>
                                    </div>
                                    <div class="rating">
                                        <div class="star star-on"></div>
                                        <div class="star star-on"></div>
                                        <div class="star star-on"></div>
                                        <div class="star star-on"></div>
                                        <div class="star"></div>
                                    </div>
                                    <div class="short-description">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue
                                            nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi
                                            ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate
                                            adipiscing cursus eu, suscipit id nulla.
                                        </p>
                                    </div>
                                    <div class="add-cart">
                                        <p class="quantity cart-plus-minus">
                                            <label>Quantity</label>
                                            <input type="text" value="1"/>
                                        </p>
                                        <div class="shop-add-cart">
                                            <button>add to cart</button>
                                        </div>
                                    </div>
                                    <div class="widget-icon">
                                        <a href="javascript:;">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                        <a href="javascript:;">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a href="javascript:;">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                        <a href="javascript:;">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="commen.jsp" />
<!-- modal-end -->
<!-- all js here -->
<!-- Google Map js -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script>
    function initialize() {
        var mapOptions = {
            zoom: 15,
            scrollwheel: false,
            center: new google.maps.LatLng(23.719876, 90.421717)
        };

        var map = new google.maps.Map(document.getElementById('googleMap'),
            mapOptions);


        var marker = new google.maps.Marker({
            position: map.getCenter(),
            animation: google.maps.Animation.BOUNCE,
            icon: '${pageContext.request.contextPath}/resources/img/bg/maplock.png',
            map: map
        });

    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- jquery latest version -->
<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.12.0.min.js"></script>
<!-- bootstrap js -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<!-- meanmenu js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.meanmenu.js"></script>
<!-- countdown js -->
<script src="${pageContext.request.contextPath}/resources/js/countdown.js"></script>
<!-- jquery.nivo.slider.pack js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.nivo.slider.pack.js"></script>
<!-- jquery-ui.min.js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<!-- jquery.form.js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<!-- wow js -->
<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
<!-- plugins js -->
<script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<%--<!--fileinput.js-->--%>
<%--<script src="${pageContext.request.contextPath}/resources/js/fileinput.js"></script>--%>
<%--<!--fileinput.min.js-->--%>
<%--<script src="${pageContext.request.contextPath}/resources/js/fileinput.min.js"></script>--%>
<!-- base js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/base.js"></script>
<!-- user js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/userJs.js"></script>
<!-- goodJs js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/goodJs.js"></script>
</body>
</html>

