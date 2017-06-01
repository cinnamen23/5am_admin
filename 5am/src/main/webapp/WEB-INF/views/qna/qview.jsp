<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>


<style>
li{
   list-style:none;
   }
</style>


<!-- Q수정쪽 모달창1 시작-->
<div class="panel panel-default">

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
     
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">질문수정
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></h5>
      </div>
      
      
        <form id="f1">
      <div class="modal-body">
      
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">Replyer:</label>
            <input type="text" class="form-control" id="title" name="title" value="${vo.title}">
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">Replytext:</label>
            <textarea class="form-control" id="content" name="content" rows="10">${vo.content}</textarea>
          </div>
          
           <input type="hidden" id="qno" name="qno" value="${vo.qno}">
            <input type="hidden" id="qwriter" name="writer" value="${vo.writer}">
            
            
            <label>
	 			File Attach
		        <input id="file" type="file" name="file" multiple="multiple">
		    </label>
                    
                    <div id="uploadPreview">
								
								</div>
      </div>
        </form>

      <div class="modal-footer">
        <button  id="qmodifyBtn" class="btn btn-secondary" data-dismiss="modal">수정</button>
        <button  type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
		</div>

      </div>
    </div>
  </div>
</div>

<!-- 모달창1 끝-->


<!-- Answermodi 모달창 -->

<div class="panel panel-default">

<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
     
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">답변수정
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></h5>
      </div>
      
      
        <form id="f3">

		<input type="hidden" name="qno" value="${vo.qno}">
		<input type="hidden" name="title" value="${vo.title}">
		<input type="hidden" name="content" value="${vo.content}">
		
		<input id="aano" type="hidden" name="aano">

      <div class="modal-body">
      
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">답변자:</label>
            <input type="text" class="form-control" id="awriter" name="awriter" val="">
          </div>
          
          
          <div class="form-group">
            <label for="message-text" class="form-control-label">답변내용:</label>
            <textarea class="form-control" id="acontent" name="acontent" rows="10"></textarea>
          </div>
          
      </div>
        </form>

      <div class="modal-footer">
        <button  id="amodifyBtn" class="btn btn-secondary" data-dismiss="modal">수정</button>
        <button  type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
		</div>

      </div>
    </div>
  </div>
</div>


<!-- Answermodi 모달창 -->









<form id="f2">
<input type="hidden" name="page" value="${cri.page}">
<input type="hidden" name="keyword" value="${cri.keyword}">
<input type="hidden" name="type" value="${cri.type}">
</form>




<div class="content-wrapper">
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line"><a href="/qna/list" style="color: black">Q&A</a></h4>

