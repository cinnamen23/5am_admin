<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
    <%@ include file="/WEB-INF/views/header.jsp" %>
<meta charset="UTF-8">
        <title>AdminLTE | Morris.js Charts</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris charts -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

   <div class="content-wrapper">
		<div class="container">
			
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>광고 분석 <small>감정변화</small> </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Charts</a></li>
                        <li class="active">Morris</li>
<%--                         <li>총 시청횟수 : ${statistics.sview}</li> --%>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- AREA CHART -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">한주간 타겟별 시청 현황</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="revenue-chart" style="height: 300px;"></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                            <!-- DONUT CHART -->
                            <div class="box box-danger">
                                <div class="box-header">
                                    <h3 class="box-title">타겟별 시청 수</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="sales-chart" style="height: 300px; position: relative;"></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                            
                        </div><!-- /.col (LEFT) -->
                        <div class="col-md-6">
                            <!-- LINE CHART -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">하루 광고 재생 수</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="line-chart" style="height: 300px;"></div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                            <!-- BAR CHART -->
                            <div class="box box-success">
                                <div class="box-header">
                                    <h3 class="box-title">광고 시청후 평균 감정변화</h3>
                                </div>
                                <div class="box-body chart-responsive">
                                    <div class="chart" id="bar-chart" style="height: 300px;"></div>
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
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>

        <!-- page script -->
<script type="text/javascript">
        
var $sid= ${statistics}[0].sid;



    $(function() {
        "use strict";

        // scountPerTarget 일주일간 타겟별 시청횟수
                $.ajax({
        	url:'/statistics/scountPerTarget',
        	type:'post',
        	dataType : 'json',
        	data : {
        			sid: $sid
        	},
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
                    ykeys: ['item1', 'item2','item3', 'item4'],
                    labels: [result[0].target, 'Item 2','Item 3', 'Item 4'],
                    lineColors:['#77f', '#fa7','#00a65a','#f56954'],
                    hideHover: 'auto'
                });
        	

        	}
        });

                
        
        // scountPerDay 하루당 재생횟수
        $.ajax({
        	url:'/statistics/scountPerDay',
        	type:'post',
        	dataType : 'json',
        	data : {
        			sid: $sid
        	},
        	success : function(result){
        		var scountDayArr = [];
        		for(var j=0;j<result.length; j++){
        			var str = result[j].sno+"";
            		var yy= str.slice(0,4)+'-';
            		var mm= str.slice(4,6)+'-';
            		var dd= str.slice(6,8);
            		var date=yy+mm+dd;
        			scountDayArr.push({y: date, item1: result[j].sview});
                }
                var line = new Morris.Line({
                    element: 'line-chart',
                    resize: true,
                    data: scountDayArr 
/*                     	 [
                        {y: '2011-01-11', item1: 5},
                        {y: '2011-01-12', item1:4},
                        {y: '2011-01-13', item1: 0},
                        {y: '2011-01-14', item1: 3},
                        {y: '2011-01-15', item1: 3},
                        {y: '2011-01-16', item1:5},
                    ]  */
                ,
                    xkey: 'y',
                    ykeys: ['item1'],
                    labels: ['재생횟수'],
                    lineColors: ['#3c8dbc'],
                    hideHover: 'auto'
                });

        	}
        });


  
      //scount 타겟별 시청횟수
        $.ajax({
        	url:'/statistics/scount',
        	type:'post',
        	dataType : 'json',
        	data : {
        			sid: $sid
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

        
        //emotion 평균 감정변화
        $.ajax({
        	url:'/statistics/emotion',
        	type:'post',
        	dataType : 'json',
        	data : {
        			sid: $sid
        	},
        	success : function(result){
        		var emotionArr = [];
/*         		for(var j=0;j<result.length; j++){
        			emotionArr.push({y: happy, a: result[j].happiness});
        			emotionArr.push({y: surprise, a: result[j].surprise});
        			emotionArr.push({y: neutral, a: result[j].neutral});
        			emotionArr.push({y: sadness, a: result[j].sadness});
        			emotionArr.push({y: disgust, a: result[j].disgust});
        			emotionArr.push({y: fear, a: result[j].fear});
        			emotionArr.push({y: anger, a: result[j].anger});
        			emotionArr.push({y: contempt, a: result[j].contempt});
                } */
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
                    data: emotionArr
                    	/* [ 
        	            {y: 'happy', a: $happy, b: 90, c: $happy+10, d: 70},
                        {y: 'surprise', a: $surprise, b: 65, c: $surprise-10, d: 60},
                        {y: 'neutral', a: $neutral, b: 40, c: $neutral+30, d: 90},
                        {y: 'disgust', a: $disgust, b: 65, c: $disgust-5, d: 50},
                        {y: 'sadness', a: $sadness, b: 40, c: $sadness-10, d: 45},
                        {y: 'fear', a: $fear, b: 65, c: $fear-1, d: 40},
                        {y: 'anger', a: $anger, b: 90, c: $anger+10, d: 47},
                        {y: 'contempt', a: $contempt, b: 90, c: $happy-10, d: 84} 

                    ] */,
                    barColors: ['#00a65a', '#3c8dbc', '#fa7', '#f56954'],
                    xkey: 'y',
                    ykeys: ['a'],
                    labels: ['감정변화'],
                    hideHover: 'auto'
                });
        	}
        });
        

    });
</script>
 
                
	
<%@ include file="/WEB-INF/views/footer.jsp" %>