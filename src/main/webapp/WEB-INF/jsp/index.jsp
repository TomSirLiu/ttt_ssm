<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <script src="http://oss.maxcdn.com/libs/respond.${pageContext.request.contextPath}/resources/js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>


<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- header-start -->
<header>
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12 hidden-xs">
                    <div class="header-top-left">
                        <div class="welcome-msg">
                            <span class="default-msg hidden-xs">Welcome to 网上商城!</span>
                            <span class="phone">Call support free: <span class="number">01234-567890</span></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xs-12 col-sm-12">
                    <div class="header-top-right">
                        <ul class="header-links hidden-xs">
                            <li><a class="my-account" href="javascript:;" id="modifyAccount" data-toggle="modal"
                                   data-target="#myModal5">我的账户</a></li>
                            <li><a class="my-wishlist" href="javascript:;">My Wishlist</a></li>
                            <li><a class="login" href="javascript:;" data-toggle="modal"
                                   data-target="#myModal6">${sessionScope.user==null?'登陆/注册':user.name}</a>
                            </li>
                        </ul>
                        <div class="currency language">
                            <div class="current">
                                <span>Dollar</span>
                            </div>
                            <ul class="lang">
                                <li class="selected"><span class="dollar">Dollar</span></li>
                                <li><a href="javascript:;" title=""><span class="euro">Euro</span></a></li>
                                <li><a href="javascript:;" title=""><span class="sheqel">Sheqel</span></a></li>
                            </ul>
                        </div>
                        <div class="language">
                            <div class="current">
                                <span>English</span>
                            </div>
                            <ul class="lang">
                                <li class="selected"><img
                                        src="${pageContext.request.contextPath}/resources/img/lang/1.jpg"
                                        alt="en"/><span>English</span></li>
                                <li><img src="${pageContext.request.contextPath}/resources/img/lang/2.jpg" alt="ar"/><a
                                        href="javascript:;" title=""><span>اللغة العربية</span></a>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/resources/img/lang/7.jpg" alt="hb"/><a
                                        href="javascript:;" title=""><span>עִברִית</span></a>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/resources/img/lang/3.jpg" alt="es"/><a
                                        href="javascript:;" title=""><span>Español</span></a>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/resources/img/lang/4.jpg" alt="ph"/><a
                                        href="javascript:;" title=""><span>Pilipino</span></a>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/resources/img/lang/5.jpg" alt="fr"/><a
                                        href="javascript:;" title=""><span>français</span></a>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/resources/img/lang/6.jpg" alt="sd"/><a
                                        href="javascript:;" title=""><span>svensk</span></a>
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
                        <a href="index.jsp"><img src="${pageContext.request.contextPath}/resources/img/logo.png"
                                                 alt=""/></a>
                    </div>
                </div>
                <div class="col-md-5 col-sm-6 hidden-xs">
                    <div class="search-box">
                        <form action="#">
                            <input class="form-control search-form" type="text" placeholder="Search entire store here"/>
                            <button class="search-button" value="Search" type="submit"><i class="fa fa-search"></i>
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
                                <a href="javascript:;"><span>checkout<i class="fa fa-arrow-circle-o-right"
                                                                        aria-hidden="true"></i></span></a>
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
                                <li><a href="index.jsp">Home</a></li>
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
<!-- slider-start -->
<div class="slider-container">
    <div class="slider">
        <!-- Slider Image -->
        <div id="mainslider" class="nivoSlider slider-image">
            <img src="${pageContext.request.contextPath}/resources/img/slider/42.jpg" alt="main slider"
                 title="#htmlcaption1"/>
            <img src="${pageContext.request.contextPath}/resources/img/slider/41.jpg" alt="main slider"
                 title="#htmlcaption2"/>
        </div>
        <!-- Slider Caption 1 -->
        <div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
            <div class="slider-progress"></div>
            <div class="slide1-text slide-1 hidden-xs">
                <div class="middle-text">
                    <div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
                        <h1>The Best Fashion</h1>
                    </div>
                    <div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
                        <h3>Save Your Time and Money</h3>
                    </div>
                    <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
                        <a href="javascript:;">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Slider Caption 2 -->
        <div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
            <div class="slider-progress"></div>
            <div class="slide1-text slide-2 hidden-xs">
                <div class="middle-text">
                    <div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
                        <h1>The Best Fashion</h1>
                    </div>
                    <div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
                        <h3>Save Your Time and Money</h3>
                    </div>
                    <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
                        <a href="javascript:;">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider-end -->
