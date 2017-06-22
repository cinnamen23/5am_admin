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
                            <h3>50 일  </h3>
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
                            <h3>30 회</h3>
                            내 광고 재생 횟수
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
                 
                    
                    <div class="alert alert-info text-center" style="height: 371px;">
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
 					<div class="panel panel-info"style="height: 400px;">
                        <div class="panel-heading">
                           등록하신 광고
                        </div>
                        <div class="panel-body text-center" style="height: 300px;">
                        
                        <img class='img' src='/display/gif?fName=${login.sid}.gif' style="height: 300px; " >
                                                  
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
					        level: 5 // 지도의 확대 레벨
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
					        
					        
					        var sw = new daum.maps.LatLng(result.addr[0].lat-0.000015*${getArea}, result.addr[0].lng-0.000015*${getArea}), // 사각형 영역의 남서쪽 좌표
					        ne = new daum.maps.LatLng(result.addr[0].lat+0.000015*${getArea}, result.addr[0].lng+0.000015*${getArea}); // 사각형 영역의 북동쪽 좌표

						    // 사각형을 구성하는 영역정보를 생성합니다
						    // 사각형을 생성할 때 영역정보는 LatLngBounds 객체로 넘겨줘야 합니다
						    var rectangleBounds = new daum.maps.LatLngBounds(sw, ne);
	
						    // 지도에 표시할 사각형을 생성합니다
						    var rectangle = new daum.maps.Rectangle({
						        bounds: rectangleBounds, // 그려질 사각형의 영역정보입니다
						        strokeWeight: 4, // 선의 두께입니다
						        strokeColor: '#FF3DE5', // 선의 색깔입니다
						        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						        strokeStyle: 'shortdashdot', // 선의 스타일입니다
						        fillColor: '#FF8AEF', // 채우기 색깔입니다
						        fillOpacity: 0.7 // 채우기 불투명도 입니다
						    });
	
						    // 지도에 사각형을 표시합니다
						    rectangle.setMap(map);
						    } 
					});
					
					
					
					var positions = [
					    {
					        title: '카카오', 
					        latlng: new daum.maps.LatLng(33.450705, 126.570677)
					    },
					    {
					        title: '생태연못', 
					        latlng: new daum.maps.LatLng(33.450936, 126.569477)
					    },
					    {
					        title: '텃밭', 
					        latlng: new daum.maps.LatLng(33.450879, 126.569940)
					    },
					    {
					        title: '근린공원',
					        latlng: new daum.maps.LatLng(37.49764383051696, 127.0284694173542)
					    }
					];
					
					function getlatlng(lat,lng){
						
						return new daum.maps.LatLng(lat,lng)
					}

					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					for (var i = 0; i < '${elvlist.size()}'; i ++) {
						
						console.log(i);
						console.log('${elvlist[i]}');
						
						console.log('${elvlist[1]}');
						console.log('${elvlist[1].elvname}');
					    
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new daum.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: getlatlng('${elvlist[i].lat}','${elvlist[i].lat}'), // 마커를 표시할 위치
					        title : '${elvlist[i].elvname}', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					}
					
					
					
					
					</script>
				        
    <!-- 지도 끝  -->                  
                      
             </div>
         </div>
    </div>
</div>

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
		
		console.log("start!!");	
	 	console.log('${elvlist.size()}');
		console.log('${elvlist[0].elvname}');
		console.log('${elvlist[0].lat}');
		
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