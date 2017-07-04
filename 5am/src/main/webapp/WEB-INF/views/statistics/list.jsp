<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
    <%@ include file="/WEB-INF/views/header.jsp" %>
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- Morris charts -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap 3.0.2 -->

   <div class="content-wrapper">
		<div class="container">

                <!-- Content Header (Page header) -->
                <div class="row pad-botm">
                <section >
                    <h2>광고 분석 <small>${getTotalView}</small> </h2>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- AREA CHART -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">타겟별 광고 재생 수</h3>
                                    <div style="text-align: right; margin:10px;">기간 
                               		<select id="AreaTerm" >
                                    	<option value=7>1주</option>
       									<option value=14>2주</option>
       									<option value=21>3주</option>
       									<option value=28>4주</option>
                                    </select> 대상
	                                    <select id="AreaTarget" >
                                    	<c:if test="${ad.target1!=null}" ><option value=${ad.target1}>${ad.target1}</option></c:if>
       									<c:if test="${ad.target2!=null}" ><option value=${ad.target2}>${ad.target2}</option></c:if>
       									<c:if test="${ad.target3!=null}" ><option value=${ad.target3}>${ad.target3}</option></c:if>
       									<c:if test="${ad.target4!=null}" ><option value=${ad.target4}>${ad.target4}</option></c:if>
                                    </select>
                                    </div>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="revenue-chart" style="height: 300px;"><h3>데이터가 없습니다</h3></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                            <!-- DONUT CHART -->
                            <div class="box box-danger">
                                <div class="box-header">
                                    <h3 class="box-title">타겟별 시청 수</h3>
                                    <div style="text-align: right; margin:10px;">기간
                                <select id="DonutTerm" >
                                    	<option value=7>1주</option>
       									<option value=14>2주</option>
       									<option value=21>3주</option>
       									<option value=28>4주</option>
                                </select>
                                    </div>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="sales-chart" style="height: 300px; position: relative;"><h3>데이터가 없습니다</h3></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                            
                        </div><!-- /.col (LEFT) -->
                        <div class="col-md-6">
                            <!-- LINE CHART -->
                            <div class="box box-warning">
                                <div class="box-header">
                                    <h3 class="box-title">총 광고 재생 수</h3>
	                                <div style="text-align: right; margin:10px;">기간
	                                <select id="LineTerm" >
	                                    	<option value=7>1주</option>
	       									<option value=14>2주</option>
	       									<option value=21>3주</option>
	       									<option value=28>4주</option>
	                                </select>
	                                </div>
                                </div>  	
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="line-chart" style="height: 300px;"><h3>데이터가 없습니다</h3></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                            <!-- BAR CHART -->
                            <div class="box box-success">
                                <div class="box-header">
                                    <h3 class="box-title">광고 시청후 평균 감정변화</h3>
                                    <div style="text-align: right; margin:10px;">기간
                                    <select id="BarTerm" >
                                    	<option value=7>1주</option>
       									<option value=14>2주</option>
       									<option value=21>3주</option>
       									<option value=28>4주</option>
                                    </select> 
                                    	 대상
                                    <select id="BarTarget" >
       									<option value="target">모든 타겟</option>
                                    	<c:if test="${ad.target1!=null}" ><option value=${ad.target1}>${ad.target1}</option></c:if>
       									<c:if test="${ad.target2!=null}" ><option value=${ad.target2}>${ad.target2}</option></c:if>
       									<c:if test="${ad.target3!=null}" ><option value=${ad.target3}>${ad.target3}</option></c:if>
       									<c:if test="${ad.target4!=null}" ><option value=${ad.target4}>${ad.target4}</option></c:if>
                                    </select>
                                    </div>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="bar-chart" style="height: 300px;"><h3>데이터가 없습니다</h3></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                        </div><!-- /.col (RIGHT) -->
                    </div><!-- /.row -->

                </section><!-- /.content -->
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	
	
	<!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <!-- Morris.js charts -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>

        <!-- AdminLTE App -->

        <!-- page script -->
<script type="text/javascript">
        
