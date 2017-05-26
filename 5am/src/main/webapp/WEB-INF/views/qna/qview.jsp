<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>


<h2>${vo}</h2>
<h2>${pageMaker}</h2>
<h2>${cri}</h2>

<!-- 모달창1 시작-->
<div class="panel panel-default">

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
     
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 댓글 달기
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
        <button  id="modifyBtn" class="btn btn-secondary" data-dismiss="modal">수정</button>
        <button  type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
		</div>

      </div>
    </div>
  </div>
</div>

<!-- 모달창1 끝-->





<div class="content-wrapper">
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">UI ELEMENTS</h4>

			</div>

		</div>

		<!-- /. ROW  -->


		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-success">
					<div class="panel-heading">Simple Progress Bars</div>

					<div class="panel-body">
						
						
						<!-- 상세보기 -->
					<div class="table-responsive">
						 <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 189px;">번호</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 291px;">제목</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 291px;">내용</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 264px;">글쓴이</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 160px;">등록날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 113px;">갱신날짜</th>
                                    	<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 113px;">mod&del</th></tr>
                                    </thead>
                                   
                                    <tbody>
                                     	
                                        <tr class="gradeA odd">
                                        
                                        	<td class="sorting_1" >${vo.qno} </td>
                                            <td class=" ">${vo.title}</td>
                                            <td class=" ">${vo.content}</td>
                                            <td class=" ">${vo.writer}</td>
                                            <td class="center ">${vo.regdate}</td>
                                            <td class="center ">${vo.updatedate}</td>
                                            <td class="center">
                                            <a href="" data-toggle="modal" data-target="#exampleModal"><i class="glyphicon glyphicon-wrench"></i></a>
                                            <a href="/qna/delete?qno=${vo.qno}"><i class="glyphicon glyphicon-remove"></i></a>
                                            </td>                                        
                                        </tr>
                                       
                                       </tbody>
                                       
                                </table>
						</div>
						<!-- 상세보기 -->						
						<button id="golist" class="btn btn-danger">Go List </button>
						
						
					</div>
				</div>
			</div>
		</div>



		<!-- /. ROW  -->
	</div>
</div>


	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	

<script>

$(document).ready(function() {
	
	$('#modifyBtn').on("click", function(e) {

		console.log("modifyBtn in-----------------------------------");
		
		e.preventDefault();

		var formObj = $('#f1');

		formObj.attr('action', '/qna/qview');
		formObj.attr('method', 'post');
		formObj.submit();  /* #f1 에 들어있는거 bno page type keyword */

	});
	

	$('#golist').on("click", function(e) {

		console.log("golist in-----------------------------------");
		
		e.preventDefault();

		location.href="/qna/list";
	
		
	});
	
	
	
});


</script>



<%@ include file="/WEB-INF/views/footer.jsp"%>