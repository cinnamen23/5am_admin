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
    <div class="page-form" style="margin-top: 100px;" >
        <div class="panel panel-blue">
            <div class="panel-body pan">
                <form id="f1" action="/store/storeregi" method="post" class="form-horizontal">
                <div class="form-body pal">
                    <div class="col-md-12 text-center">
                        
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <img src="images/avatar/profile-pic.png" class="img-responsive" style="margin-top: -35px;" />
                        </div>
                        <div class="col-md-9 text-center">
                             <h2 style="margin-top: -1px; font-size: 40px;">
                            5"AM 회원 등록</h2>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            UserID:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <input id="inputName" type="text" placeholder="로그인에 사용 할 ID를 입력하세요" class="form-control" name="sid" />
                                </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-3 control-label">
                            Password:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputPassword" type="password" placeholder="로그인에 사용 할  비밀번호를 입력하세요" class="form-control" name="spw" /></div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 이름:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputName" type="text" placeholder="가게 이름을 입력하세요" class="form-control" name="sname" /></div>
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
                            우편 번호:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">	
								<input class="form-control" type="text" name="" id="postcode" value="" /><br />
								</div>
                        </div>
                    </div>
						<div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            주 소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">		
								<input class="form-control" type="text" name="saddr1" id="address" value="" /><br />
							
								</div>
                        </div>
                    </div>
                    		<div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            상세 주소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">		
								<input class="form-control" type="text" name="saddr2" id="extra_info" value="" /><br />
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

                                <input id="inputName" type="text" placeholder="연락 가능한 전화 번호를 입력하세요" class="form-control" name="sphone" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 e-mail:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">

                                <input id="inputName" type="text" placeholder="연락 가능한 e-mail 주소를 입력하세요" class="form-control" name="semail" />
                              	
                                </div>
                        </div>
                    </div>
                    
                    <div class="form-group mbn">
                        <div class="col-lg-12" align="right">
                            <div class="form-group mbn">
                                <div class="col-lg-3">
                                    &nbsp;
                                </div>
                                <div>
                                <input type="hidden" class="lat" name="lat">
                                <input type="hidden" class="lng" name="lng">
                                
                                </div>
                                <div class="col-lg-9">
                                

                                    <button id="regiBtn"  type="submit" class="btn btn-default" >회원 가입</button>

                                  
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
                Forgot Something ? 
            </p>
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
        hideOldAddresses : false,
        success : function(result){
        	
        	console.log("result: " );
        	console.log(result);
        }
        
       
        
    }); });
    

    $("#regiBtn").on("click",function(e){
    	e.preventDefault();
    	
    	$.ajax({
	    	url:'http://apis.daum.net/local/geo/addr2coord',
	    	type:'post',
	    	dataType : 'jsonp',
	    	data : {
	    		apikey: '175962b9a13ff23b6ba95789998c261c',
	    			q: $("#address").val(),
	    			output:'json'
	    		
	    	},
	    	success : function(result){
	    			
	    			console.log(result)
	    			result = result.channel;
	        		console.log(result.item[0].point_x)
	        		$(".lat").val(result.item[0].point_x)
	        		$(".lng").val(result.item[0].point_y)
	        		$("#f1").submit();

	    	
	    		
	    		    		
	    	}
	    	
	    })
    })	
    	 

   
</script>

    
</body>
</html>
