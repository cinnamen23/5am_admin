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
    
    
    
    <style>
       
      
        .window {
            display: none;
            left:-43%;
            top:20%;
            background-color: #ffffff;
            width:150%;
            z-index:8000;
            position:absolute;
        }
        
        
      
    </style>

</head>
<body style="background: url('images/bg/bg.png') center center fixed;">


    <div class="page-form" style="margin-top: 100px;">
        <div class="panel panel-blue">
            <div class="panel-body pan">
                <form id="f1" action="/store/modi" method="post"  class="form-horizontal">
                <div class="form-body pal">
             
                    <div class="col-md-12 text-center">
                        <h5 style="margin-top: -70px; font-size: 35px;">
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

                                <input id="inputName" type="text" value="${vo.sname}" class="form-control" name="sname" />
                                </div>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            가게 주소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                            <button id="showMask" type="submit" class="btn btn-default">주소 검색</button>
                            
<!-- 주소 검색 div 시작 -->
							
				<div class="mask"></div>
    				<div class="mask2"></div>
    
<!-- 1번 창 보여짐   -->
				<div class="window">
					<div class="col-md-12 col-sm-12 col-xs-12" style="margin: 0;padding: 0">
						<div class="panel panel-danger"style="margin: 0;padding: 0">
							<div class="panel-heading">
								주소검색
								
							</div>
							<div class="panel-body"style="margin: 0;padding: 0">
								
							<div id="postcodify"></div>
							</div>
						</div>
					</div>
				</div>

<!-- 1번 창 보여짐  끝  -->
  								
<!-- 주소 검색 div 끝  -->								
								<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 id를 부여한다 -->
							
						<div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            주 소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">		
								<input class="form-control" type="text" name="saddr1" id="address2" value="${vo.saddrm}" /><br />
								</div>
                        </div>
                    </div>
                    		
						<div class="form-group">
                        <label for="inputName" class="col-md-3 control-label">
                            상세 주소:</label>
                        <div class="col-md-9">
                            <div class="input-icon right">		
								<input class="form-control" type="text" name="saddr3" id="details" value="${vo.saddr}" /><br />
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
			                        <input class="hpage" type="hidden" name="page" value="${cri.page}">
									<input class="htype" type="hidden" name="type" value="${cri.type}">
									<input class="hkeyword" type="hidden" name="keyword" value="${cri.keyword}">    
		                                <button id="regiBtn" class="btn btn-default">정보 수정</button>
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




<script type="text/javascript">
	
    function wrapWindowByMask(){

        $('.window').show();
    }
    
    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
        $('#showMask').click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            e.preventDefault();
            wrapWindowByMask();
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window #close').click(function (e) {
            e.preventDefault();
            $('.window').hide();
        });
 
        
    });
</script>

<script>
    $(function() { $("#postcodify").postcodify({
        insertPostcode5 : "#postcode",
        insertAddress : "#address",
        insertAddress : "#address2",
        insertDetails : "#details",
        insertExtraInfo : "#extra_info",
        hideOldAddresses : false,
        afterSelect : function(selectedEntry) {
            $("#postcodify div.postcode_search_result").remove();
            $("#postcodify div.postcode_search_status.summary").hide();
            
            $('.window').hide();
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
	    			q: $("#address2").val(),
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
