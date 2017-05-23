<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<%@ include file="/WEB-INF/views/header.jsp"%>


<!-- MENU SECTION END-->
<div class="content-wrapper">
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">고객관리 호연</h4>

			</div>

		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-info">
					<div class="panel-heading">BASIC FORM</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<label>Enter Name</label> <input class="form-control"
									type="text" />
								<p class="help-block">Help text here.</p>
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input class="form-control"
									type="text" />
								<p class="help-block">Help text here.</p>
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3"></textarea>
							</div>


							<button type="submit" class="btn btn-info">Send Message
							</button>

						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-danger">
					<div class="panel-heading">SINGUP FORM</div>
					<div class="panel-body">
						<form role="form">

							<div class="form-group">
								<label>Enter Email</label> <input class="form-control"
									type="text" />
								<p class="help-block">Help text here.</p>
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input class="form-control"
									type="password" />
								<p class="help-block">Help text here.</p>
							</div>
							<div class="form-group">
								<label>Re Type Password </label> <input class="form-control"
									type="password" />
								<p class="help-block">Help text here.</p>
							</div>

							<button type="submit" class="btn btn-danger">Register
								Now</button>

						</form>
					</div>
				</div>
			</div>
		</div>
		<!--/.ROW-->
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading">FORM ELEMENTS</div>
					<div class="panel-body">
						<div class="form-group">
							<label>Select Example</label> <select class="form-control">
								<option>One Vale</option>
								<option>Two Vale</option>
								<option>Three Vale</option>
								<option>Four Vale</option>
							</select>
						</div>
						<hr />
						<div class="form-group">
							<label>Multiple Select Example</label> <select multiple=""
								class="form-control">
								<option>One Vale</option>
								<option>Two Vale</option>
								<option>Three Vale</option>
								<option>Four Vale</option>
							</select>
						</div>
						<hr />
						<div class="form-group">
							<label>Checkboxes</label>
							<div class="checkbox">
								<label> <input type="checkbox" value="" />Checkbox
									Example One
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="" />Checkbox
									Example Two
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="" />Checkbox
									Example Three
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" value="" />Checkbox
									Example Four
								</label>
							</div>
						</div>
						<hr />
						<div class="form-group">
							<label>Radio Button Examples</label>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="option1" checked="">Radio
									Example One
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios2" value="option2">Radio Example Two
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios3" value="option3">Radio Example Three
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">ADVANCE ELEMENTS FORM</div>
					<div class="panel-body">

						<form role="form">
							Some Message Examples <br />
							<div class="form-group has-success">
								<label class="control-label" for="success">SUCCESS
									EXAMPLE</label> <input type="text" class="form-control" id="success" />
							</div>
							<div class="form-group has-warning">
								<label class="control-label" for="warning">WARNING
									EXAMPLE</label> <input type="text" class="form-control" id="warning" />
							</div>
							<div class="form-group has-error">
								<label class="control-label" for="error">ERROR EXAMPLE</label> <input
									type="text" class="form-control" id="error" />
							</div>
						</form>
						<hr />
						Other Group Examples <br />
						<form role="form">
							<div class="input-group">
								<span class="form-group input-group-btn">
									<button class="btn btn-default" type="button">Go!</button>
								</span> <input type="text" class="form-control">
							</div>
							<br />
							<div class="input-group">

								<input type="text" class="form-control"> <span
									class="form-group input-group-btn">
									<button class="btn btn-default" type="button">Go!</button>
								</span>
							</div>
						</form>
						<hr />
						<form role="form">
							<div class="form-group">
								<label for="disabledInput">Disabled input</label> <input
									class="form-control" id="disabledInput" type="text"
									placeholder="Disabled input" disabled="" />
							</div>


						</form>
						<hr />
						For more customization for this template or its components please
						visit official bootstrap website i.e getbootstrap.com or <a
							href="http://getbootstrap.com/components/" target="_blank">click
							here</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- CONTENT-WRAPPER SECTION END-->
</div>
</div>
<div class="col-md-3 col-sm-3 col-xs-6">
	<div class="alert alert-danger back-widget-set text-center">
		<i class="fa fa-briefcase fa-5x"></i>
		<h3>30+ Issues</h3>
		That Should Be Resolved Now
	</div>
</div>