var $sid= ${statistics}[0].sid;



    $(function() {
        "use strict";
        scountPerTarget();
        scount();
    	emotion();
    	scountPerDay();
        
// scountPerTarget 일주일간 타겟별 재생 횟수
function scountPerTarget() {
	var $AreaTerm = $("#AreaTerm").val();	
	var $AreaTarget = $("#AreaTarget").val();	
	
		$.ajax({
        	url:'/statistics/scountPerTarget',
        	type:'post',
        	dataType : 'json',
        	data : {sid: $sid, AreaTerm: $AreaTerm, AreaTarget: $AreaTarget},
        	success : function(result){
        		
        		var scountPerTargetArr = [];
        		for(var j=0;j<result.length; j++){
        			scountPerTargetArr.push({y: result[j].fear, item1: result[j].scount});
                }
        		var area = new Morris.Area({
                    element: 'revenue-chart',
                    resize: true,
                    data: scountPerTargetArr,
                    xkey: 'y',
                    ykeys: ['item1'],
                    labels: ['타겟'],
                    lineColors:['#77f'],
                    hideHover: 'auto'
                });
        	
			if (scountPerTargetArr.length==0){
				$('#revenue-chart').html('<h3>데이터가 없습니다</h3>');
			}
        	}
        });
}
$('#AreaTerm').change(function(){
	$('#revenue-chart').html('');
	scountPerTarget();
});
$('#AreaTarget').change(function(){
	$('#revenue-chart').html('');
	scountPerTarget();
});

        
        
// scountPerDay 하루당 재생횟수
function scountPerDay() {
			var $LineTerm = $("#LineTerm").val();
	        $.ajax({
	        	url:'/statistics/scountPerDay',
	        	type:'post',
	        	dataType : 'json',
	        	data : {
	        			sid: $sid, LineTerm: $LineTerm
	        	},
	        	success : function(result){
	        		var scountDayArr = [];
	        		for(var j=0;j<result.length; j++){
	        			var str = result[j].sno+"";
	            		var yy= str.slice(0,4)+'-';
	            		var mm= str.slice(4,6)+'-';
	            		var dd= str.slice(6,8);
	            		var date=yy+mm+dd;
	        			scountDayArr.push({y:  date, item1: result[j].sview});
	                }
	                var line = new Morris.Line({
	                    element: 'line-chart',
	                    resize: true,
	                    data: scountDayArr ,
	                    xkey: 'y',
	                    ykeys: ['item1'],
	                    labels: ['재생횟수'],
	                    lineColors: ['#fa7'],
	                    hideHover: 'auto'
	                });
	
	        	}
	        });
}
$('#LineTerm').change(function(){
	$('#line-chart').html('');
	scountPerDay();
});

        
  
//scount 타겟별 시청횟수
function scount() {
	var $donutTerm=  $("#DonutTerm").val();
        $.ajax({
        	url:'/statistics/scount',
        	type:'post',
        	dataType : 'json',
        	data : {
        			sid: $sid,  donutTerm: $donutTerm
        	},
        	success : function(result){
        		var scountArr = [];
        		
        		for(var j=0;j<result.length; j++){
        			scountArr.push({label: result[j].target, value: result[j].scount});
                }
                
                var donut = new Morris.Donut({
                    element: 'sales-chart',
                    resize: true,
                    colors: [ '#f56954', '#fa7','#00a65a','#3c8dbc'],
                    data: scountArr,
                    hideHover: 'auto'
                });
        	}
        });
}
$('#DonutTerm').change(function(){
	$('#sales-chart').html('');
	scount();
});

      
      
function emotion() {      
	
        var $BarTerm = $("#BarTerm").val();
        var $BarTarget = $("#BarTarget").val();
        //emotion 평균 감정변화
        $.ajax({
        	url:'/statistics/emotion',
        	type:'post',
        	dataType : 'json',
        	data : {
        			sid: $sid, BarTerm: $BarTerm, BarTarget: $BarTarget
        	},
        	success : function(result){
        		var emotionArr = [];
        			emotionArr.push({y: 'happiness', a: result.happiness});
        			emotionArr.push({y: 'surprise', a: result.surprise});
        			emotionArr.push({y: 'neutral', a: result.neutral});
        			emotionArr.push({y: 'sadness', a: result.sadness});
        			emotionArr.push({y: 'disgust', a: result.disgust});
        			emotionArr.push({y: 'fear', a: result.fear});
        			emotionArr.push({y: 'anger', a: result.anger});
        			emotionArr.push({y: 'contempt', a: result.contempt});
                
                var bar = new Morris.Bar({
                    element: 'bar-chart',
                    resize: true,
                    data: emotionArr,
                    barColors: ['#00a65a', '#3c8dbc', '#fa7', '#f56954'],
                    xkey: 'y',
                    ykeys: ['a'],
                    labels: ['감정변화'],
                    hideHover: 'auto'
                });
        	},
        	error:function(request,status,error){
    				$('#bar-chart').html('<h3>데이터가 없습니다</h3>');
        	}


        });
}
$('#BarTerm').change(function(){
	$('#bar-chart').html('');
	emotion();
});
$('#BarTarget').change(function(){
	$('#bar-chart').html('');
	emotion();
});
        

    });
</script>
 
                
	
<%@ include file="/WEB-INF/views/footer.jsp" %>