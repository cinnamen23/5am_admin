<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">


    <%@ include file="/WEB-INF/views/header.jsp" %>
<style>
.imgr{
width: 500px auto;
height: auto;
max-width: 1000px;
max-height: 500px;
}
</style>
 <div class="content-wrapper">
         <div class="container">
	        <div class="row pad-botm">
	            <div class="col-md-12">	               
	                     
	                     
	                <h4 class="header-line">당신의 꿈을 여는 시간 </h4> 
	            </div>
	        </div>
             
             <div class="row">
            
                 
              <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-bars fa-5x"></i>
                            <h3>${totalCount} 명</h3>
                           찜 한 고객 수
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-info back-widget-set text-center">
                            <i class="fa fa-history fa-5x"></i>
                            <h3>50일&nbsp; <i class="fa fa-dollar"></i></h3>
                           광고 남은 기간
                        </div>
                    </div>
               <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-question-circle fa-5x"></i>
                            <h3>${qzeroCount} 건</h3>
                           답변을 달지 않은 질문 갯수
                        </div>
                    </div>
               <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-danger back-widget-set text-center">
                            <i class="fa fa-briefcase fa-5x"></i>
                            <h3>30+ Issues </h3>
                            That Should Be Resolved Now
                        </div>
                    </div>

        </div>              
             <div class="row">


              <div class="col-md-8 col-sm-8 col-xs-12">
                    <div id="carousel-example" class="carousel slide slide-bdr" data-ride="carousel" >
                   
                    <div class="carousel-inner">
                        <div class="item active" id="index0">
										
                     
                           
                        </div>
                        <div class="item" id="index1">
                        
                          
                        </div>
                        <div class="item" id="index2">
                            
                           
                        </div>
                    </div>
                    <!--INDICATORS-->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example" data-slide-to="1"></li>
                        <li data-target="#carousel-example" data-slide-to="2"></li>
                    </ol>
                    <!--PREVIUS-NEXT BUTTONS-->
                     <a class="left carousel-control" href="#carousel-example" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left"></span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right"></span>
					  </a>
					                             </div>
					 </div>
					                 
					
					
								
					
							

                 <div class="col-md-4 col-sm-4 col-xs-12">
                 
                    
                    <div class="alert alert-info text-center" style="height: 380px">
                          <h3> 현재 ${login.sid}님이</br> 로그인 되었습니다.</h3> 
                          <hr />
                          <p>
                        
                         ${login.sname }</br>
                         ${login.saddr }</br>
                         ${login.sphone }</br>
                         ${login.semail }</br>
                         
                        </p>
                          <hr />
                           <button type="button" class="btn btn-info"
                        onclick="location.href='/store/storemodi' ">정보 수정</button>
                        </div>
                    
             </div>
             
                 
            </div>

             <div class="row">
                 <div class="col-md-4 col-sm-4 col-xs-12" style="height: 400px;">
 					<div class="panel panel-default"style="height: 400px;">
                        <div class="panel-heading">
                           Recent Users
                        </div>
                        <div class="panel-body text-center recent-users-sec" style="height: 300px;">
							<img class="img-thumbnail" src="assets/img/user.gif" />
                            <img class="img-thumbnail" src="assets/img/user2.png" />
                            <img class="img-thumbnail" src="assets/img/user.gif" />
                            <img class="img-thumbnail" src="assets/img/user2.png" />
                            <img class="img-thumbnail" src="assets/img/user.gif" />
                               <img class="img-thumbnail" src="assets/img/user2.png" />
                            
                        </div>
     				</div>
             </div>
                  <div class="col-md-8 col-sm-8 col-xs-12">
 <!-- 지도 시작  -->
                      
                      <div id="map" style="width:100%;height:400px;"></div>

					<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=175962b9a13ff23b6ba95789998c261c&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addr2coord('${login.saddrm}', function(status, result) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {
					
					        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new daum.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new daum.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">${login.sname}</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
					</script>
					                      
                      
                      
                      
    <!-- 지도 끝  -->                  
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
             </div>
             
             </div>
             
            

    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
	<!-- CONTENT-WRAPPER SECTION END-->


<script
src="https://code.jquery.com/jquery-3.2.1.min.js"
integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
crossorigin="anonymous"></script>
<script>
var str0 = "<a href='/notice/list'><img class='imgr' style='width: 900px; height: 370px;' src='/display?fName="+"${list[0].nimage}"+"' alt=''></a>";
var str1 = "<a href='/notice/list'><img class='imgr' style='width: 900px; height: 370px;' src='/display?fName="+"${list[1].nimage}"+"' alt=''></a>";
var str2 = "<a href='/notice/list'><img class='imgr' style='width: 900px; height: 370px;' src='/display?fName="+"${list[2].nimage}"+"' alt=''></a>";

$("#index0").append(str0);
$("#index1").append(str1);
$("#index2").append(str2);

</script>	


<script>
	$(document).ready(function(e) { 
		
		var result = '${msg}';
		if (result == "success") {
			history.pushState(null, null);
			alert("정보 수정이 완료 되었습니다.");
			window.onpopstate = function(e) {
				history.go(1);
			};
		}
	});
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>