</div>
<div class="row">

	<div class="col-md-8 col-sm-8 col-xs-12">
		<div id="carousel-example" class="carousel slide slide-bdr"
			data-ride="carousel">

			<div class="carousel-inner">
				<div class="item active">

					<img src="assets/img/1.jpg" alt="" />

				</div>
				<div class="item">
					<img src="assets/img/2.jpg" alt="" />

				</div>
				<div class="item">
					<img src="assets/img/3.jpg" alt="" />

				</div>
			</div>
			<!--INDICATORS-->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example" data-slide-to="1"></li>
				<li data-target="#carousel-example" data-slide-to="2"></li>
			</ol>
			<!--PREVIUS-NEXT BUTTONS-->
			<a class="left carousel-control" href="#carousel-example"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#carousel-example"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="panel panel-primary ">
			<div class="panel-heading">Recent Chat History</div>
			<div class="panel-body chat-widget-main">
				<div class="chat-widget-left">Lorem ipsum dolor sit amet,
					consectetur adipiscing elit. Lorem ipsum dolor.</div>
				<div class="chat-widget-name-left">
					<img class="media-object img-circle img-left-chat"
						src="assets/img/user2.png" />
					<h4>Amanna Seiar</h4>
					<h5>Time 2:00 pm at 25th july</h5>
				</div>
				<hr />
				<div class="chat-widget-right">Lorem ipsum dolor sit amet,
					consectetur adipiscing elit. Lorem ipsum dolor sit amet.</div>
				<div class="chat-widget-name-right">
					<img class="media-object img-circle img-right-chat"
						src="assets/img/user2.png" />
					<h4>Amanna Seiar</h4>
					<h5>Time 2:00 pm at 25th july</h5>
				</div>
				<hr />
				<div class="chat-widget-left">Lorem ipsum dolor sit amet,
					consectetur adipiscing elit. Lorem ipsum dolor sit amet.</div>
				<div class="chat-widget-name-left">
					<img class="media-object img-circle img-left-chat"
						src="assets/img/user2.png" />
					<h4>Amanna Seiar</h4>
					<h5>Time 2:00 pm at 25th july</h5>
				</div>
				<hr />
				<div class="chat-widget-right">Lorem ipsum dolor sit amet,
					consectetur adipiscing elit. Lorem ipsum dolor sit amet.</div>
				<div class="chat-widget-name-right">
					<img class="media-object img-circle img-right-chat"
						src="assets/img/user2.png" />
					<h4>Amanna Seiar</h4>
					<h5>Time 2:00 pm at 25th july</h5>
				</div>
				<hr />
			</div>

		</div>
	</div>

</div>


<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">Recent Users</div>
			<div class="panel-body text-center recent-users-sec">
				<img class="img-thumbnail" src="assets/img/user.gif" /> <img
					class="img-thumbnail" src="assets/img/user2.png" /> <img
					class="img-thumbnail" src="assets/img/user.gif" /> <img
					class="img-thumbnail" src="assets/img/user2.png" /> <img
					class="img-thumbnail" src="assets/img/user.gif" /> <img
					class="img-thumbnail" src="assets/img/user2.png" /> <img
					class="img-thumbnail" src="assets/img/user.gif" /> <img
					class="img-thumbnail" src="assets/img/user2.png" /> <img
					class="img-thumbnail" src="assets/img/user.gif" />
			</div>
		</div>
	</div>
	<div class="col-md-8 col-sm-8 col-xs-12">
		<div class="panel panel-success">
			<div class="panel-heading">Responsive Table Example</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Username</th>
								<th>User No.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>100090</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
								<td>100090</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
								<td>100090</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>100090</td>
							</tr>
							<tr>
								<td>5</td>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
								<td>100090</td>
							</tr>
							<tr>
								<td>6</td>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
								<td>100090</td>
							</tr>
							<tr>
								<td>7</td>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
								<td>100090</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</div>
