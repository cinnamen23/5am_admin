<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>

 <div class="content-wrapper">
         <div class="container">
	        <div class="row pad-botm">
	            <div class="col-md-12">
	               
	                        ${login}
	                <h4 class="header-line">당신의 꿈을 여는 시간</h4> 
	            </div>
	        </div>
             
             <div class="row">
            
                 
              <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-bars fa-5x"></i>
                            <h3>${totalCount} 명</h3>
                           내 광고를 찜 한 고객 수
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-info back-widget-set text-center">
                            <i class="fa fa-history fa-5x"></i>
                            <h3>500+&nbsp; <i class="fa fa-dollar"></i></h3>
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
                        <div class="item active">

                            <img src="assets/img/1.jpg" alt="" />
                           
                        </div>
                        <div class="item">
                            <img src="assets/img/2.jpg" alt="" />
                          
                        </div>
                        <div class="item">
                            <img src="assets/img/3.jpg" alt="" />
                           
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
                          <h3> 현재 <${login.sid }>님이</br> 로그인 되었습니다.</h3> 
                          <hr />
                          <p>
                        
                         ${login.sname }</br>
                         ${login.saddr }</br>
                         ${login.sphone }</br>
                         ${login.semail }</br>
                         
                        </p>
                          <hr />
                           <a href="#" class="btn btn-info">정보 수정</a> 
                        </div>
                    
             </div>
             
                 </div>
            

             <div class="row">
                 <div class="col-md-4 col-sm-4 col-xs-12">
 <div class="panel panel-default">
                        <div class="panel-heading">
                           Recent Users
                        </div>
                        <div class="panel-body text-center recent-users-sec">
