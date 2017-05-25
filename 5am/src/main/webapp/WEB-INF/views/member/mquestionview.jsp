<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>


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
      
      
      <div class="modal-body">
        <form >
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">Replyer:</label>
            <input type="text" class="form-control" id="title" name="title" value="${vo}">
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">Replytext:</label>
            <textarea class="form-control" id="content" name="content" rows="10">${vo}</textarea>
          </div>
          
           <input type="hidden" id="qno" name="qno" value="${vo}">
          
        </form>
        
        
      </div>
      <div class="modal-footer">
        <button  id="modifyBtn" type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
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
				<h4 class="header-line">고객의 질문</h4>

			</div>

		</div>

		<!-- /. ROW  -->


		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-warning">
					<div class="panel-heading">${vo.title}</div>

					<div class="panel-body">
						
						
						<!-- 상세보기 -->
					<div class="table-responsive">
						 <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 30px;">#</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 100px;">ID</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 500px;">질문내용</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">등록 날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 100px;">최종 수정 날짜</th>
                                    	<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 113px;">mod&del</th></tr>
                                    </thead>
                                   
                                    <tbody>
                                     	
                                        <tr class="gradeA odd">
                                        
                                        	<td class="sorting_1" >${vo.mqno} </td>
                                            <td class="center ">${vo.mid}</td>
                                            <td class="center ">${vo.question}</td>
                                            <td class="center ">${vo.regdate}</td>
                                            <td class="center ">${vo.updatedate}</td>
                                            <td class="center">
                                            <a href="" data-toggle="modal" data-target="#exampleModal"><i class="glyphicon glyphicon-wrench"></i></a>
                                            <a href=""><i class="glyphicon glyphicon-remove"></i></a>
                                            </td>                                        
                                        </tr>
                                       
                                       </tbody>
                                       
                                </table>
						</div>
						<!-- 상세보기 -->						
						
						
						
					</div>
				</div>
			</div>
		</div>



		<!-- /. ROW  -->
	</div>
</div>

<script>

$(document).ready(function() {
		
	
	
	
	
});


</script>



<%@ include file="/WEB-INF/views/footer.jsp"%>