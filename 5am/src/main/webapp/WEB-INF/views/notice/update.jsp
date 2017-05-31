<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>

     <!-- MENU SECTION END-->
  	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/notice/list">공지 사항</a></h4>

				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">공지사항 수정</div>
						<div class="panel-body">
							<form role="form"  action="/notice/nview" class="updateForm" >
								<input type="hidden" name="page" value="${cri.page}">
                            	<input type="hidden" name="nno" value="${read.nno}">
                           		<input type="hidden" name="type" value="${cri.type}">
                            	<input type="hidden" name="keyword" value="${cri.keyword}">
                            	
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										type="text" name="ntitle" value="${read.ntitle}" id="title" />
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="12" name="ncontent" id="content">${read.ncontent}</textarea>
								</div>
								<div class="form-group">
									<label>글쓴이</label> <input class="form-control"
										type="text" name="nwriter" value="${read.nwriter}"id="writer"/>
									
								</div>
								
							</form>
							<form enctype="multipart/form-data" id="imgForm" method="post">
								<div class="form-group">
									<label>첨부파일</label> <input class="form-control" type="file" name="file" id="file"/>
									<input type="hidden" name="nno" value="${read.nno}">
									<div id="uploadPreview"></div>
								</div>	
							</form>
							<button type="submit" class="btn btn-info" style="float: left; margin: 5px" id="btnRegi">등록</button>
						
							
							<form action="/notice/nview" method="get">
							<input type="hidden" name="page" value="${cri.page}">
                            <input type="hidden" name="nno" value="${read.nno}">
                            <input type="hidden" name="type" value="${cri.type}">
                            <input type="hidden" name="keyword" value="${cri.keyword}">
							<button class="btn btn-info" style="float: left; margin: 5px">취소</button>
							</form>
							
							
						
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->


	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(e) {
	
	$("#btnRegi").on("click",function(event){
		
		history.pushState(null, null);
		alert("글이 수정되었습니다.");
		window.onpopstate = function(e) {
			history.go(1);
		};
		$(".updateForm").submit();
		
	
	
	
	
		})
		
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
            if(w != 1000 || h != 500){
            	alert("1000*500px로 맞춰주세요");
            	$("#file").val("");
            	
            }else{
            	$('#uploadPreview').html('<img src="'+ this.src +'" width="200" height="100">'); 
            	 	
            			
            			
            			console.log("upload......");
            			var formData = new FormData();
            			formData.append("nno", $("input[name=nno]").val());
            			formData.append("file", $("input[name=file]")[0].files[0]);

            		
            			$.ajax({
            				url:"/notice/update",
            				data: formData,
            				processData:false,
            				contentType:false,
            				type:'post',
            				success: function(result){
            	            alert("업로드 성공!!");
            	                }



            			})
            			
            			
            		 
            }
          
        };
        image.onerror= function() {
            alert('해당형식은 지원하지 않습니다. 파일형식:JPG,PNG');
            $("#file").val("");
        };      
    };

}
	
	$("#file").change(function (e) {
	    if(this.disabled) return alert('File upload not supported!');
	    var F = this.files;
	    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i] );
	}); 
		
	
	
})
 </script>          

    

<%@ include file="/WEB-INF/views/footer.jsp" %>