${vo}
${cri}
${alist}
${flist}
		



			</div>

		</div>

		<!-- /. ROW 1 -->


		<div class="row">
				<div class="col-md-12">
				
				<div class="row">
                <div class="col-md-12" >
                    <!-- Advanced Tables -->
                    <div class="panel panel-success">
                        <div class="panel-heading panel">글번호: ${vo.qno} 제목: ${vo.title}
                        <p  style="float: right; font: 8px">작성자: ${vo.writer}</p>
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6" >
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6" ><div id="dataTables-example_filter" class="dataTables_filter">
                <label>
             
			    </label>
                               
                                </div></div></div>
                                <div  id="dataTables-example" aria-describedby="dataTables-example_info">
                                  <div style="height: 50px;"  >
                                <p style="float: right; font-size:12px;">최종수정시간: ${vo.updatedate}</p>
                                <p style="float: right; font-size:12px;">조회수: ${read.hit}</p>
                                 </div>
                                   
                                  <div class="col-md-12 col-sm-10 col-xs-12" style="margin: auto;" >
                 
                         
                                  <div id="uploadList">

                                  <c:forEach items="${flist}" var="file">
								  <li>
                                  <img id="img" src="/display?fName=${file.filename}" style="height: 400px; width: 300px"><br/><button style="width: 300px; text-align: center;" id="fdelBtn" class="btn btn-success" data-fname="${file.filename}">삭제</button>
                                  </li>
                                  </c:forEach>
                                  
                                  <p style="line-height:300%; letter-spacing: 2px; margin: auto" >  ${vo.content}</p>
                                  </div>   
                                  <div style="height: 150px">
                                  </div>
                                  
                                  <!-- 리스트가기 -->
                                <button id="golist" class="btn btn-danger">Go List </button>
                             
                            <!--Q 수정 (모달) -->
                              <a href="" id="qmodiIcon" data-toggle="modal" data-target="#exampleModal" style="float: right; margin: 5px;"><i style="margin: 5px;width: 51px; height:51px; font-size: 3em;" class="fa fa-pencil-square-o"></i></a>
                            	 
                           	<!--Q 삭제 아이콘-->
                             <a id="qdelIcon" href="/qna/delete?qno=${vo.qno}" style="float: right; margin: 5px;"><i class="fa fa-trash-o" style="float: right; margin: 5px; width: 51px; height:51px; font-size: 3em;""></i></a>
                             
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
		

		<!-- /. ROW 1 -->
		

		
		<!-- /. AnswerROW 2 -->
		<div id="amodimodi" class="row">
		<c:forEach items="${alist}" var="AnswerVO">
		

				<div class="col-md-12">
				
				<div class="row">
                <div class="col-md-12" >
                    <!-- Advanced Tables -->
                    <div class="panel panel-danger">
                        <div class="panel-heading panel">답글
                        <p  style="float: right; font: 8px">작성자: ${AnswerVO.awriter}</p>
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6" >
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6" ><div id="dataTables-example_filter" class="dataTables_filter">
                <label>
             
			    </label>
                               
                                </div></div></div>
                                <div  id="dataTables-example" aria-describedby="dataTables-example_info">
                                  <div style="height: 50px;"  >
                                <p style="float: right; font-size:12px;">최종수정시간: ${AnswerVO.aupdatedate}</p>
                                <p style="float: right; font-size:12px;">조회수: ${read.hit}</p>
                                 </div>
                                   
                                  <div class="col-md-12 col-sm-10 col-xs-12" style="margin: auto;" >
                 
                         
                                  <div>
                                  <p style="line-height:300%; letter-spacing: 2px; margin: auto" >  ${AnswerVO.acontent}</p>
                                  </div>   
                                  <div style="height: 10px">
                                  </div>
                                  
                             
                            <!--A 수정 (모달) -->
                              <a href="" id="amodifyIcon" data-aano="${AnswerVO.aano}" data-content="${AnswerVO.acontent}" data-writer="${AnswerVO.awriter}"  data-toggle="modal" data-target="#exampleModal2" style="float: right; margin: 5px;"><i style="margin: 5px;width: 51px; height:51px; font-size: 3em;" class="fa fa-pencil-square-o"></i></a>
                            	 
                           	<!--A 삭제 아이콘-->
                             <a id="adelIcon" href="/qna/adelete?aano=${AnswerVO.aano}&qno=${vo.qno}" style="float: right; margin: 5px;"><i class="fa fa-trash-o" style="float: right; margin: 5px; width: 51px; height:51px; font-size: 3em;""></i></a>
                             
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
		
		</c:forEach>
		</div>
		<!-- /. AnswerROW 2 -->		
		
		
	<!-- 관리자& 고객 분기 -->							   
    <c:if test="${login.gubun=='admin'}"> 
		<h2>등록창</h2>
		
		 <div class="row">
	                <div class="col-md-12" >
	                
	                <div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						 <div class="panel-heading panel" style="margin-bottom: 0px;">답변을 등록합니다.</div>
						<div class="panel-body">
							
							
							<form role="form" class="fmar" id="f4">
							
							<input type="hidden" name="awriter" value="운영자">
							<input type="hidden" name="aqno" value="${vo.qno}">
								
								<div class="form-group">
									<label>답변 내용</label>
									<textarea class="form-control lcontent" rows="7" name="acontent" placeholder="질문에 대한 답변을 적어 주세요."></textarea>
								</div>
																
                                <a id="ansregi" href="#" class="btn btn-primary" style="float: right;">등록</a>
							</form>
						
						</div>
					</div>
				</div>
			</div> 
	                    </div>
	                    
	                </div>
		
		
						    </c:if>
			<!-- 관리자& 고객 분기 끝 -->	
		
		
		
		
		
		
		
	</div>
</div>


	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	

<script>