<img class="img-thumbnail" src="assets/img/user.gif" />
                            <img class="img-thumbnail" src="assets/img/user2.png" />
                            <img class="img-thumbnail" src="assets/img/user.gif" />
                            <img class="img-thumbnail" src="assets/img/user2.png" />
                            <img class="img-thumbnail" src="assets/img/user.gif" />
                               <img class="img-thumbnail" src="assets/img/user2.png" />
                            <img class="img-thumbnail" src="assets/img/user.gif" />
                            <img class="img-thumbnail" src="assets/img/user2.png" />
                            <img class="img-thumbnail" src="assets/img/user.gif" />
                        </div>
     </div>
             </div>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                      
                      
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
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
             </div>
             
             </div>
             <div class="row">
                 
                 <div class="col-md-8 col-sm-8 col-xs-12">
                     <div class="panel panel-warning">
                        <div class="panel-heading">
                           Recent Comments
                        </div>
                        <div class="panel-body">
                            <ul class="media-list">
                        
      <li class="media">
        <a class="pull-left" href="#">
          <img class="media-object img-circle img-comments" src="assets/img/user.gif" />
        </a>
        <div class="media-body">
          <h4 class="media-heading">Lorem ipsum dolor sit amet</h4>
          <p>
              Donec sit amet ligula enim. Duis vel condimentum massa.
               Maecenas eget congue dui
               interdum nibh et, volutpat dolor.
          </p>
          <!-- Nested media object -->
          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object img-circle img-comments" src="assets/img/user2.png">
            </a>
            <div class="media-body">
              <h4 class="media-heading">Nulla gravida vitae neque </h4>
             Donec sit amet ligula enim. Duis vel condimentum massa.
               Maecenas eget congue dui. Vestibulum et eros consectetur,
               interdum nibh et, volutpat dolor.
              <!-- Nested media object -->
              <div class="media">
                <a class="pull-left" href="#">
                 <img class="media-object img-circle img-comments" src="assets/img/user.gif" />
                </a>
                <div class="media-body">
                  <h4 class="media-heading">Donec sit amet ligula enim</h4>
                     Donec sit amet ligula enim. Duis vel condimentum massa.
               Maecenas eget congue dui. Vestibulum et eros consectetur,
               interdum nibh et, volutpat dolor.
                </div>
              </div>
            </div>
          </div>
        
        </div>
      </li>
       
    </ul>
                            </div>
                         </div>
                     
                 </div>
                 <div class="col-md-4 col-sm-4 col-xs-12" >
                 <div class="panel panel-primary ">
                        <div class="panel-heading">
                            Recent Chat History
                        </div>
                        <div class="panel-body chat-widget-main">
                            <div class="chat-widget-left">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           Lorem ipsum dolor.
                            </div>
                            <div class="chat-widget-name-left">
                                <img class="media-object img-circle img-left-chat" src="assets/img/user2.png" />
                                <h4>  Amanna Seiar</h4>
                                <h5>Time 2:00 pm at 25th july</h5>
                            </div>
                            <hr />
                            <div class="chat-widget-right">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           Lorem ipsum dolor sit amet.
                            </div>
                            <div class="chat-widget-name-right">
                                 <img class="media-object img-circle img-right-chat" src="assets/img/user2.png" />
                                <h4>  Amanna Seiar</h4>
                                <h5>Time 2:00 pm at 25th july</h5>
                            </div>
                            <hr />
                            <div class="chat-widget-left">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           Lorem ipsum dolor sit amet.
                            </div>
                            <div class="chat-widget-name-left">
                                 <img class="media-object img-circle img-left-chat" src="assets/img/user2.png" />
                                <h4>  Amanna Seiar</h4>
                                <h5>Time 2:00 pm at 25th july</h5>
                            </div>
                            <hr />
                            <div class="chat-widget-right">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                           Lorem ipsum dolor sit amet.
                            </div>
                            <div class="chat-widget-name-right">
                               <img class="media-object img-circle img-right-chat" src="assets/img/user2.png" />
                                <h4>  Amanna Seiar</h4>
                                <h5>Time 2:00 pm at 25th july</h5>
                            </div>
                            <hr />
                        </div>

                    </div>
                 
                 
                 
                 
                        
                 </div>
             </div>
            <div class="row">
    <div class="col-md-6">
                          <div class="panel panel-default">
                        <div class="panel-heading">
                            Alerts Examples
                        </div>
                        <div class="panel-body">
                            <h5><strong>Simple Alert</strong></h5>
                            <div class="alert alert-info">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a href="#" class="alert-link">Alert Link</a>.
                            </div>
                            Info: You can use other classes like <i>alert-success</i> , <i>alert-warning</i> &amp; <i>alert-danger</i> instead of <i>alert-info</i>
                           <br />
                              <h5><strong>Dismissable Alert</strong></h5>
                            <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a href="#" class="alert-link">Alert Link</a>.
                            </div>
                            Info: You can use other classes like <i>alert-info</i> , <i>alert-warning</i> &amp; <i>alert-danger</i> instead of <i>alert-success</i>
                           <hr />
                            <h5> <strong> ICON EXAMPLES </strong></h5>
                             <i class="fa fa-briefcase "></i>
                            
                             <i class="fa fa-briefcase fa-2x"></i>
                              <i class="fa fa-briefcase fa-3x"></i>
                              <i class="fa fa-briefcase fa-4x"></i>
                              <i class="fa fa-briefcase fa-5x"></i>
                              <br />
                             <br />
                            <i class="fa fa-recycle "></i>
                            
                             <i class="fa fa-recycle fa-2x"></i>
                              <i class="fa fa-recycle fa-3x"></i>
                              <i class="fa fa-recycle fa-4x"></i>
                              <i class="fa fa-recycle fa-5x"></i>
                              <br />
                              <p class="alert alert-warning">
                        For more customization Of icons please visit website : fortawesome.github.io/Font-Awesome/icons/ or  <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank">Click here</a> . You will get all font-awesome icons and there classes there.
                        </p>

                             </div>
                              </div>
                     </div>
                <div class="col-md-6">
                     <div class="panel panel-info">
                        <div class="panel-heading">
                            Compose a Message
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                        <div class="form-group">
                                            <label>Enter Name</label>
                                            <input class="form-control" type="text" />
                                        </div>
                                 <div class="form-group">
                                            <label>Enter Email</label>
                                            <input class="form-control" type="text" />
                                        </div>
                                <div class="form-group">
                                            <label>Subject</label>
                                            <input class="form-control" type="text" />
                                        </div>
                                 <div class="form-group">
                                            <label>Enter Message</label>
                                            <input class="form-control" type="text" style="min-height:100px;" />
                                        </div>
                                       
                                        <div class="form-group">
                                            <label>Attach File </label>
                                            <input type="file" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>For Role </label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="" />Webmaster 
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="" />Admin
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="" />Employee
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="" />User
                                                </label>
                                            </div>
                                        </div>
                                        
                                       
                                        <button type="submit" class="btn btn-success">Send Message </button>
                                        <button type="reset" class="btn btn-primary">Reset Fields</button>

                                    </form>
                            </div>
                        </div>
                </div>

            </div>

    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
	<!-- CONTENT-WRAPPER SECTION END-->
	
<%@ include file="/WEB-INF/views/footer.jsp" %>