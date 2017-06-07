<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<base href="/resources/">
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>5am</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
    rel='stylesheet' type='text/css' />

</head>
<body>
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                    <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index"> <img src="assets/img/5am.PNG" /></a>

            </div>

            <div class="right-div">
                <a href="/store/logout" class="btn btn-danger pull-right">로그 아웃</a>
            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->
    <section class="menu-section">
    <div class="container">
        <div class="row ">
            <div class="col-md-12">
                <div class="navbar-collapse collapse ">
                    <ul id="menu-top" class="nav navbar-nav navbar-right">
                     <!-- 관리자& 고객 분기 -->
                            <c:if test="${login.gubun=='admin'}"> 
                    	<li><a href="/store/list">상점관리</a></li>
                    	 </c:if>
							<!-- 관리자& 고객 분기 끝 -->
                        <li><a href="/member/list">고객관리</a></li>
                        <!--  class="menu-top-active"  활성화 -->

                        <li><a href="/statistics/list">통계</a></li>
                        <li><a href="/notice/list">공지 사항</a></li>
                        <li><a href="/qna/list">Q&A</a></li>
                        <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">광고제작 <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="/admaker/list">이미지로 만들기</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="/admaker/list2">동영상으로 만들기</a></li>
                                </ul>
                         </li>
                        <li><a href="/library/list">자료실</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </div>
    </section>