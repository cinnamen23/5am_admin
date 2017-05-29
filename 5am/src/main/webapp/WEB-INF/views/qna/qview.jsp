<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

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
		
		<input type="hidden" name="aano">

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
                 
                         
                                  <div>
                                  <p style="line-height:300%; letter-spacing: 2px; margin: auto" >  ${vo.content}</p>
                                  </div>   
                                  <div style="height: 150px">
                                  </div>
                                  
                                  <!-- 리스트가기 -->
                                <button id="golist" class="btn btn-danger">Go List </button>
                             
                            <!-- 수정 (모달) -->
                              <a href="" data-toggle="modal" data-target="#exampleModal" style="float: right; margin: 5px;"><i class="glyphicon glyphicon-wrench"></i></a>
                            	 
                           	<!-- 삭제 아이콘-->
                             <a href="/qna/delete?qno=${vo.qno}" style="float: right; margin: 5px;"><i class="glyphicon glyphicon-trash" style="float: right; margin: 5px;"></i></a>
                             
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
		<c:forEach items="${alist}" var="AnswerVO">
		

		<div class="row">
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
                                  
                             
                            <!-- 수정 (모달) -->
                              <a href="" id="amodifyIcon" data-aano="${AnswerVO.aano}" data-content="${AnswerVO.acontent}" data-writer="${AnswerVO.awriter}"  data-toggle="modal" data-target="#exampleModal2" style="float: right; margin: 5px;"><i class="glyphicon glyphicon-wrench"></i></a>
                            	 
                           	<!-- 삭제 아이콘-->
                             <a href="/qna/adelete?aano=${AnswerVO.aano}&qno=${vo.qno}" style="float: right; margin: 5px;"><i class="glyphicon glyphicon-trash" style="float: right; margin: 5px;"></i></a>
                             
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
		
		</c:forEach>
		<!-- /. AnswerROW 2 -->		
		
		
		
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
		
		
		
		
		
		
		
		
		
		
	</div>
</div>


	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	

<script>

$(document).ready(function() {
	
	
	$('#qmodifyBtn').on("click", function(e) {

		console.log("modifyBtn in-----------------------------------");
		
		e.preventDefault();

		var formObj = $('#f1');

		formObj.attr('action', '/qna/qview');
		formObj.attr('method', 'post');
		formObj.submit();  /* #f1 에 들어있는거 bno page type keyword */

	});
	
	$('#amodifyBtn').on("click", function(e) {

		console.log("amodifyBtn in-----------------------------------");
		
		e.preventDefault();
		console.log($('#f3'));
		
		var formObj = $('#f3');

		
		/* 여기까지는 들어왔 */
		
		formObj.attr('action', '/qna/amodi');
		formObj.attr('method', 'post');
		formObj.submit();
		
	});
	
	$('#amodifyIcon').on("click", function(e) {

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
	
	
	
	
});


</script>



<%@ include file="/WEB-INF/views/footer.jsp"%>