<!-- banner-area-start -->
<div class="banner-area hidden-sm hidden-xs">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-12">
                <div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/resources/img/banner/2.png" alt=""/>
                    </a>
                </div>
            </div>
            <div class="col-md-4 col-xs-12">
                <div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/resources/img/banner/3.png" alt=""/>
                    </a>
                </div>
            </div>
            <div class="col-md-4 col-xs-12">
                <div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/resources/img/banner/1.png" alt=""/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- banner-area-end -->
<!-- feature-area-start -->
<div class="feature-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h3>特价商品</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="feature-tab wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <ul class="my-tab">
                        <c:forEach items="${sessionScope.get('goodCategories')}" varStatus="i" var="category">
                            <c:if test="${i.count==1}">
                                <li class="active">
                            </c:if>
                            <c:if test="${i.count!=1}">
                                <li>
                            </c:if>
                            <a data-toggle="tab" href="#${category.name}">${category.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="tab-content">
                        <c:forEach items="${sessionScope.get('goodCategories')}" varStatus="i" var="category">
                        <c:if test="${i.count==1}">
                        <div id="${category.name}" class="tab-pane fade in active">
                            </c:if>
                            <c:if test="${i.count!=1}">
                            <div id="${category.name}" class="tab-pane fade">
                                </c:if>
                                <div class="tab-carousel">
                                        <%--价格 类别 名称 是否新品、特价 商品描述（modal里面）--%>
                                    <c:forEach items="${sessionScope.get('goods')}" var="good" varStatus="goodI">
                                        <c:if test="${good.category.id == category.id && good.ifDiscount}">
                                            <div class="col-md-12">
                                                <!-- single-product-start -->
                                                <div class="single-product">
                                                    <div class="single-product-img">
                                                        <a href="javascript:;"><img
                                                                src="${pageContext.request.contextPath}/resources/img/singlepro/${category.name}/${goodI.count}.jpg"
                                                                alt=""/></a>
                                                        <c:if test="${good.ifDiscount}">
                                                                    <span class="sale-box">
                                                                        <span class="sale">Sale</span>
                                                                    </span>
                                                        </c:if>
                                                        <c:if test="${good.ifNew}">
                                                                    <span class="new-box">
                                                                        <span class="new">New</span>
                                                                    </span>
                                                        </c:if>
                                                    </div>
                                                    <div class="single-product-content">
                                                        <div class="product-title">
                                                            <h5><a href="javascript:;">${good.name}</a></h5>
                                                        </div>
                                                        <div class="rating">
                                                            <div class="star star-on"></div>
                                                            <div class="star star-on"></div>
                                                            <div class="star star-on"></div>
                                                            <div class="star star-on"></div>
                                                            <div class="star"></div>
                                                        </div>
                                                        <div class="price-box">
                                                            <span class="price"><fmt:formatNumber value="${good.price}"
                                                                                                  type="currency"
                                                                                                  pattern="£.00"/></span>
                                                            <c:if test="${good.ifDiscount}">
                                                                <span class="old-price"><fmt:formatNumber
                                                                        value="${good.price*1.2}" type="currency"
                                                                        pattern="£.00"/></span>
                                                            </c:if>
                                                        </div>
                                                        <div class="product-action">
                                                            <button class="btn btn-default add-cart"
                                                                    title="add to cart"
                                                                    onclick="addCart(${good.id},1,false)">Add
                                                                to cart
                                                            </button>
                                                            <a class="add-wishlist" href="javascript:;"
                                                               title="add to wishlist"><i
                                                                    class="fa fa-heart"></i></a>
                                                            <a class="quick-view" href="javascript:;" title="quick view"
                                                               data-toggle="modal" data-target="#myModal"
                                                               onclick="goodDetail(${good.id})"><i
                                                                    class="fa fa-search"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- single-product-end -->
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:forEach>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- feature-area-end -->
    <!-- new-product-area-start -->
    <div class="new-product-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <h3>推荐商品</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="new-product wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <div class="new-carousel">
                        <c:forEach items="${sessionScope.get('goods')}" var="good" varStatus="goodI">
                            <c:if test="${good.ifCommend}">
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/${good.category.name}/${goodI.count}.jpg"
                                                    alt=""/></a>
                                            <c:if test="${good.ifDiscount}">
                                                                    <span class="sale-box">
                                                                        <span class="sale">Sale</span>
                                                                    </span>
                                            </c:if>
                                            <c:if test="${good.ifNew}">
                                                                    <span class="new-box">
                                                                        <span class="new">New</span>
                                                                    </span>
                                            </c:if>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">${good.name}</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price"><fmt:formatNumber value="${good.price}"
                                                                                      type="currency"
                                                                                      pattern="£.00"/></span>
                                                <c:if test="${good.ifDiscount}">
                                                    <span class="old-price"><fmt:formatNumber value="${good.price*1.2}"
                                                                                              type="currency"
                                                                                              pattern="£.00"/></span>
                                                </c:if>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"
                                                   onclick="goodDetail(${good.id})"><i
                                                        class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- new-product-area-end -->
    <!-- best-seller-area-start -->
    <div class="bestseller-area">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="best-seller-col wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <h3>热销</h3>
                        <div class="best-seller-content">
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/41.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/4.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/7.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="best-seller-col top-mar-xs wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <h3>精品</h3>
                        <div class="best-seller-content">
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/6.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/43.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/10.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <div class="star"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="best-seller-col top-mar-xs wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <h3>优质商品</h3>
                        <div class="best-seller-content">
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/11.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/3.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                            <!-- single-new-product-start -->
                            <div class="single-new-product">
                                <div class="product-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/singlepro/2.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="product-details">
                                    <div class="single-product-content">
                                        <div class="product-title">
                                            <h5><a href="javascript:;">consectetuer</a></h5>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price">£50.00</span>
                                            <span class="old-price">£70.00</span>
                                        </div>
                                        <div class="product-action">
                                            <button class="btn btn-default add-cart" title="add to cart">Add to cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-new-product-start -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- best-seller-area-end -->
    <!-- banner-2-area-start -->
    <div class="banner-2-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <a href="javascript:;"><img src="${pageContext.request.contextPath}/resources/img/banner/11.jpg"
                                                    alt=""/></a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-banner wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <a href="javascript:;"><img src="${pageContext.request.contextPath}/resources/img/banner/12.jpg"
                                                    alt=""/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner-2-area-end -->
    <!-- exclusive-area-start -->
    <div class="exclusive-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-xs-12 hidden-sm wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <div class="best-seller">
                        <div class="row">
                            <div class="best-carousel">
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/11.jpg"
                                                    alt=""/></a>
                                            <span class="discount-box">-12%</span>
                                        </div>
                                        <div class="upcoming">
                                            <span class="is-countdown"> </span>
                                            <div data-countdown="2020/09/01"></div>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">consectetuer</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/9.jpg"
                                                    alt=""/></a>
                                            <span class="discount-box">-8%</span>
                                        </div>
                                        <div class="upcoming">
                                            <span class="is-countdown"> </span>
                                            <div data-countdown="2021/09/01"></div>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">consectetuer</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-xs-12 col-sm-12 wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-heading">
                                <h3>独家</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="exclusive-product">
                            <div class="exclusive-carousel">
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/3.jpg"
                                                    alt=""/></a>
                                            <span class="sale-box">
                                                        <span class="sale">Sale</span>
                                                </span>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">consectetuer</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/7.jpg"
                                                    alt=""/></a>
                                            <span class="sale-box">
                                                        <span class="sale">Sale</span>
                                                </span>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">Feugiat justo lacinia</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star"></div>
                                                <div class="star"></div>
                                                <div class="star"></div>
                                                <div class="star"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/11.jpg"
                                                    alt=""/></a>
                                            <span class="sale-box">
                                                        <span class="sale">Sale</span>
                                                </span>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">Fermentum dictum</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/12.jpg"
                                                    alt=""/></a>
                                            <span class="sale-box">
                                                        <span class="sale">Sale</span>
                                                </span>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">Dictum</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star star-on"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                                <div class="col-md-12">
                                    <!-- single-product-start -->
                                    <div class="single-product">
                                        <div class="single-product-img">
                                            <a href="javascript:;"><img
                                                    src="${pageContext.request.contextPath}/resources/img/singlepro/5.jpg"
                                                    alt=""/></a>
                                            <span class="sale-box">
                                                        <span class="sale">Sale</span>
                                                </span>
                                        </div>
                                        <div class="single-product-content">
                                            <div class="product-title">
                                                <h5><a href="javascript:;">Feugiat justo lacinia</a></h5>
                                            </div>
                                            <div class="rating">
                                                <div class="star"></div>
                                                <div class="star"></div>
                                                <div class="star"></div>
                                                <div class="star"></div>
                                                <div class="star"></div>
                                            </div>
                                            <div class="price-box">
                                                <span class="price">£50.00</span>
                                                <span class="old-price">£70.00</span>
                                            </div>
                                            <div class="product-action">
                                                <button class="btn btn-default add-cart" title="add to cart">Add to
                                                    cart
                                                </button>
                                                <a class="add-wishlist" href="javascript:;" title="add to wishlist"><i
                                                        class="fa fa-heart"></i></a>
                                                <a class="quick-view" href="javascript:;" title="quick view"
                                                   data-toggle="modal"
                                                   data-target="#myModal"><i class="fa fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- exclusive-area-end -->
    <!-- news-letter-area-start -->
    <div class="news-letter-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="subscribe-area wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                        <div class="subscribe-title">
                            <h3><span>Subscribe</span>to our newsletter</h3>
                            <p>Subscribe to the Expert mailing list to receive updates on new arrivals, special
                                offers
                                and other discount information.
                            </p>
                            <form action="#">
                                <div class="subscribe-form">
                                    <input type="text" placeholder="Your Email..."
                                           class="form-control search-form"/>
                                    <button>subscribe</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- news-letter-area-end -->
    <!-- service-area-start -->
    <div class="service-area">
        <div class="container">
            <div class="row">
                <div class="service wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <div class="col-md-3 col-xs-12 col-sm-3">
                        <div class="single-service">
                            <i class="fa fa-plane"></i>
                            <h3>free shipping</h3>
                            <p> worldwide in 7 days</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-12 col-sm-3">
                        <div class="single-service">
                            <i class="fa fa-taxi"></i>
                            <h3>home delivery</h3>
                            <p>home delivery on all over country</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-12 col-sm-3">
                        <div class="single-service no-bor">
                            <i class="fa fa-cc-visa"></i>
                            <h3>secure payment</h3>
                            <p>secure payment many methods</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-12 col-sm-3">
                        <div class="single-service no-bor">
                            <i class="fa fa-phone"></i>
                            <h3>24/7 customer care</h3>
                            <p>online support</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- service-area-end -->
    <!-- blog-area-start -->
    <div class="blog-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <h3>latest blog</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="blogs wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                    <div class="blog-carousel">
                        <div class="col-md-12">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/blog/1.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="blog-content">
                                    <h3><a href="javascript:;">Lorem Ipsum</a></h3>
                                    <div class="meta">
                                            <span class="post-category">in <a href="javascript:;">Uncategorized</a>
                                                </span>
                                        <span class="meta-border">|</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>Nov 11, 2018</span>
                                    </div>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        Lorem
                                        Ipsum has been the industry's standard dummy
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/blog/2.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="blog-content">
                                    <h3><a href="javascript:;">Lorem Ipsum</a></h3>
                                    <div class="meta">
                                        <span class="post-category">in <a href="javascript:;">Uncategorized</a></span>
                                        <span class="meta-border">|</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>Dec 01, 2018</span>
                                    </div>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        Lorem
                                        Ipsum has been the industry's standard dummy
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/blog/3.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="blog-content">
                                    <h3><a href="javascript:;">Lorem Ipsum</a></h3>
                                    <div class="meta">
                                        <span class="post-category">in <a href="javascript:;">Uncategorized</a></span>
                                        <span class="meta-border">|</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>Dec 23, 2018</span>
                                    </div>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        Lorem
                                        Ipsum has been the industry's standard dummy
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="javascript:;"><img
                                            src="${pageContext.request.contextPath}/resources/img/blog/4.jpg"
                                            alt=""/></a>
                                </div>
                                <div class="blog-content">
                                    <h3><a href="javascript:;">Lorem Ipsum</a></h3>
                                    <div class="meta">
                                        <span class="post-category">in <a href="javascript:;">Uncategorized</a></span>
                                        <span class="meta-border">|</span>
                                        <span class="time"><i class="fa fa-clock-o"></i>Nov 16, 2016</span>
                                    </div>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        Lorem
                                        Ipsum has been the industry's standard dummy
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- blog-area-end -->
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
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="single-brand">
                                <a href="javascript:;"><img
                                        src="${pageContext.request.contextPath}/resources/img/brand/1.png"
                                        alt=""/></a>
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
                                        <li><a title="Specials" href="javascript:;">Specials</a></li>
                                        <li><a title="New products" href="javascript:;">New products</a></li>
                                        <li><a title="Best sellers" href="javascript:;">Best sellers</a></li>
                                        <li><a title="Our stores" href="javascript:;">Our stores</a></li>
                                        <li><a title="Contact us" href="javascript:;">Contact us</a></li>
                                        <li><a title="Sitemap" href="javascript:;">Sitemap</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <h4>My account</h4>
                                    <ul class="toggle-footer">
                                        <li><a title="My orders" href="javascript:;">My orders</a></li>
                                        <li><a title="My credit slips" href="javascript:;"> My credit slips</a></li>
                                        <li><a title="My addresses" href="javascript:;">My addresses</a></li>
                                        <li><a title="My personal info" href="javascript:;">My personal info</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <h4>category</h4>
                                    <ul class="toggle-footer">
                                        <li><a title="My orders" href="javascript:;">women</a></li>
                                        <li><a title="My credit slips" href="javascript:;">men</a></li>
                                        <li><a title="My addresses" href="javascript:;">category</a></li>
                                        <li><a title="My personal info" href="javascript:;">equipment</a></li>
                                        <li><a title="My personal info" href="javascript:;">watch</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-3  col-sm-3 col-xs-12">
                                    <h4>Shop Location</h4>
                                    <div class="footer-contact">
                                        <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing
                                            elit.
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
                        <a href="javascript:;"><img src="${pageContext.request.contextPath}/resources/img/payment.png"
                                                    alt=""/></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12 footer-link">
                            <ul>
                                <li><a href="javascript:;">Customer Service</a></li>
                                <li><a href="javascript:;">Secure payment</a></li>
                                <li><a href="javascript:;">Term of Use</a></li>
                                <li><a href="javascript:;">About us</a></li>
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
                                            <li class="active">
                                                <a data-toggle="tab" href="#pic11"><img id="pro-tab1"
                                                                                        src="${pageContext.request.contextPath}/resources/img/pro-tab/1.jpg"
                                                                                        alt=""/></a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#pic12"><img id="pro-tab2"
                                                                                        src="${pageContext.request.contextPath}/resources/img/pro-tab/2.jpg"
                                                                                        alt=""/></a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#pic13"><img id="pro-tab3"
                                                                                        src="${pageContext.request.contextPath}/resources/img/pro-tab/3.jpg"
                                                                                        alt=""/></a>
                                            </li>
                                            <lpic14i>
                                                <a data-toggle="tab" href="#pic14"><img id="pro-tab4"
                                                                                        src="${pageContext.request.contextPath}/resources/img/pro-tab/4.jpg"
                                                                                        alt=""/></a>
                                            </lpic14i>
                                        </ul>
                                        <div class="tab-content">
                                            <div id="pic11" class="tab-pane fade in active">
                                                <!-- single-product-start -->
                                                <div class="single-product">
                                                    <div class="single-product-img">
                                                        <a href="javascript:;"><img
                                                                src="${pageContext.request.contextPath}/resources/img/singlepro/21.jpg"
                                                                alt=""/></a>
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
                                                        <a href="javascript:;"><img
                                                                src="${pageContext.request.contextPath}/resources/img/singlepro/22.jpg"
                                                                alt=""/></a>
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
                                                        <a href="javascript:;"><img
                                                                src="${pageContext.request.contextPath}/resources/img/singlepro/23.jpg"
                                                                alt=""/></a>
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
                                                        <a href="javascript:;"><img
                                                                src="${pageContext.request.contextPath}/resources/img/singlepro/24.jpg"
                                                                alt=""/></a>
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
                                        <h5 class="product-title" id="goodDetailTitle">..</h5>
                                        <div class="price-box">
                                            <span class="price" id="goodDetailPrice">..</span>
                                            <span class="old-price" id="goodDetailOldPrice">..</span>
                                        </div>
                                        <div class="rating">
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star star-on"></div>
                                            <div class="star"></div>
                                        </div>
                                        <div class="short-description">
                                            <p id="goodDetailDescription">
                                                ..
                                            </p>
                                        </div>
                                        <div class="short-description">
                                            <p id="goodDetailStock">
                                                ..
                                            </p>
                                        </div>
                                        <div class="add-cart">
                                            <p class="quantity cart-plus-minus">
                                                <label>Quantity</label>
                                                <input type="text" value="1" id="goodDetailQuantity"/>
                                            </p>
                                            <div class="shop-add-cart">
                                                <button id="goodDetailAddToCartButton">add to cart</button>
                                            </div>
                                        </div>
                                        <div class="widget-icon">
                                            <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                            <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                            <a href="javascript:;"><i class="fa fa-linkedin"></i></a>
                                            <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
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

</div>
</div>

<!-- modal-end -->

<!-- all js here -->
<!-- jquery latest version -->
<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-2.1.4.js"></script>
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
<!-- base js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/base.js"></script>
<!-- user js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/userJs.js"></script>
<!-- good js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/goodJs.js"></script>
<!-- goodCategory js -->
<script src="${pageContext.request.contextPath}/resources/js/myJS/goodCategoryJs.js"></script>
</body>

</html>

