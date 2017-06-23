<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/header.jsp"%>

<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">


<div class="content-wrapper">
	<div class="container">



		<div class="row">
		<div class="col-md-12">
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
					style="width: 100%; height: 515px; position: relative; overflow: hidden;"></div>



				<!-- 지도 끝  -->

			</div>

		</div></div>




				
				<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-danger">
                        <div class="panel-heading panel">Elevator List  </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter">
                
                <label>
                <form class="form" method="get" action="/elevator/list">
				<input class="hopage" type="hidden" name="page"value="${pageMaker.current}"> 
				<input class="view"type="hidden" name="eno"> 
                <select name="type" class="type">
				<option value="n" ${cri.type eq null?'selected':''}>---</option>
				<option value="t" ${cri.type eq 't'?'selected':''}>건물 이름</option>
			    </select> 
			    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword" value="${cri.keyword}"><button id="btnn" class="btn btn-danger">Search</button>
			    </form>
			    </label>
                               
                                </div></div></div><table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 50px;">번호</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 300px; text-align: center;">건물 이름</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 300px; text-align: center;">위도</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 300px; text-align: center;">경도</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 300px; text-align: center;">등록일자</th>
                                    <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 300px; text-align: center;">삭제</th>
                                    </thead>
                                    <tbody>
                                        
                                      
                                       
                                     <c:forEach var="list" items="${list}">
                                    <tr class="gradeA odd" style="text-align: center">
                                            <td >${list.eno}</td>
                                            <td>${list.elvname}</a></td>
                                            <td>${list.lat} </td>
                                            <td>${list.lng} </td>
                                            <td>${list.regdate}</td>
                                            <td data-eno="${list.eno}" data-elvname="${list.elvname}">
												<a class="elvdel" href="#" ><i class="glyphicon glyphicon-remove"></i></a>
											</td>
                                         
                                        </tr>
                                        </c:forEach>   
                                        </tbody>
                                </table>
                                <div>결과 : ${count} 건이 있습니다.</div>
                               
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                
							    </div>
                                </div>
                                <div class="col-sm-6">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination">
                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><c:if test="${pageMaker.prev}"><a href="${pageMaker.start-1}">이전</a></c:if></li>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" 
                                var="pagege">
                                <a href="${pagege}">
			                 	<li class='${pagege == pageMaker.current?"paginate_button active":""}' aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
			                 	</c:forEach> 
                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><c:if test="${pageMaker.next}"><a href="${pageMaker.end+1}">다음</a></c:if></li>
                                </ul>
                                </div>
     
                                </div>
                                </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
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
	

	$(".pagination a").on("click", function(e) {

		e.preventDefault();

		$(".hopage").val($(this).attr("href"));

		$(".form").submit();
	})
	
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
		    			location.reload();

		    	}
		    	
		    })
	    })
	    
	    
	    
			
			 $("#btnn").on("click", function(e) {
				e.preventDefault();
				$(".hopage").val("1");
			
				$(".form").submit();
			
			}) 
	    
	
	
	    	$(".elvdel").on("click", function(e) {
			e.preventDefault();
			if (confirm("정말 삭제하시겠습니까??") == true) {
				console.log("delete......");

				var elve = $(this).parent();
				var elveno = elve.attr("data-eno");
				var elvname = elve.attr("data-elvname");				
				
				console.log(elveno);
				
				var formData = new FormData();
				formData.append("eno",elveno);
				formData.append("elvname",elvname);
				
				
				
				
				$.ajax({ 
					type: 'post' ,
					url: '/elevator/delete' ,
					data : formData ,
					processData:false,
    				contentType:false,
    				dataType : 'text',
					success: function(data) {
						alert(data)
						location.reload();
						/* location.href= ""; */
							}
						})

			

		}
			})
	    
	    
	
	
	
});

</script>





<%@ include file="/WEB-INF/views/footer.jsp"%>