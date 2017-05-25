<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>


   <!-- MENU SECTION END-->
  	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">공지사항</h4>

				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						<div class="panel-heading">공지사항 등록</div>
						<div class="panel-body">
							
							<form role="form" method="post" action="/qna/regi" class="regiform" >
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										type="text" name="title" value="궁금한 사항을 작성해주세요" onfocus="this.value=''"/>
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="12" name="content"  onfocus="this.value=''">내용을 작성해주세요</textarea>
								</div>
								<div class="form-group">
									<label>글쓴이</label> <input class="form-control"
										type="text" name="writer" value="작성자를 작성해주세요" onfocus="this.value=''"/>
									
								</div>
								


								
							<button type="submit" class="btn btn-success">등록</button>
							<button class="btn btn-success"><a href="/qna/list">취소</a></button>
							</form>
						
							
							
							
							
						
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(e) {
	
	var result = '${fail}';
	if (result == 'fail') {
		
		alert("빈칸을 채워주세요")
	}
	

	
	
	
})

            
 </script>      



<%@ include file="/WEB-INF/views/footer.jsp"%>