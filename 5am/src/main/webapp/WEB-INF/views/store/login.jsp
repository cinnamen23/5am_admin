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
                            <img src="images/avatar/profile-pic.png" class="img-responsive" style=" margin-top: -130px;" />
                        </div>
        <div class="panel panel-blue">
            <div class="panel-body pan">
                <form action="/store/loginPost" method="post" class="form-horizontal">
                <div class="form-body pal">
                    <div class="col-md-12 text-center">
                        <br />
                    </div>
                    <div class="form-group">

                        <div class="col-md-12 text-center">
                            <h1>
                                L O G I N</h1>
                            <br />
                            <p>
                               5AM이 당신의 꿈을 응원합니다</p>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input id="inputName" type="text" placeholder="아이디를 입력하세요" class="form-control" name="sid" /></div>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input id="inputPassword" type="password"  placeholder="비밀번호를 입력하세요" class="form-control" name="spw" /></div>
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
                                	<label>
                                	<input type="checkbox" name="useCookie"> Remember Me
                                	</label>
                                </div>
                                    <a href="/store/storeregi" class="btn btn-default">회원 가입</a>&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-default">
                                        로그인</button>
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
                아이디/ 비밀번호를 잊어버렸다면 ?
            </p>
        </div>
    </div>
    <script>
	$(document).ready(function(e) { 
		
		var result = '${sregimsg}';
		if (result == "success") {
			history.pushState(null, null);
			alert("회원가입이 왼료 되었습니다. 로그인 하세요.");
			window.onpopstate = function(e) {
				history.go(1);
			};
		}
		
		var result2 = '${logoutmsg}';
		if (result2 == "success") {
			history.pushState(null, null);
			alert("로그아웃 되었습니다. 다시 로그인 하세요.");
			window.onpopstate = function(e) {
				history.go(1);
			};
		}
		
		
	});
	</script>
</body>
</html>