$(document).ready(function() {

	var msg="${msg}";
	if(msg=="success"){
		history.pushState(null,null);
		alert("수정이 완료되었습니다 . ")
		window.onpopstate=function(e){
			history.go(1);
		}
	}
	
	
	function readImage(file) {
	    var reader = new FileReader();
	    var image  = new Image();
	    reader.readAsDataURL(file);  
	    reader.onload = function(_file) {
	        image.src    = _file.target.result;              // url.createObjectURL(file);
	        image.onload = function() {
	            var w = this.width,
	                h = this.height,
	                t = file.type,                           // ext only: // file.type.split('/')[1],
	                n = file.name,
	                s = ~~(file.size/1024) +'KB';
	            if(w > 10000 || h >5000){
	                alert("1000*500px 이하로 맞춰주세요(비율2:1)");
	                $("#file").val("");
	                
	            }else{
	            	console.log("===========================");
	            	console.log(this.src);
	                  $('#uploadPreview').append('<img src="'+ this.src +'" width="200" height="100">');  
	            }
	          
	        };
	        image.onerror= function() {
	            alert('해당형식은 지원하지 않습니다. 파일형식:JPG,PNG');
	            $("#file").val("");
	        };      
	    };
	}
	
	
	/* 여기서 파일 네임을 ㅇ떻게 가지고 오지 ? */
$("#file").on("click",function(e){
	var result=confirm("파일 수정을 하시면 이전 등록된 사진이 모두 지워집니다.")
	
	console.log('${flist[0].filename}');
	
	var fnamelist='${flist}';
	console.log(fnamelist.length)
	
	for(var i=0; i<fnamelist.size; i++) {
		console.log(fnamelist[i]);
	}
	
	
	if(result==false){
	e.preventDefault();		
	}
	
	$.ajax({
		type:'post',
		url:'/qna/falldelete',
		data:{fname:$(this).attr("data-fname")},
		success:function(re){
			if(re=='delete')
			alert("deleted");
		}
	}); 
	
})	
$("#file").change(function (e) {
	
		
		$("#uploadPreview img").remove();
		
		console.log("===========================");
		console.log($('#file'));
		
		
	    if(this.disabled) return alert('File upload not supported!');
	    console.log(this.files);
	    var F = this.files;
	    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i] );
	});  
	





	$('#qregibtn').on("click", function(e) {
			e.preventDefault();	

			console.log("들어왔으 ");
			console.log($('#qtitle').val());				
			if ($('#qtitle').val().length == 0) {
				alert("제목을 입력해주세요....");
			}else if($('#qcontent').val().length == 0){
				alert("내용을 입력해주세요....");
			}else if($('#qwriter').val().length == 0){
				alert("작성자를 입력해주세요....");
			}else{
				$('#f1').submit();
			}
		
	});
	
	
	
	$('#qmodifyBtn').on("click", function(e) {

		var result = confirm('수정을  하시겠습니까??'); 

		
		if(result){
		
		console.log("modifyBtn in-----------------------------------");
		

		var formObj = $('#f1');

		formObj.attr('action', '/qna/qview');
		formObj.attr('method', 'post');
		formObj.submit();  /* #f1 에 들어있는거 bno page type keyword */
		}
		
		e.preventDefault();
		

	});
	
	$('#amodifyBtn').on("click", function(e) {

		console.log("amodifyBtn in-----------------------------------");
		
		e.preventDefault();
		
		console.log($('#f3'));
		
		var result = confirm('수정을  하시겠습니까??'); 
		
		if(result){
		var formObj = $('#f3');

		
		/* 여기까지는 들어왔 */
		
		formObj.attr('action', '/qna/amodi');
		formObj.attr('method', 'post');
		formObj.submit();
		}		
		
	});
	
	$('#amodimodi #amodifyIcon').on("click", function(e) {

		console.log("AmodifyIcon in-----------------------------------");
		
		e.preventDefault();

		console.log($(this));
		
		var passwriter=$(this).attr("data-writer");
		var passcontent=$(this).attr("data-content");
		var passaano=$(this).attr("data-aano");

		
		console.log(passwriter);
		console.log(passcontent);
		console.log(passaano);		
		$("#awriter").val(passwriter);
		$("#acontent").val(passcontent);
		$("#aano").val(passaano);
		
	});
	
	

	$('#golist').on("click", function(e) {

		console.log("golist in-----------------------------------");
		
		e.preventDefault();

		var formObj = $('#f2');

		formObj.attr('action', '/qna/list');
		formObj.attr('method', 'get');
		formObj.submit();
		
		/* location.href="/qna/list";  바로 그냥 폼 안쏘고 가는방법*/
	
		
	});
	

	$('#ansregi').on("click", function(e) {

		console.log("ansregi in-----------------------------------");
		
		e.preventDefault();

		var formObj = $('#f4');

		formObj.attr('action', '/qna/aregi');
		formObj.attr('method', 'post');
		formObj.submit(); 
		
		/* location.href="/qna/list";  바로 그냥 폼 안쏘고 가는방법*/
	
		
	});
	
	//삭제
	
	$("#uploadList li button").on("click",function(e){
		
		var result = confirm('사진을  지우시겠습니까??'); 
		
		if(result==true){
		var $target = $(e.target);
		$target.parent().remove();
		console.log($(this).attr("data-fname"));
		
		
		var fname=e.currentTarget.dataset.fname
		 $.ajax({
			type:'post',
			url:'/qna/fdelete',
			data:{fname:$(this).attr("data-fname")},
			success:function(re){
				if(re=='delete')
				alert("deleted");
			}
		}); 
		
		}
		
	});
	
	
	
	$('#qdelIcon').on("click", function(e) {

		
		var result = confirm('질문을  지우시겠습니까??'); 
		
		if(result!=true){
		e.preventDefault();		
		}
		
	});
	
$('#adelIcon').on("click", function(e) {

		
		var result = confirm('답변을  지우시겠습니까??'); 
		
		if(result!=true){
		e.preventDefault();		
		}
		
	});
	


		
		
	});
	
	
	
	


</script>



<%@ include file="/WEB-INF/views/footer.jsp"%>