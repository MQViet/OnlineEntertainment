<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark d-lg-block fixed-top"
	style="z-index: 2000; background-color: rgba(0, 0, 0, 0.7);">
	<div class="container-fluid" style="width: 85%;">
		<!-- Navbar brand -->
		<a class="navbar-brand nav-link" href="/Online_Entertainment/home">
			<strong>ONLINE ENTERTAINMENT</strong>
		</a>
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
			aria-controls="navbarExample01" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarExample01">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="#"></a></li>
			</ul>

			<ul class="navbar-nav d-flex flex-row">
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<c:set var="login" value="true"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="login" value="false"></c:set>
					</c:otherwise>
				</c:choose>
				<!-- Icons -->
				<c:if test="${login}">
					<li class="nav-item me-3 me-lg-0"><a class="nav-link"
						href="favoriteAndHistory" rel="nofollow"><i
							class="fas fa-heart fa-lg text-danger"></i> </a></li>
				</c:if>
				<!-- Avatar -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle d-flex align-items-center" href="#"
					id="navbarDropdownMenuLink" role="button" data-mdb-target="#login"
					data-mdb-toggle="${login?'dropdown':'modal'}" aria-expanded="false"><strong
						style="margin-right: 8px;">${login?sessionScope.currentUser.fullname:'Sign in'}</strong><img
						src="https://i.pinimg.com/564x/93/50/da/9350da8543fefd16e218428b75965198.jpg"
						class="rounded-circle" height="25" alt="profile" /> </a>
					<ul class="dropdown-menu text-center"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">My profile</a></li>
						<li><a class="dropdown-item" href="favoriteAndHistory">History</a></li>
						<li><a class="dropdown-item" data-mdb-target="#changepass"
							data-mdb-toggle="modal" href="#">Change Password</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="logout">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
<!-- Navbar -->
<!-- Modal change pass -->
<div class="modal top fade" id="changepass" data-mdb-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style="background-color: #242424;">
			<div class="container m-auto text-center py-5"
				style="max-width: 90%;">
				<button type="button"
					class="btn-close position-absolute top-0 end-0 py-3 px-3"
					data-mdb-dismiss="modal" aria-label="Close"></button>
				<h1 class="mb-4 text-light">Change Password</h1>
				<div class="alert alert-info mb-4" role="alert">User ID : ${sessionScope.currentUser.id}</div>

				<!-- Password input -->
				<div class="form-outline form-white mb-4">
					<input name="currentPass" type="password" id="currentPwd" class="form-control" />
					<label class="form-label" for="form3Example3">Current
						Password</label>
				</div>

				<!-- Password input -->
				<div class="form-outline form-white mb-4">
					<input name="newPass" type="password" id="newPwd" class="form-control" />
					<label class="form-label" for="form3Example3">New Password</label>
				</div>

				<!-- Password input -->
				<div class="form-outline form-white mb-4">
					<input type="password" id="form3Example3" class="form-control" />
					<label class="form-label" for="form3Example4">Confirm
						Password</label>
				</div>

				<!-- Submit button -->
				<button type="submit" id="changePwd" class="btn btn-info btn-block">Change</button>
				<div id="messChange" class="alert alert-info mt-4 text-center" role="alert">Messenger</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal Sign in -->
