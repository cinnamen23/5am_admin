<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="/resources/login/">
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,800italic,400,700,800">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="styles/animate.css">
    <link type="text/css" rel="stylesheet" href="styles/all.css">
    <link type="text/css" rel="stylesheet" href="styles/main.css">
    <link type="text/css" rel="stylesheet" href="styles/style-responsive.css">
</head>
<body style="background: url('images/bg/bg.png') center center fixed;">
    
    <div class="page-form">
                        <div class="col-md-3">
                            <img src="images/avatar/profile-pic.png" class="img-responsive" style=" margin-top: 50px;" />
                        </div>
        <div class="panel panel-blue">
            <div class="panel-body pan">
                <form id ="f1" class="form-horizontal">
                <div class="form-body pal">
                    <div class="col-md-9 text-center">
                        <br />
                    </div>
                    <div class="form-group">

                        <div class="col-md-6 text-center">
                             <h3>아이디를 잊어버렸군요</h3></br>
                             <p>등록하신 이메일 주소로 아이디가 전송 됩니다. </p>
                            <br />
                        </div>
                         <div class="col-md-3 text-center"></div>
                    </div>
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input id="inputSname" type="text" placeholder="상점 이름을 입력해주세요" class="form-control" name="sname" /></div>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input id="inputSemail" type="text"  placeholder="이메일 주소를 입력해주세요" class="form-control" name="semail" /></div>
                        </div>
                    </div>
                    <div class="form-group mbn">
                        <div class="col-lg-12" align="right">
                            <div class="form-group mbn">
                                <div class="col-lg-3">
                                    &nbsp;
                                </div>
                                <div class="col-lg-9">
                                <div >
         
                                </div>
                                    <button id="idSearch" class="btn btn-default"> 아이디 찾기</button>
                                    <button type="button" class="btn btn-default" onclick="location.href='/store/login' ">취 소</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-lg-12 text-center">
            <p>
                <a href="/store/forgotid" >아이디 / </a><a href="/store/forgotpw" >비밀번호를 잊어버렸다면 ?</a>
            </p>
        </div>
    </div>
    
    	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
    <script>
	$(document).ready(function(e) { 
		 
		$("#idSearch").on("click", function(e) {
				e.preventDefault();
				$("#f1").attr("method", "post").attr("action", "/store/forgotid").submit();
		 })
		 
		 


		
	});
	</script>
</body>
</html>
