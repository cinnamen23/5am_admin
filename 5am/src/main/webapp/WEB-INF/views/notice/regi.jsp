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
						<div class="panel-heading">공지사항 등록</div>
						<div class="panel-body">
							<form role="form" method="post" action="/notice/regi" class="regiform" enctype="multipart/form-data">
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										type="text" name="ntitle" placeholder="제목을 작성해주세요" id="title"/>
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="12" name="ncontent" id="content" placeholder="내용을 작성해주세요"></textarea>
								</div>
								<div class="form-group">
									<label>글쓴이</label> <input class="form-control"
										type="text" name="nwriter" placeholder="작성자를 작성해주세요" id="writer"/>
									
								</div>
								<div class="form-group">
									<label>이미지 첨부파일(1000*500 px로 맞춰주세요)</label> 
									<input class="form-control" type="file" name="file" id="file"/>
								
									
								</div>
								<div id="uploadPreview"></div>
								
								</form>
								

							
							<button class="btn btn-info" id="regi">등록</button>
							<button class="btn btn-info"><a href="/notice/list">취소</a></button>
							
						
							
							
							
							
						
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
            if(w !>= 1000 || h !>=500){
            	alert("1000*500px로 맞춰주세요");
            	$("#file").val("");
            	
            }else{
            	  $('#uploadPreview').html('<img src="'+ this.src +'" width="200" height="100">'); 	
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
  
</script>
  <script>
$(document).ready(function(e) {
	
	var result = '${fail}';
	if (result == 'fail') {
		
		alert("빈칸을 채워주세요")
	}
	

	
	$("#regi").on("click",function(e){
		
		if($("#title").val()=="" || $("#content").val()=="" || $("#writer").val()=="" ){
			
			alert("빈칸을 채워주세요");
		}else{
			history.pushState(null, null);
			alert("글이 등록되었습니다.");
			window.onpopstate = function(e) {
				history.go(1);
			};
			 $(".regiform").submit(); 
			
		}
		
		
	})
	
	
	
	
	
})

            
 </script>        

    

<%@ include file="/WEB-INF/views/footer.jsp" %>