<div class="row">

	<div class="col-md-8 col-sm-8 col-xs-12">
		<div class="panel panel-warning">
			<div class="panel-heading">Recent Comments</div>
			<div class="panel-body">
				<ul class="media-list">

					<li class="media"><a class="pull-left" href="#"> <img
							class="media-object img-circle img-comments"
							src="assets/img/user.gif" />
					</a>
						<div class="media-body">
							<h4 class="media-heading">Lorem ipsum dolor sit amet</h4>
							<p>Donec sit amet ligula enim. Duis vel condimentum massa.
								Maecenas eget congue dui interdum nibh et, volutpat dolor.</p>
							<!-- Nested media object -->
							<div class="media">
								<a class="pull-left" href="#"> <img
									class="media-object img-circle img-comments"
									src="assets/img/user2.png">
								</a>
								<div class="media-body">
									<h4 class="media-heading">Nulla gravida vitae neque</h4>
									Donec sit amet ligula enim. Duis vel condimentum massa.
									Maecenas eget congue dui. Vestibulum et eros consectetur,
									interdum nibh et, volutpat dolor.
									<!-- Nested media object -->
									<div class="media">
										<a class="pull-left" href="#"> <img
											class="media-object img-circle img-comments"
											src="assets/img/user.gif" />
										</a>
										<div class="media-body">
											<h4 class="media-heading">Donec sit amet ligula enim</h4>
											Donec sit amet ligula enim. Duis vel condimentum massa.
											Maecenas eget congue dui. Vestibulum et eros consectetur,
											interdum nibh et, volutpat dolor.
										</div>
									</div>
								</div>
							</div>

						</div></li>

				</ul>
			</div>
		</div>

	</div>
	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="alert alert-info text-center">
			<h3>IMPORTANT NOTICE</h3>
			<hr />
			<i class="fa fa-warning fa-4x"></i>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn. Lorem
				ipsum dolor sit amet, consectetur adipiscing elit gthn. Lorem ipsum
				dolor sit amet.</p>
			<hr />
			<a href="#" class="btn btn-info">Read Full Detalis</a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">Alerts Examples</div>
			<div class="panel-body">
				<h5>
					<strong>Simple Alert</strong>
				</h5>
				<div class="alert alert-info">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a
						href="#" class="alert-link">Alert Link</a>.
				</div>
				Info: You can use other classes like <i>alert-success</i> , <i>alert-warning</i>
				&amp; <i>alert-danger</i> instead of <i>alert-info</i> <br />
				<h5>
					<strong>Dismissable Alert</strong>
				</h5>
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a
						href="#" class="alert-link">Alert Link</a>.
				</div>
				Info: You can use other classes like <i>alert-info</i> , <i>alert-warning</i>
				&amp; <i>alert-danger</i> instead of <i>alert-success</i>
				<hr />
				<h5>
					<strong> ICON EXAMPLES </strong>
				</h5>
				<i class="fa fa-briefcase "></i> <i class="fa fa-briefcase fa-2x"></i>
				<i class="fa fa-briefcase fa-3x"></i> <i
					class="fa fa-briefcase fa-4x"></i> <i class="fa fa-briefcase fa-5x"></i>
				<br /> <br /> <i class="fa fa-recycle "></i> <i
					class="fa fa-recycle fa-2x"></i> <i class="fa fa-recycle fa-3x"></i>
				<i class="fa fa-recycle fa-4x"></i> <i class="fa fa-recycle fa-5x"></i>
				<br />
				<p class="alert alert-warning">
					For more customization Of icons please visit website :
					fortawesome.github.io/Font-Awesome/icons/ or <a
						href="http://fortawesome.github.io/Font-Awesome/icons/"
						target="_blank">Click here</a> . You will get all font-awesome
					icons and there classes there.
				</p>

			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel panel-info">
			<div class="panel-heading">Compose a Message</div>
			<div class="panel-body">
				<form role="form">
					<div class="form-group">
						<label>Enter Name</label> <input class="form-control" type="text" />
					</div>
					<div class="form-group">
						<label>Enter Email</label> <input class="form-control" type="text" />
					</div>
					<div class="form-group">
						<label>Subject</label> <input class="form-control" type="text" />
					</div>
					<div class="form-group">
						<label>Enter Message</label> <input class="form-control"
							type="text" style="min-height: 100px;" />
					</div>

					<div class="form-group">
						<label>Attach File </label> <input type="file" />
					</div>

					<div class="form-group">
						<label>For Role </label>
						<div class="checkbox">
							<label> <input type="checkbox" value="" />Webmaster
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" />Admin
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" />Employee
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" />User
							</label>
						</div>
					</div>


					<button type="submit" class="btn btn-success">Send Message
					</button>
					<button type="reset" class="btn btn-primary">Reset Fields</button>

				</form>
			</div>
		</div>
	</div>

</div>

</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>