<div class="modal top fade" id="login" data-mdb-backdrop="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="card container p-5"
				style="max-width: 500px; background-color: #242424;">

				<!-- Pills navs -->
				<ul class="nav nav-tabs nav-fill mb-3" id="ex1" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active text-danger fw-bold"
						style="background-color: #242424;" id="tab-login"
						data-mdb-toggle="pill" href="#pills-login" role="tab"
						aria-controls="pills-login" aria-selected="true">Sign in</a></li>
					<li class="nav-item" role="presentation"><a
						class="nav-link text-danger fw-bold"
						style="background-color: #242424;" id="tab-register"
						data-mdb-toggle="pill" href="#pills-register" role="tab"
						aria-controls="pills-register" aria-selected="false">Register</a>
					</li>
				</ul>
				<!-- Pills navs -->

				<!-- Pills content -->
				<div class="tab-content">
					<div class="tab-pane fade show active" id="pills-login"
						role="tabpanel" aria-labelledby="tab-login">
						<form action="/Online_Entertainment/login" method="POST">
							<h1 class="fw-bold mb-3 text-center text-light">Sign in</h1>
							<div class="text-center mb-3">
								<p class="text-light">Sign in with</p>
								<button type="button"
									class="btn btn-primary btn-floating mx-1 bg-info">
									<i class="fab fa-facebook-f"></i>
								</button>

								<button type="button"
									class="btn btn-primary btn-floating mx-1 bg-info">
									<i class="fab fa-google"></i>
								</button>
							</div>

							<p class="text-center text-light">or</p>

							<!-- UserID input -->
							<div class="form-outline form-white mb-4">
								<input name="luser" type="text" id="loginName"
									class="form-control" required="required" /> <label
									class="form-label" for="loginName">User ID</label>
							</div>

							<!-- Password input -->
							<div class="form-outline form-white mb-4">
								<input name="lpassword" type="password" id="loginPassword"
									class="form-control" required="required" /> <label
									class="form-label" for="loginPassword">Password</label>
							</div>

							<!-- 2 column grid layout -->
							<div class="row mb-4">
								<div class="col-md-6 d-flex justify-content-center">
									<!-- Checkbox -->
									<div class="form-check mb-3 mb-md-0">
										<input class="form-check-input" type="checkbox" value=""
											id="loginCheck" checked /> <label
											class="form-check-label text-white-50" for="loginCheck">
											Remember me </label>
									</div>
								</div>

								<div class="col-md-6 d-flex justify-content-center">
									<!-- Simple link -->
									<a class="link-danger fw-bold small" data-mdb-target="#forgot"
										data-mdb-toggle="modal" href="#!">Forgot password?</a>
								</div>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-info btn-block mb-4">Sign
								in</button>
						</form>
					</div>
					<!-- Register -->
					<div class="tab-pane fade" id="pills-register" role="tabpanel"
						aria-labelledby="tab-register">
						<form action="/Online_Entertainment/register" method="POST">
							<h1 class="fw-bold mb-3 text-center text-light">Register</h1>
							<div class="text-center mb-3">
								<p class="text-light">Sign up with</p>
								<button type="button"
									class="btn btn-primary btn-floating mx-1 bg-info">
									<i class="fab fa-facebook-f"></i>
								</button>

								<button type="button"
									class="btn btn-primary btn-floating mx-1 bg-info">
									<i class="fab fa-google"></i>
								</button>
							</div>

							<p class="text-center text-light">or</p>

							<!-- User ID input -->
							<div class="form-outline form-white mb-4">
								<input name="re-user" type="text" id="registerName"
									class="form-control" required="required" /> <label
									class="form-label" for="registerName">User Name</label>
							</div>

							<!-- Full name input -->
							<div class="form-outline form-white mb-4">
								<input name="re-fullname" type="text" id="registerUsername"
									class="form-control" required="required" /> <label
									class="form-label" for="registerUsername">Full Name</label>
							</div>

							<!-- Email input -->
							<div class="form-outline form-white mb-4">
								<input name="re-email" type="email" id="registerEmail"
									class="form-control" required="required" /> <label
									class="form-label" for="registerEmail">Email</label>
							</div>

							<!-- Password input -->
							<div class="form-outline form-white mb-4">
								<input name="re-pass" type="password" id="registerPassword"
									class="form-control" required="required" /> <label
									class="form-label" for="registerPassword">Password</label>
							</div>

							<!-- Repeat Password input -->
							<div class="form-outline form-white mb-4">
								<input name="re-confirm" type="password"
									id="registerRepeatPassword" class="form-control"
									required="required" /> <label class="form-label"
									for="registerRepeatPassword">Repeat password</label>
							</div>

							<!-- Checkbox -->
							<div class="form-check d-flex justify-content-center mb-4">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="registerCheck" checked
									aria-describedby="registerCheckHelpText" /> <label
									class="form-check-label text-white-50" for="registerCheck">
									I have read and agree to the terms </label>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-info btn-block mb-3">Sign
								in</button>
						</form>
					</div>
				</div>
				<!-- Pills content -->
			</div>
		</div>
	</div>
</div>
<!-- Modal Forgot -->
<div class="modal top fade" id="forgot" data-mdb-backdrop="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="card container p-5" style="background-color: #242424;">
				<h2 class="fw-bold mb-4 text-center text-light">Forgot Password</h2>
				<div class="text-center mb-4">
					<p class="text-info">Enter your email to update your password</p>
				</div>
				<!-- Email input -->
				<div class="form-outline form-white">
					<input name="forgotmail" id="mailfor" type="email"
						class="form-control" placeholder="Email Address"
						aria-label="Email" aria-describedby="basic-addon1"
						required="required" />
				</div>
				<!-- Submit button -->
				<button id="idforgot" class="btn btn-info btn-block mt-4">Password
					Recovery</button>
				<div id="messen" class="alert alert-info mt-4 text-center" role="alert">Messenger</div>
			</div>
		</div>
	</div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$('#idforgot').click(function() {
		$('#messen').text('');
		var emaill = $('#mailfor').val();
		var formData = {'forgotmail' : emaill };
		$.ajax({
			url : 'forgotPass',
			type : 'POST',
			data : formData
		}).then(function(data) {
			$('#messen').text('Your password has been reset, please check your email - back to the homepage in 5s');
			setTimeout(function() {
				window.location.href = 'http://localhost:8080/Online_Entertainment/home';
			},5*1000)
		}).fail(function(error) {
			$('#messen').text('Please try again');
		});
	})
</script>
<script>
	$('#changePwd').click(function() {
		$('#messChange').text('');
		var currentPass = $('#currentPwd').val();
		var newPass = $('#newPwd').val();
		var formData = {'currentPass' : currentPass,
						'newPass' : newPass};
		$.ajax({
			url : 'changePassword',
			type : 'POST',
			data : formData
		}).then(function(data) {
			$('#messChange').text('Your password has been changed successfully');
		}).fail(function(error) {
			$('#messChange').text('Your password is not correct, please try again !');
		});
	})
</script>