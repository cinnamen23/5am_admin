<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">등록 회원</h4>
					
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
				
		
		</div>
	</div>
	
	<div class="row">
                 
                 <div class="col-md-8 col-sm-8 col-xs-12">
                     
                     <div class="panel panel-warning">
                        <div class="panel-heading panel">회원 목록  </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid"><div class="row"><div class="col-sm-6"><div class="dataTables_length" id="dataTables-example_length"></div></div><div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" aria-controls="dataTables-example"></label></div></div></div><table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 70px;">회원ID</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 40px;">이름</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 30px;">나이</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 30px;">성별</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 140px;">등록날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 140px;">최근수정날짜</th>
                                    
                                    </thead>
                                    <tbody>
                                        
                                     <c:forEach var="list" items="${list}">
                                    <tr class="gradeA odd">
                                            <td class="sorting_1">${list.mid}</td>
                                            <td class=" ">${list.mname}</td>
                                            <td class="center ">${list.mage}</td>
                                            <td class="center ">${list.mgender}</td>
                                            <td class="center ">${list.regdate}</td>
                                            <td class="center ">${list.updatedate}</td>
                                            
                                         
                                        </tr>
                                        </c:forEach>   
                                        </tbody>
                                </table>
                            
                                <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-6">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination">
                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                <c:if test="${pageMaker.prev}"><a href="${pageMaker.start-1}">이전</a></c:if></li>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="pagege">
                                <a href="${pagege}">
			                 	<li class="${pageMaker.current ==pagege?'active':''}" aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
			                 	</c:forEach> 
                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                <c:if test="${pageMaker.next}"><a href="${pageMaker.end+1}">다음</a></c:if></li>
                                </ul>
                                </div>
                           		
				<form class="form" method="get" action="/member/list">
					<input class="hopage" type="hidden" name="page" value="${pageMaker.current}"> 
				</form>
			
                                </div>
                                </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                     
                     
                     
                 </div>
                 <div class="col-md-4 col-sm-4 col-xs-12" >
                        <div class="alert alert-info text-center">
                          <h3> 로그인 사용자 개인 정보 부분</h3> 
                          <hr />
                            <i class="fa fa-warning fa-4x"></i>
                          <p>
                         Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn.
                           Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn.
                               Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn.
                               Lorem ipsum dolor sit amet.
                        </p>
                          <hr />
                           <a href="#" class="btn btn-info">Read Full Detalis</a> 
                        </div>
                 </div>
             </div>
             
             
	
	
	<!-- CONTENT-WRAPPER SECTION END-->
	</div>
	
	</div>
	
	<script  src="https://code.jquery.com/jquery-3.2.1.min.js"
  			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

	<script>
	$(document).ready(function(e) {
	
		$(".pagination a").on("click", function(e) {
		
			e.preventDefault();
		
			$(".hopage").val($(this).attr("href"));
		
			$(".form").submit();
		})
	
	})
	</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>