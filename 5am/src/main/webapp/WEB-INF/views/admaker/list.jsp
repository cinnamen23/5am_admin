
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
  <link rel="stylesheet" href="../resources/dist/flatpickr.css">
<style>
.fileUpload {
    position: relative;
    overflow: hidden;
    margin: 10px;
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}

.submitLink {
    background-color: transparent;
    border: none;
	color:white;
    cursor: pointer;
}
.form-group input[type="checkbox"] {
    display: none;
}
.form-group input[type="checkbox"] + .btn-group > label span {
    width: 15px;
}
.form-group input[type="checkbox"] + .btn-group > label span:first-child {
    display: none;
}
.form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
    display: inline-block;
}

</style>
    <%@ include file="/WEB-INF/views/header.jsp" %>
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<div class="content-wrapper" style=" margin-top:0px;">
	<div class="container">
		<div class="row pad-botm" style="padding-bottom: 0px;">
			<div class="col-md-12">
				<h3 class="header-line">
					<a href="/admaker/list" style="color: black">5초 광고 만들기 <small> 5AM</small></a>
				</h3>

			</div>
		</div>


		<!-- /.row -->
		<div class="col-md-12" style="margin-bottom: 15px;">
			<div class="col-lg-7 col-md-8 col-sm-12">
				<div style="padding: 10px;">
					<button id="reset" class=" btn btn-default">초기화</button>
					<button id="delete" class="btn btn-default">선택삭제</button>
					<button id="deactive" class="btn btn-default">선택취소</button>
					<button id="save-jpeg" class="btn btn-default">편집완료</button>
				</div>

				<canvas id="c" width="544" height="800"
					style="border: 1px solid #000000;"></canvas>
			</div>
			<!-- /.end col-md-6 row -->


			<!-- Nav tabs -->
			<div style="margin-bottom: 1px;" class="col-lg-5 col-md-4 col-sm-12">
				<ul class="nav nav-tabs " role="tablist" style="margin: 5px">
					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" data-toggle="tab">사진추가</a></li>
					<li role="presentation"><a href="#profile"
						aria-controls="profile" role="tab" data-toggle="tab">문구추가</a></li>
					<li role="presentation"><a href="#messages"
						aria-controls="messages" role="tab" data-toggle="tab">스티커추가</a></li>
					<li role="presentation"><a href="#settings"
						aria-controls="settings" role="tab" data-toggle="tab">변환</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content" style="padding:10px ">
					<!-- 1번째 -->
					<div role="tabpanel" class="tab-pane active" id="home">
							<form id="form1" runat="server">								
								<div class="fileUpload btn btn-primary">
								    <span>배경사진 선택</span>
								    <input id="imgInp" type="file" name="file" class="upload" />
								</div>
								<button id="confirm" class="btn btn-info" style="margin-top:10px">배경사진 적용</button>
								<div id="preview"></div>
							</form>
							
							

							<form id="uploadImg" runat="server">
								<div class="fileUpload btn btn-primary">
								    <span>사진 추가</span>
								    <input id="uploadedImg" type="file" name="file" class="upload" />
								</div>
							</form>
							<hr />
					</div>

					<!-- 2번째 -->
					<div role="tabpanel" class="tab-pane" id="profile">

						<button id="addtext" style="margin:5px" class="btn btn-default">문구 넣기</button><hr />
						<p style="margin:5px">
							<button id="bold" class="btn btn-default">진하게</button>
							<button id="italic" class="btn btn-default">기울이기</button>
							<button id="underline" class="btn btn-default">밑줄</button></br>
							<label>글자색:&nbsp;</label><input type="color" id="color"> </br>
							<label>배경색:&nbsp;</label><input type="color"id="text-bg-color"></br> 
							<label>글자크기:&nbsp;</label><input type="range" min="5"max="150" value="30" id="text-font-size"> 
							<label for="font-family" style="display: inline-block">글자체:&nbsp;</label> 
							<select id="font-family">
								<option value="arial">Arial</option>
								<option value="helvetica" selected>Helvetica</option>
								<option value="myriad pro">Myriad Pro</option>
								<option value="delicious">Delicious</option>
								<option value="verdana">Verdana</option>
								<option value="georgia">Georgia</option>
								<option value="courier">Courier</option>
								<option value="comic sans ms">Comic Sans MS</option>
								<option value="impact">Impact</option>
								<option value="monaco">Monaco</option>
								<option value="optima">Optima</option>
								<option value="hoefler text">Hoefler Text</option>
								<option value="plaster">Plaster</option>
								<option value="engagement">Engagement</option>
							</select>



						</p><hr />
					</div>

					<div role="tabpanel" class="tab-pane" id="messages">
						
						<button id="rect" class=" btn btn-default">사각형</button>
						<button id="circle" class=" btn btn-default">원</button>
						<button id="triangle"  class=" btn btn-default">삼각형</button>
						<label>도형색&nbsp;</label><input type="color" id="rectcolor" >
						<hr />
						<ul class="svg-shapes" style="list-style: none; padding:0px; " >
						<c:forEach begin="1" end="35" var="i" >
					         <li style="float: left; margin:5px;"><button class="btn btn-default  icon" id="shape${i }"><img src="svg/${i }.svg" style="width: 30px; height:30px; "></button></li> 
					    
						</c:forEach>
				
					    </ul>
					</div>

					<div  class="tab-pane" id="settings">
						<div id="d2">
							
						</div>
						<div style="margin:10px " >
							<button id="start" class="btn btn-default">변환</button>
							<button id="down" class="btn btn-default" data-toggle="modal" data-target="#myModal">저장</button>
							
							
						</div><hr />
					</div>
				</div>

			<!-- 미리보기 사진목록 -->
			<div class='uploadedList2 col-md-12 col-sm-12' style="padding: 2px;"></div>


		</div>

			</div>
			<!--End Nav tabs -->


	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	
	
	
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">광고 보여주고 싶은 사람</h4>
      </div>
      
      
      <div class="modal-body">
      <label>
                 타겟 설정
                </label>
      <div>
       <div class="[ col-xs-12 col-sm-6 ]">
        
        <form id="f1" action="/admaker/adgif" method="POST">
        
        <input type="hidden" name="target1" id="target1" value="">
        <input type="hidden" name="target2" id="target2" value="">
        <input type="hidden" name="target3" id="target3" value="">
        <input type="hidden" name="target4" id="target4" value="">
        
        
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-default" value="male10" autocomplete="off" onclick="CountChecked(this)" />
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-default" class="[ btn btn-purple ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-default" class="[ btn btn-default active ]">
                    10대 남성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-primary" value="male20" autocomplete="off" onclick="CountChecked(this)" />
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-primary" class="[ btn btn-primary ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-primary" class="[ btn btn-default active ]">
                    20대 남성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-success" value="male30" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-success" class="[ btn btn-success ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-success" class="[ btn btn-default active ]">
                    30대 남성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-info" value="male40" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-info" class="[ btn btn-info ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-info" class="[ btn btn-default active ]">
                   40대 남성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-warning" value="male50" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-warning" class="[ btn btn-warning ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-warning" class="[ btn btn-default active ]">
                   50대 남성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-danger" value="male60" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-danger" class="[ btn btn-danger ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-danger" class="[ btn btn-default active ]">
                    60대이상 남성
                </label>
            </div>
        </div>
    </div>
     <div class="[ col-xs-12 col-sm-6 ]">
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-default2" value="female10" autocomplete="off" onclick="CountChecked(this)" />
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-default2" class="[ btn btn-purple ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-default2" class="[ btn btn-default active ]">
                    10대 여성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-primary2" value="female20" autocomplete="off" onclick="CountChecked(this)" />
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-primary2" class="[ btn btn-primary ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-primary2" class="[ btn btn-default active ]">
                    20대 여성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-success2" value="female30" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-success2" class="[ btn btn-success ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-success2" class="[ btn btn-default active ]">
                    30대 여성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-info2" value="female40" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-info2" class="[ btn btn-info ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-info2" class="[ btn btn-default active ]">
                   40대 여성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-warning2" value="female50" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-warning2" class="[ btn btn-warning ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-warning2" class="[ btn btn-default active ]">
                   50대 여성
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="favorite" id="fancy-checkbox-danger2" value="female60" autocomplete="off" onclick="CountChecked(this)"/>
            <div class="[ btn-group ]">
                <label for="fancy-checkbox-danger2" class="[ btn btn-danger ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="fancy-checkbox-danger2" class="[ btn btn-default active ]">
                    60대이상 여성
                </label>
            </div>
        </div>
    </div>
    </div>
    
   
    </form>
		
<hr>


<label>
                  거리 설정
                </label>
    <select id="distance" class="form-control" >
    <option value="100">100</option>
    <option value="200">200</option>
    <option value="300">300</option>
    <option value="400">400</option>
    <option value="500">500</option>
  
</select>





<div class="form-group" style="margin: 0px;top: 5px;">
    <label for="exampleInputEmail1">광고 등록 기간 설정</label>
   <p><input class="flatpickr form-control" id="date" type="text" placeholder="Select Date.." data-id="range"></p>
  </div>
    
    
      </div>
      <div class="modal-footer">
        <button id="regiBtn" type="button" class="btn btn-default" data-dismiss="modal">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>	
	
	
	 <script src="../resources/dist/flatpickr.js"></script>

    <script src="../resources/dist/plugins/confirmDate/confirmDate.js"></script>

    <script src="../resources/dist/plugins/weekSelect/weekSelect.js"></script>

    <script src="https://chmln.github.io/flatpickr/flatpickr.js"></script>
	

	<script src='../resources/gifshot.js'></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.11/fabric.min.js"></script>
<script>


var maxChecked = 4;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 설정 끝

var arr =new Array();
function CountChecked(field) {
    if (field.checked){
        totalChecked += 1;
        arr.push(field.value);
    
    
    }
    else{
        totalChecked -= 1;
        arr.splice(arr.indexOf(field.value),1);
    }
 
    if (totalChecked > maxChecked) {
        alert ("최대"+maxChecked+"개 까지만 가능합니다.");
    field.checked = false;
    totalChecked -= 1;
    }
    console.log(arr);
    
    
}

function ResetCount(){
	totalChecked = 0;
}


	$(document).ready(function() {

		
		
		
						var i = 0;
						var bg = "";
						var iscr = new Array();
						
						var canvas = this.__canvas = new fabric.Canvas('c');
						fabric.Object.prototype.transparentCorners = false;

						
						
						Array.prototype.remove = function() {
                            var what, a = arguments, L = a.length, ax;
                            while (L && this.length) {
                                what = a[--L];
                                while ((ax = this.indexOf(what)) !== -1) {
                                    this.splice(ax, 1);
                                }
                            }
                            return this;
                        };
						
						
						
						
						
						(function() {

							

							canvas.on({
								'object:moving' : onChange,
								'object:scaling' : onChange,
								'object:rotating' : onChange,
							});

							function onChange(options) {
								options.target.setCoords();
								canvas.forEachObject(function(obj) {
									if (obj === options.target)
										return;
									//     obj.setOpacity(options.target.intersectsWithObject(obj) ? 0.5 : 1);
								});
							}

						})();
						
						 document.getElementById("rectcolor").onchange=(function(){
						        var activeObject = canvas.getActiveObject();        
						       activeObject.set("fill", $(this)[0].value);
						        console.log($(this)[0].value)
						        canvas.renderAll();
						        
						   })

						document.getElementById('uploadedImg').onchange = function handleImage(e) {
							var reader = new FileReader();
							reader.onload = function(event) {
								var imgObj = new Image();
								imgObj.src = event.target.result;
								imgObj.onload = function() {
									var image = new fabric.Image(imgObj);
									image.set({
										angle : 0,
										cornersize : 10,
										height : 170,
										width : 250,
									});
									canvas.centerObject(image);
									canvas.add(image);
									canvas.renderAll();
								}
							}
							reader.readAsDataURL(e.target.files[0]);
						}

						function setStyle(object, styleName, value) {
							if (object.setSelectionStyles && object.isEditing) {
								var style = {};
								style[styleName] = value;
								object.setSelectionStyles(style).setCoords();
							} else {
								object[styleName] = value;
							}
							canvas.renderAll();
						}
						;
						function getStyle(object, styleName) {
							return (object.getSelectionStyles && object.isEditing) ? object
									.getSelectionStyles()[styleName]
									: object[styleName];
						}
						function addHandler(id, fn, eventName) {
							document.getElementById(id)[eventName || 'onclick'] = function() {
								var el = this;
								if (obj = canvas.getActiveObject()) {
									fn.call(el, obj);
									canvas.renderAll();
								}
							};
						}

						addHandler('underline',
								function(obj) {
									var isUnderline = (getStyle(obj,
											'textDecoration') || '')
											.indexOf('underline') > -1;
									setStyle(obj, 'textDecoration',
											isUnderline ? '' : 'underline');
								});

						addHandler('bold', function(obj) {
							var isBold = (getStyle(obj, 'fontWeight') || '')
									.indexOf('bold') > -1;
							setStyle(obj, 'fontWeight', isBold ? '' : 'bold');
						});

						addHandler(
								'italic',function(obj) {
									var isItalic = (getStyle(obj, 'fontStyle') || '').indexOf('italic') > -1;
									setStyle(obj, 'fontStyle', isItalic ? '': 'italic');
								});

						addHandler('color', function(obj) {
							setStyle(obj, 'fill', this.value);
						}, 'onchange');

						addHandler('font-family', function(obj) {
							setStyle(obj, 'fontFamily', this.value);
						}, 'onchange');

						addHandler('text-bg-color', function(obj) {
							setStyle(obj, 'textBackgroundColor', this.value);
						}, 'onchange');
						addHandler('text-font-size', function(obj) {
							setStyle(obj, 'fontSize', this.value);
						}, 'onchange');

						function addtext(puttext) {
							var text = new fabric.Text(puttext, {
								left : 100,
								top : 100
							});
							canvas.add(text);

						}

						function addtext2() {
							var iTextSample = new fabric.IText(
									"input Text",
									{
										left : 50,
										top : 50,
										fontFamily : 'Helvetica',
										fill : '#333',
										lineHeight : 1.1,
										styles : {0 : {0 : {textDecoration : 'underline',fontSize : 80},1 : {textBackgroundColor : 'red'}},1 : {0 : {textBackgroundColor : 'rgba(0,255,0,0.5)'},4 : {fontSize : 20}}
										}
									});
							canvas.add(iTextSample);
						}

						function backg(bg) {

							var imgElement = document.getElementById(bg);
							console.log("element@@"+imgElement);

							var imgInstance = new fabric.Image(imgElement, {
								left : 0,
								top : 0,

								opacity : 1
							});
							imgInstance.setWidth(canvas.width);
							imgInstance.setHeight(canvas.height);
							canvas.setBackgroundImage(imgInstance);
							canvas.renderAll();

						}; 
						 var svgName= '';
						
						function addStickers(svgName){
						       var site_url = 'svg/'+svgName+'.svg';
						       
						        fabric.loadSVGFromURL(site_url, function(objects, options) {
						            var obj = fabric.util.groupSVGElements(objects, options);
						            obj.scale(0.2);
						            canvas.add(obj);
						            canvas.renderAll();
						                  })
						}

						

						function readURL(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();

								reader.onload = function(e) {

									$('#preview').html("<img id='blah' src=''  style='height: 450px; width: 340px;' />")
									
									$('#blah').attr('src', e.target.result);
								}

								reader.readAsDataURL(input.files[0]);
							}
						}
						
					

 						$("#imgInp").change(function() {
							readURL(this);
							console.log("213123"+this[1]);
							
							
						});
 						
 						$("#addtext").click(function(e) {
							e.preventDefault();
							canvas.deactivateAll();
							canvas.renderAll()

							addtext2();
							canvas.renderAll();

						});
						 

						$("#confirm").click(function(e) {
							e.preventDefault();
							backg("blah");
						})

						$("#save-jpeg").click(
							function() {
								canvas.deactivateAllWithDispatch();
								canvas.renderAll();
								var image = document.getElementById("c").toDataURL("image/jpeg");
								console.log("save")
								image = image.replace(
								'data:image/jpeg;base64,','');
								var formData = new FormData();
								var sid = "${login.sid}";
								formData.append("image", image);
								formData.append("sid", sid);
								
								$.ajax({														
									url : '/admaker/onepage',
									data : formData,
									dataType : 'text',
									processData : false,
									contentType : false,
									type : 'post',
									success : function(re) {
									console.log("re");
									console.log(re);
									var str = "<div class='col-md-1' style='border: 1px solid white; padding:0; width: 20%; background-color: black; float: left;'><div><img id='mybg' src='data:image/jpeg;base64,"
									+ re+ "' width='100%' ></div><input type='button' value='사진 삭제' class='submitLink'></div></div>"
									$(".uploadedList2").append(str);
									iscr.push("data:image/jpeg;base64,"+ re);
									
									canvas.clear();
									console.log($(".uploadeList2"))
									
									$(".uploadedList2 input").on("click",function(e) {
										
										var $this = $(this);
										console.log($this.parent());
										
										var index = iscr.indexOf('"'+($this.parent())[0].childNodes[0].childNodes[0].currentSrc+'"');
                                        console.log(index);
                                        iscr.remove(($this.parent())[0].childNodes[0].childNodes[0].currentSrc);
										
										$this.parent().remove();
										
										$.ajax({type : 'post',url : '/admaker/delete',
											data : re,
											success : function(data) {
												console.log(da);
											}
										});

									});
									}
								});
							});

						$("#reset").click(function() {

							canvas.clear();

						})

						$(document).keydown(function(event) {
						if (event.keyCode == '46') {
						    canvas.remove(canvas.getActiveObject());
							}   
						})
						
						$("#delete").click(function() {
							canvas.remove(canvas.getActiveObject());
							canvas.renderAll()

						})
						
						

						$("#deactive").click(function() {
							console.log("test1")

							canvas.deactivateAll();
							canvas.renderAll()

						})

						$("#regiBtn").on('click', function() {
                            $("#target1").val(arr[0]);
                            $("#target2").val(arr[1]);
                            $("#target3").val(arr[2]);
                            $("#target4").val(arr[3]);
                            
                          
      				        
      				         var term = $("#date")[0].value.split(' to ');
      				         console.log(term[0]);
      				      	 console.log(term[1]);
      				      
            					
                            
                            var DATA;
                              $('input:checkbox[name=favorite]').each(function() {
                                 if($(this).is(':checked'))
                                    DATA += "|"+($(this).val());
                              });
                              console.log(DATA);
                             
                            console.log("보내는 중")
                            
                            
                            console.log($("#distance option:selected").val());
                            
                            
                            
                            
                            var giffile = $("#img1")[0].src;
                            var sid = "${login.sid}";
                            var str = giffile.split(",")[1]
                            var target1 = $("#target1").val();
                            var target2 = $("#target2").val();
                            var target3 = $("#target3").val();
                            var target4 = $("#target4").val();
                            var Area = $("#distance option:selected").val();
							
                            
							$.ajax({
					            url : "/admaker/adgif",
					            type : "post",
					            data : {
					                "giffile" : str,
					                "sid" : sid,
					                "target1": target1,
					                "target2": target2,
					                "target3": target3,
					                "target4": target4,
					                "Area":Area,
					                "startdate":term[0],
					                "enddate":term[1]
					                
					            },
					            dataType : "text",
					            success : function(data) {
					                
					                alert("등록이 완료 되었습니다.");
					                location.href= "/index"
					            }

					       });

						})

						$("#start").click(function() {
							console.log(iscr.length);
								gifshot.createGIF({
								gifWidth : 650,
								gifHeight : 950,
								images : iscr,
								interval : 6.0/iscr.length,
							},
							function(obj) {
								if (!obj.error) {
									var image = obj.image;

									$("#d2").append("<img id='img1' src='' style='width: 80% ;height:auto;'>")
									animatedImage = document.getElementById('img1');
									animatedImage.src = image;
									console.dir($(this).parent())
								}
							});
						})
						
						
						$("#rect").click(function(){        
					       
					       var rect = new fabric.Rect({
					            width: 200, height: 100, left: 20, top: 200, angle: 0,
					            fill: 'rgba(255,0,3,1)'
					        });        
					       canvas.add(rect);
					        
					   })
					    
					    $("#circle").click(function(){
					        
					           var circle = new fabric.Circle({
					            radius: 50, left: 275, top: 75, fill: '#aac'
					        });
					           canvas.add(circle);
					        
					     })
					
					    $("#triangle").click(function(){
					        
					       var triangle = new fabric.Triangle({
					            width: 100, height: 100, left: 50, top: 300, fill: '#cca'
					        });
					       canvas.add(triangle);
					    
					     })
					    
					   		
					   
					   $(".icon").each(function(e){
						   $(this).on("click",function(f){
							   addStickers(e+1)  
						   })
						   
					   })
					   
					   
					  
					   
					   	
})
</script>
	
	
	
<%@ include file="/WEB-INF/views/footer.jsp" %>