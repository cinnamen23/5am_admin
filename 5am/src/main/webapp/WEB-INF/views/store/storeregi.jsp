<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>
<head>
    <title>Mask, Layer popup</title>
    <style>
       
      
        .window {
            display: none;
            left:25%;
            top:20%;
            background-color: #ffffff;
            width:50%;
            z-index:8000;
            position:absolute;
        }
        
        
        .window2 {
            display: none;
            left:25%;
            top:20%;
            background-color: #ffffff;
            width:50%;
            z-index:9000;
            position:absolute;
        }
    </style>
</head>
<body>
<div class="setDiv">
    <a href="#" class="showMask">검은 마스크와 레이어 팝업 띄우기</a>
 
    <div class="mask"></div>
    <div class="mask2"></div>
    
    <!-- 1번 창 보여짐   -->
		<div class="window">
			<div class="col-md-14 col-sm-14 col-xs-14">
					<div class="panel panel-danger">
						<div class="panel-heading">SINGUP FORM</div>
						<div class="panel-body">
							<form role="form">

								<div class="form-group">
									<label>Enter Email</label> <input class="form-control"
										type="text" />
									<p class="help-block">Help text here.</p>
									<a href="#" class="showMask2">검은 마스크와 레이어 팝업 띄우기</a>
									<input class="form-control" type="text" name="saddr1"
													id="address" value="" readonly="readonly" />
								</div>
								<div class="form-group">
									<label>Enter Password</label> <input class="form-control"
										type="password" />
									<p class="help-block">Help text here.</p>
								</div>
								<div class="form-group">
									<label>Re Type Password </label> <input class="form-control"
										type="password" />
									<p class="help-block">Help text here.</p>
								</div>

								<button type="submit" class="btn btn-danger">Register
									Now</button>

							</form>
						</div>
					</div>
				</div>
		</div>

		<!-- 1번 창 보여짐  끝  -->
    
    <!-- 2번 창 보여짐   -->
    <div class="window2">
    <div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">주소검색<button id="close2" class="btn btn-danger" style="float:right">선 택</button></div>
					<div class="panel-body">
						<form role="form">
						<label for="inputName" class="col-md-3 control-label"> 주
									소:</label>
							<input class="form-control" type="text" name="saddr1"
								id="address2" value="" readonly="readonly" />
							<!-- 검색 기능을 표시할 <div>를 생성한다 -->

							<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 id를 부여한다 -->

							<div class="form-group">
								
								<div class="col-md-9">
									<div class="input-icon right "></div>
								</div>
							</div>



							

						</form>
					</div>
							<div id="postcodify"></div>
				</div>
				</div>
    </div>
    
    <!-- 2번 창 보여짐  끝  -->
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	
    function wrapWindowByMask(){

        $('.window').show();
    }
    
    function wrapWindowByMask2(){
	 
	    $('.window2').show();
	}
 
    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
        $('.showMask').click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            e.preventDefault();
            wrapWindowByMask();
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window #close').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });
 
        
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
        $('.showMask2').click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            e.preventDefault();
            wrapWindowByMask2();
        });
 
        // 선택(close)를 눌렀을 때 작동합니다.
        $('.window2 #close2').click(function (e) {
            e.preventDefault();
            console.log($("#address2").val());
            $('#address').val($('#address2').val());
            $('.window2').hide();
        });
 
    
        
    });
</script>

	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script>
    $(function() { $("#postcodify").postcodify({
        insertPostcode5 : "#postcode",
        insertAddress : "#address",
        insertAddress : "#address2",
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
</html>