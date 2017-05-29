<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="/resources/login/">
    <title>Register</title>
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


    <div class="page-form" style="margin-top: 100px;">
        <div class="panel panel-blue">
            <div class="panel-body pan">
                <form action="/store/storemodi" method="post" class="form-horizontal">
                <div class="form-body pal">
              
                    <div class="col-md-12 text-center">
                        <h5 style="margin-top: -90px; font-size: 35px;">
                            정보 수정  </h5>
                        
                    </div>
                    
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-3 control-label">
                            Password:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputPassword" type="password" value="${vo.spw}" class="form-control" name="spw" /></div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 이름:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputName" type="text" value="${vo.sname}" class="form-control" name="sname" /></div>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 주소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">
							
								<!-- 검색 기능을 표시할 <div>를 생성한다 -->
								<div id="postcodify"></div>
								
								<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 id를 부여한다 -->
							
						<div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            주 소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">		
								<input class="form-control" type="text" name="saddr1" id="address" value="${vo.saddrm}" /><br />
								</div>
                        </div>
                    </div>
                    		
						<div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            상세 주소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">		
								<input class="form-control" type="text" name="saddr3" id="details" value="" /><br />
								</div>
                        </div>
                    </div>
				
								
                               
                                
                           </div>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 전화 번호:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputName" type="text" value="${vo.sphone}" class="form-control" name="sphone" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 e-mail:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputName" type="text" value="${vo.semail}" class="form-control" name="semail" /></div>
                        </div>
                    </div>
                    
                    <div class="form-group mbn">
                        <div class="col-lg-12" align="right">
                            <div class="form-group mbn">
                                <div class="col-lg-3">
                                    &nbsp;
                                </div>
                                <div class="col-lg-9">
                         <input type="hidden" name="sid" value="${vo.sid}">       
                                    <button type="submit" class="btn btn-default">정보 수정</button>
                                    <button type="button" class="btn btn-default" onclick="location.href='/index' ">취 소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        
    </div>
    
<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script>

    $(function() { $("#postcodify").postcodify({
        insertPostcode5 : "#postcode",
        insertAddress : "#address",
        insertDetails : "#details",
        insertExtraInfo : "#extra_info",
        hideOldAddresses : false
    }); });
    

</script>

    
</body>
</html>
