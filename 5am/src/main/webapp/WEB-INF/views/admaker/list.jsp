<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<style>
.submitLink {
    background-color: transparent;
    border: none;
	color:white;
    cursor: pointer;
}
.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:400px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
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
			<div class="col-md-6 col-sm-6">
				<div style="padding: 10px;">
					<button id="reset" class=" btn btn-default">초기화</button>
					<button id="delete" class="btn btn-default">선택삭제</button>
					<button id="deactive" class="btn btn-default">선택취소</button>
					<button id="save-jpeg" class="btn btn-default">편집완료</button>
				</div>

				<canvas id="c" width="340" height="500"
					style="border: 1px solid #000000;"></canvas>
			</div>
			<!-- /.end col-md-6 row -->


			<!-- Nav tabs -->
			<div style="margin-bottom: 1px;" class="col-md-6 col-sm-6">
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
								<div class="file_input">
									<label> 배경사진 선택 <input id="imgInp" type="file" name="file"></label>
								</div>
								<div id="preview"></div>
							</form>
							<button id="confirm" class="btn btn-default">배경사진 적용</button>

							<form id="uploadImg" runat="server">
								<div class="file_input">
									<label style="margin-top:10px;">삽입사진 선택 <input id="uploadedImg" type="file" name="file"></label>
								</div>
							</form>
					</div>

					<!-- 2번째 -->
					<div role="tabpanel" class="tab-pane" id="profile">

						<button id="addtext" style="margin:5px" class="btn btn-default">문구 넣기</button>
						<p style="margin:5px">
							<button id="bold" class="btn btn-default">진하게</button>
							<button id="italic" class="btn btn-default">기울이기</button>
							<button id="underline" class="btn btn-default">밑줄</button>
							<input type="color" id="color"> <input type="color"
								id="text-bg-color"> <input type="range" min="5"
								max="150" value="40" id="text-font-size"> <label
								for="font-family" style="display: inline-block">Font
								family:</label> <select id="font-family">
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



						</p>
					</div>

					<div role="tabpanel" class="tab-pane" id="messages">
						<input type="color" id="rectcolor" >
						<button id="rect" class=" btn btn-default">사각형</button>
						<button id="circle" class=" btn btn-default">원</button>
						<button id="triangle"  class=" btn btn-default">삼각형</button>
						<ul class="svg-shapes" style="list-style: none;">
						<c:forEach begin="1" end="30" var="i" >
					         <li><button class="btn btn-default zzz" id="shape${i }"><img src="svg/${i }.svg" style="width: 30px; height:30px;"></button></li> 
					    
						</c:forEach>
				
					    </ul>
					</div>

					<div  class="tab-pane" id="settings">
						<div id="d2">
							
						</div>
						<div style="margin:10px " >
							<button id="start" class="btn btn-default">변환</button>
							<button id="down" class="btn btn-default">저장</button>
						</div>
					</div>
				</div>

			</div>
			<!--End Nav tabs -->

			<!-- 미리보기 사진목록 -->
			<div class='uploadedList2 col-md-12' style="padding: 30px;"></div>


		</div>


	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	
	
	
	
	
	

	<script src='../resources/gifshot.js'></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.11/fabric.min.js"></script>
<script>
	$(document).ready(function() {

						var i = 0;
						var bg = "";
						var iscr = new Array();
						var canvas = this.__canvas = new fabric.Canvas('c');
						fabric.Object.prototype.transparentCorners = false;

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
						       var site_url = 'svg/'+svgName;
						       
						        fabric.loadSVGFromURL(site_url, function(objects, options) {
						            var obj = fabric.util.groupSVGElements(objects, options);
						            obj.scale(0.2);
						            canvas.add(obj);
						            canvas.renderAll();
						                  })
						}

						$("#addtext").click(function(e) {
							e.preventDefault();
							canvas.deactivateAll();
							canvas.renderAll()

							addtext2();
							canvas.renderAll();

						});

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
							
							backg("blah");
							
						});
						 

						$("#confirm").click(function() {
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
									var str = "<div class='col-md-3' style='border: 1px solid white; padding:0; width: 25%; background-color: black; float: left;'><div><img id='mybg' src='data:image/jpeg;base64,"
									+ re+ "' width='100%' ></div><input type='button' value='사진 삭제' class='submitLink'></div></div>"
									$(".uploadedList2").append(str);
									iscr.push("data:image/jpeg;base64,"+ re);
									console.log(iscr);
									canvas.clear();
									console.log($(".uploadeList2"))
									$(".uploadedList2 input").on("click",function(e) {
										var $this = $(this);
										console.log($this.parent());
										$this.parent().remove();
										console.log($(".uploadeList2"));
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

						$("#deactive").click(function() {
							console.log("test1")

							canvas.deactivateAll();
							canvas.renderAll()

						})

						$("#down").on('click', function() {

							console.log("보내는 중")


							var giffile = $("#img1")[0].src;
							var sid = "${login.sid}";
							var str = giffile.split(",")[1]

						

							$.ajax({
					            url : "/admaker/adgif",
					            type : "post",
					            data : {
					                "giffile" : str,
					                "sid" : sid
					            },
					            dataType : "json",
					            success : function(data) {
					                alert("success!!!")
					            }

					       });

						})

						$("#start").click(function() {
								console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~iscr");
								console.log(iscr);
								gifshot.createGIF({
																gifWidth : 680,
																gifHeight : 1000,
																images : iscr,
																interval : 1,
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
    
   
   
   document.getElementById("rectcolor").onchange=(function(){
        console.log("색 바꾸기")
        var activeObject = canvas.getActiveObject();        
       activeObject.set("fill", $(this)[0].value);
        console.log($(this)[0].value)
        canvas.renderAll();
        
   })			
   
   $(".zzz").each(function(e){
	   console.log(this)
   })
   for(var i=1; i<=30; i++) {
	   var a="#shape"+i;
	   	
	   var b=i+".svg";
	   console.log(a);
	   console.log(b);
	   console.log(c);

		/* $(a).click(function(e){
			console.log("aaaaa")
         addStickers('b'); 
	    
   });*/
}


										
})
</script>
	
	
	
	
<%@ include file="/WEB-INF/views/footer.jsp" %>