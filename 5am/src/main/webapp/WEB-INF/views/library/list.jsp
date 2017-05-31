<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
​<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<%@ include file="/WEB-INF/views/header.jsp"%>

<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/library/list" >자료를 다운 받는 자료실입니다</a></h4>
					
				</div>

			</div>
				
				<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-primary">
                        <div class="panel-heading panel">자료실입니다  </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter">
                <div class="col-md-12">
                <label>
                <form class="form" method="get" action="/library/list">
					<input class="hopage" type="hidden" name="page"value="${pageMaker.current}"> 
					<input class="view"type="hidden" name="lno"> 
	                <select name="type" class="type">
						<option value="n" ${cri.type eq null?'selected':''}>---</option>
						<option value="t" ${cri.type eq 't'?'selected':''}>제목</option>
						<option value="c" ${cri.type eq 'c'?'selected':''}>내용</option>
				    </select> 
				    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword" value="${cri.keyword}">
				    <button id="btnn" class="btn btn-info">Search</button>
				</label>    
                </div>
				    

				    
                               
                                </div></div></div><table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <div><thead>
                                        <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 10%;">번호</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 60%;">글제목</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 10%;">조회수</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 20%;">등록일자</th>
                                    </thead></div>
                                    <tbody>
                   
                                     <c:forEach var="list" items="${list}">
                                    <tr class="gradeA odd">
                                            <td class="sorting_1">${list.lno}</td>
                                            <td><a class="tt" href="${list.lno}">${list.ltitle} </a></td>
                                            <td class="center ">${list.hit}</td>
                                            <td class="center " ><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                            
      
                                        </tr>
                                        </c:forEach>   
                                        </tbody>
                                </table>
                                <div class="row">
	                                <div class="col-sm-6">
	                                	<div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
			     <c:if test ="${fn:length(list) eq 0}" >
	                 	<h2>검색 내용이 없습니다</h2>
	             </c:if> 
	                                
	                                <!-- 관리자& 고객 분기 -->	
	                                					${login.gubun}	   
							    <c:if test="${login.gubun=='admin'}"> 
	                                	 <button type="submit" class="btn btn-info regiBtn">등록</button> </div>
							    </c:if>
									<!-- 관리자& 고객 분기 끝 -->		
	                     
	                                
			    </form>
	                                </div>
	                                <div class="col-sm-6" >
		                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
			                                <ul class="pagination"  >
			                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><c:if test="${pageMaker.prev}"><a href="${pageMaker.start-1}">이전</a></c:if></li>
			                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" 
			                                var="pagege">
			                                <a href="${pagege}">
						                 	<li class='${pagege == pageMaker.current?"paginate_button active":""}' aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
						                 	</c:forEach> 
			                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><c:if test="${pageMaker.next}">
			                                <a href="${pageMaker.end+1}">다음</a></c:if></li>
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
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(e) {
	
//등록
	$(".regiBtn").on("click", function(e){
		e.preventDefault();
		$(".form").attr("action", "/library/regi").submit();
	})
	
	
//상세보기
	 $(".tt").on("click", function(e) {
			e.preventDefault();
			$(".view").val($(this).attr("href"));
			$(".form").attr("action", "/library/view").submit();
		}) 
		
//검색
		 $("#btnn").on("click", function(e) {
			e.preventDefault();
			if($(".type").val()=='n'){
				alert("검색 타입을 정해주세요")
			}
			else{
			$(".hopage").val("1");
			$(".form").submit();
			}
		}) 
	
//페이지
	$(".pagination a").on("click", function(e) {
		e.preventDefault();
		$(".hopage").val($(this).attr("href"));
		$(".form").submit();
	})
})
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>