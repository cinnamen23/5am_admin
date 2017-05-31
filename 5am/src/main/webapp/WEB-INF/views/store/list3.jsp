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
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                
                              
                                
                                <div class="col-sm-100">
                                <div id="dataTables-example_filter" class="dataTables_filter">
                         <label>
				              <form class="f1" method="get" action="/member/list">
								<input class="hopage" type="hidden" name="page" value="1"> 
					                <select name="type" class="type">
									<option value="x" ${cri.type eq null?'selected':''}>---</option>
									<option value="i" ${cri.type eq 'i'?'selected':''}>회원ID</option>
									<option value="n" ${cri.type eq 'n'?'selected':''}>이름</option>
									<option value="a" ${cri.type eq 'a'?'selected':''}>나이</option>
									<option value="g" ${cri.type eq 'g'?'selected':''}>성별</option>
									<option value="d" ${cri.type eq 'd'?'selected':''}>주소</option>
								    </select> 
							    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword" value="${cri.keyword}">
							    
							    <button id="btnn" class="btn btn-warning">Search</button>
							  </form>
						</label>
                                </div>
                                </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 70px;">회원ID</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 40px;">이름</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 40px;">나이</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 40px;">성별</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 300px;">주소</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">등록날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">최근수정날짜</th>
                                    	<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 40px;">관리</th></tr>
                                    	
                                    </thead>
                                    <tbody>
                                        
                                     <c:forEach var="list" items="${list}">
                                    <tr class="gradeA odd" id="membertable">
                                            <td class="sorting_1">${list.mid}</td>
                                            <td class="center " >${list.mname}</td>
                                            <td class="center ">${list.mage}</td>
                                            <td class="center ">${list.mgender}</td>
                                            <td class="center " style="font-size: 11px;">${list.maddr}</td>
                                            <td class="center "><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                            <td class="center "><fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                            <td class="center" data-mname="${list.mname}" data-mage="${list.mage}" data-mgender="${list.mgender}" data-mid="${list.mid}" data-maddr="${list.maddr}">
                                            <a class="membermodi" href="" data-toggle="modal" data-target="#exampleModal"><i class="glyphicon glyphicon-wrench"></i></a>
                                            <a class="memberdel" href=""><i class="glyphicon glyphicon-remove"></i></a>
                                            </td>
                                            
                                         
                                        </tr>
                                        </c:forEach>   
                                        </tbody>
                                </table>
                            
                                <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-12">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination">
                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                <c:if test="${pageMaker.prev}"><a class="a1" href="${pageMaker.start-1}">&laquo;</a></c:if></li>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="pagege">
                                <a class="a1" href="${pagege}">
			                 	<li class="${pageMaker.current ==pagege?'active':''}" aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
			                 	</c:forEach> 
                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                <c:if test="${pageMaker.next}"><a class="a1" href="${pageMaker.end+1}">&raquo;</a></c:if></li>
                                </ul>
                                </div>
                           		</div>
                                </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                     
                     
                     
                 </div>
                 <div class="col-md-4 col-sm-4 col-xs-12" >
                         <div class="alert alert-info text-center" style="height: 380px">
                          <h3> 현재  ${login.sid } 님이</br> 로그인 되었습니다.</h3> 
                          <hr />
                          <p>
                        
                         ${login.sname }</br>
                         ${login.saddr }</br>
                         ${login.sphone }</br>
                         ${login.semail }</br></br>
                         
                        </p>
                           <hr />
                           <button type="button" class="btn btn-info" onclick="location.href='/store/storemodi' ">정보 수정</button>

                        </div>
                 </div>
             </div>