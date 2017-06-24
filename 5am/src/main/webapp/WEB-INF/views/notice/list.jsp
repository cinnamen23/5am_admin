<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/notice/list">공지 사항</a></h4>
					
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
				
				<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-info">
                        <div class="panel-heading panel">목록  </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter">
                <label>
                <form class="form" method="get" action="/notice/list">
				<input class="hopage" type="hidden" name="page"value="${pageMaker.current}"> 
				<input class="view"type="hidden" name="nno"> 
                <select name="type" class="type">
				<option value="n" ${cri.type eq null?'selected':''}>---</option>
				<option value="t" ${cri.type eq 't'?'selected':''}>글제목</option>
				<option value="c" ${cri.type eq 'c'?'selected':''}>내용</option>
				<option value="w" ${cri.type eq 'w'?'selected':''}>글쓴이</option>
			    </select> 
			    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword" value="${cri.keyword}"><button id="btnn" class="btn btn-info">Search</button>
			    </form>
			    </label>
                               
                                </div></div></div><table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 50px;text-align: center;">번호</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width 200px; ">글제목</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 100px; ">글쓴이</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 200px; ">동록일자</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 50px; text-align: center;">조회수</th>
                                    </thead>
                                    <tbody>
                                        
                                     <c:forEach var="list" items="${list}">
                                    <tr class="gradeA odd">
                                            <td class="sorting_1" style=" text-align: center;">${list.nno}</td>
                                            <td class="center " ><a class="tt" href="${list.nno}" style="width: 60%; ">${list.ntitle}</a></td>
                                            <td class="center " >${list.nwriter} </td>
                                            <td class="center "  ><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                            <td class="center "style="text-align: center;">${list.hit}</td>
                                         
                                        </tr>
                                        </c:forEach>   
                                        </tbody>
                                </table>
                                <div>결과 : ${count} 건이 있습니다.</div>
                               
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                <form action="/notice/regi" method="get">
			<!-- 관리자& 고객 분기 -->							   
							    <c:if test="${login.gubun=='admin'}"> 
							    <button type="submit" class="btn btn-info">등록</button>
							    </c:if>
			<!-- 관리자& 고객 분기 끝 -->	
							    </form>
							    </div>
                                </div>
                                <div class="col-sm-6">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination">
                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><c:if test="${pageMaker.prev}"><a href="${pageMaker.start-1}">이전</a></c:if></li>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" 
                                var="pagege">
                                <a href="${pagege}">
			                 	<li class='${pagege == pageMaker.current?"paginate_button active":""}' aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
			                 	</c:forEach> 
                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><c:if test="${pageMaker.next}"><a href="${pageMaker.end+1}">다음</a></c:if></li>
                                </ul>
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
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	</div>
	</div>
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(e) {
	
	var result3 = '${msg}';
	if (result3 == "success") {
		history.pushState(null, null);
	
		window.onpopstate = function(e) {
			history.go(1);
		};
	}
	
	var result1 = '${delete}';
	if (result1 == "success") {
		history.pushState(null, null);
		alert("글이 삭제되었습니다.");
		window.onpopstate = function(e) {
			history.go(1);
		};
	}
	

$(".pagination a").on("click", function(e) {

	e.preventDefault();

	$(".hopage").val($(this).attr("href"));

	$(".form").submit();
})

 $(".tt").on("click", function(e) {

	e.preventDefault();

	$(".view").val($(this).attr("href"));

	$(".form").attr("action", "/notice/nview").submit();
}) 

 $("#btnn").on("click", function(e) {
	e.preventDefault();
	$(".hopage").val("1");

	$(".form").submit();

}) 
})
</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>