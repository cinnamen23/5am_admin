<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">



<%@ include file="/WEB-INF/views/header.jsp"%>

<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">


<div class="content-wrapper">
	<div class="container">



		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"
				style="padding: 0; margin: 0;">
				
				<div class="panel panel-danger">
                        <div class="panel-heading">
                           엘리베이터 등록
                        </div>
                        <div class="panel-body">
                        <div style="margin: 10px">                        <form onsubmit="searchPlaces(); return false;">
									<label>주소 :</label> <input type="text" value="강남역" id="keyword" size="15">
									<button type="submit">검색하기</button>
									<br><hr />

								</form></div>
								
                            <form id="f1">
                                        
                                <div class="form-group">
                                            <label>빌딩이름</label>
                                            <input class="form-control" type="text" id="elvname">
                                     
                                        </div>
                                            <div class="form-group">
                                            <label>위도</label>
                                            <input class="form-control" type="text" id="lat">
                                     <p class="help-block">지도에 위치를 클릭 하시면 자동 완성 됩니다.</p>
                                        </div>
                                <div class="form-group">
                                            <label>경도 </label>
                                            <input class="form-control" type="text" id="lng" >
                                     <p class="help-block">지도에 위치를 클릭 하시면 자동 완성 됩니다.</p>
                                        </div>
                                
                                        <button class="btn btn-danger" type="button" id="regiBtn">등 록  </button>

                           </form>
                            </div>
                        </div>
				
			</div>
			<div class="col-md-8 col-sm-8 col-xs-12"
				style="padding: 0; margin: 0;">

				<!-- 지도 시작  -->
				<div id="map"
					style="width: 100%; height: 500px; position: relative; overflow: hidden;"></div>



				<!-- 지도 끝  -->

			</div>

		</div>



	</div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=175962b9a13ff23b6ba95789998c261c&libraries=services"></script>

<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=175962b9a13ff23b6ba95789998c261c&libraries=LIBRARY"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	//지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다
		position : map.getCenter()
	});
	// 지도에 마커를 표시합니다
	marker.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다
		var latlng = mouseEvent.latLng;

		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);	

		$("#lat").val(latlng.getLat());
		$("#lng").val(latlng.getLng());

	});

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data) {
		if (status === daum.maps.services.Status.OK) {

			var bounds = new daum.maps.LatLngBounds();

			bounds.extend(new daum.maps.LatLng(data.places[0].latitude,
					data.places[0].longitude));

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);

		} else if (status === daum.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === daum.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}
</script>

<script>
$(document).ready(function(){
	
	 $("#regiBtn").on("click",function(e){
	    	e.preventDefault();
	    	
	    	var elvname_v = $("#elvname").val();
	    	var lng_v = $("#lng").val();
	    	var lat_v = $("#lat").val();
	    	
	    	$.ajax({
		    	url:'/elevator/regi',
		    	type:'post',
		    	dataType : 'text',
		    	data : {
		    		elvname :elvname_v,
		    		lng :lng_v ,
		    		lat : lat_v,
		    	},
		    	success : function(result){
		    		
		    		$("#elvname").val("");
		    		$("#lat").val("");
		    		$("#lng").val("");
		    			
		    			console.log(result);
		    			alert("등록 되었습니다.");

		    	}
		    	
		    })
	    })
	
	
	
	
	
});

</script>



<%@ include file="/WEB-INF/views/footer.jsp"%>