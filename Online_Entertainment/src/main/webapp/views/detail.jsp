<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Entertainment Detail</title>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css"
	rel="stylesheet" />
<style>
.navbar .nav-link {
	color: #fff !important;
}
</style>
</head>

<body class="bg-dark py-5">
	<jsp:include page="menu.jsp"></jsp:include>
	<!--Main layout-->
	<main class="mt-4 mb-5">
		<div class="container">
			<!--Grid row-->
			<section class="mb-4">
				<div class="ratio ratio-16x9">
					<iframe src="https://www.youtube.com/embed/${video.id}"
						title="YouTube video" allowfullscreen></iframe>
				</div>
				<div class="row m-auto">
					<div class="col-md-8">
						<h5 class="text-light py-4">${video.title}</h5>
					</div>
					<div class="col-12 col-md-4 m-auto w-auto">
						<a type="button" class="text-danger"><i
							class="far fa-heart fa-lg"></i> <strong id="likeOrUnlike"
							style="margin-left: 8px;"> <c:choose>
									<c:when test="${like == true}">Unfavorite</c:when>
									<c:otherwise>Favorite</c:otherwise>
								</c:choose>
						</strong></a> <a type="button" data-mdb-toggle="modal"
							class="text-success px-5" data-mdb-target="#exampleModal"><i
							class="fas fa-share fa-lg"></i><strong style="margin-left: 10px;">Share</strong>
						</a>
					</div>
					<hr class="bg-light">
					<div class="container">
						<div class="col-12 py-2">
							<p class="note note-success">
								<strong>Mô tả :</strong> ${video.description}
							</p>
						</div>
					</div>
				</div>
			</section>
			<div class="row">
				<!--Grid column-->
				<div class="col-md-8">
					<!--Section: Post data-mdb-->
					<div class="row d-flex justify-content-center">
						<div class="col-md-12 col-lg-12">
							<div class="text-light bg-dark">
								<div class="card-body">
									<h5 class="mb-0" style="margin-top: -25px;">Recent
										comments</h5>
									<p class="fw-light mb-4 pb-2">Latest Comments section by
										users</p>

									<div class="d-flex flex-start">
										<img class="rounded-circle shadow-1-strong me-3"
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp"
											alt="avatar" width="40" height="40" />
										<div>
											<h6 class="fw-bold mb-1">Maggie Marsh</h6>
											<div class="d-flex align-items-center mb-3">
												<p class="mb-0">
													March 07, 2021 <span class="badge bg-primary">Pending</span>
												</p>
												<a href="#!" class="link-muted"><i
													class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
													class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
												<a href="#!" class="link-muted"><i
													class="fas fa-heart ms-2"></i></a>
											</div>
											<p class="mb-0">Lorem Ipsum is simply dummy text of the
												printing and typesetting industry.</p>
										</div>
									</div>
								</div>

								<div class="card-body p-4">
									<div class="d-flex flex-start">
										<img class="rounded-circle shadow-1-strong me-3"
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(26).webp"
											alt="avatar" width="40" height="40" />
										<div>
											<h6 class="fw-bold mb-1">Lara Stewart</h6>
											<div class="d-flex align-items-center mb-3">
												<p class="mb-0">
													March 15, 2021 <span class="badge bg-success">Approved</span>
												</p>
												<a href="#!" class="link-muted"><i
													class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
													class="text-success"><i class="fas fa-redo-alt ms-2"></i></a>
												<a href="#!" class="link-danger"><i
													class="fas fa-heart ms-2"></i></a>
											</div>
											<p class="mb-0">Contrary to popular belief, Lorem Ipsum
												is not simply random text. It has roots in a piece of
												classical Latin literature from 45 BC, making it over 2000
												years old.</p>
										</div>
									</div>
								</div>

								<div class="card-body p-4">
									<div class="d-flex flex-start">
										<img class="rounded-circle shadow-1-strong me-3"
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(33).webp"
											alt="avatar" width="40" height="40" />
										<div>
											<h6 class="fw-bold mb-1">Alexa Bennett</h6>
											<div class="d-flex align-items-center mb-3">
												<p class="mb-0">
													March 24, 2021 <span class="badge bg-danger">Rejected</span>
												</p>
												<a href="#!" class="link-muted"><i
													class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
													class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
												<a href="#!" class="link-muted"><i
													class="fas fa-heart ms-2"></i></a>
											</div>
											<p class="mb-0">There are many variations of passages of
												Lorem Ipsum available, but the majority have suffered
												alteration in some form</p>
										</div>
									</div>
								</div>

								<div class="card-body p-4">
									<div class="d-flex flex-start">
										<img class="rounded-circle shadow-1-strong me-3"
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(24).webp"
											alt="avatar" width="40" height="40" />
										<div>
											<h6 class="fw-bold mb-1">Betty Walker</h6>
											<div class="d-flex align-items-center mb-3">
												<p class="mb-0">
													March 30, 2021 <span class="badge bg-primary">Pending</span>
												</p>
												<a href="#!" class="link-muted"><i
													class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
													class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
												<a href="#!" class="link-muted"><i
													class="fas fa-heart ms-2"></i></a>
											</div>
											<p class="mb-0">It uses a dictionary of over 200 Latin
												words, combined with a handful of model sentence structures,
												to generate Lorem Ipsum which looks reasonable.</p>
										</div>
									</div>
									<div class="py-4">
										<div class="d-flex flex-start w-100">
											<img class="rounded-circle shadow-1-strong me-3"
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(19).webp"
												alt="avatar" width="40" height="40" />
											<div class="form-outline w-100">
												<textarea class="form-control bg-dark" id="textAreaExample"
													rows="4" style="background: #fff;"></textarea>
												<label class="form-label text-light" for="textAreaExample">Message</label>
											</div>
										</div>
										<div class="float-end mt-2 pt-1">
											<button type="button" class="btn btn-info btn-sm">Post
												comment</button>
											<button type="button" class="btn btn-outline-info btn-sm">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-md-4 mb-4">
					<!--Section: Ad-->
					<section class="text-center">
						<div class="row bg-image hover-overlay ripple mb-3">
							<a href=""><img
								src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
								class="img-fluid" /> </a>
							<h5 class="pt-2 text-light">Material Design for Bootstrap 5</h5>
						</div>
						<div class="bg-image hover-overlay ripple mb-3">
							<a href=""><img
								src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
								class="img-fluid" /> </a>
							<h5 class="pt-2 text-light">Material Design for Bootstrap 5</h5>
						</div>
						<div class="bg-image hover-overlay ripple mb-3">
							<a href=""><img
								src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
								class="img-fluid" /> </a>
							<h5 class="pt-2 text-light">Material Design for Bootstrap 5</h5>
						</div>
						<div class="bg-image hover-overlay ripple mb-3">
							<a href=""><img
								src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
								class="img-fluid" /> </a>
							<h5 class="pt-2 text-light">Material Design for Bootstrap 5</h5>
						</div>
						<div class="bg-image hover-overlay ripple mb-3">
							<a href=""><img
								src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
								class="img-fluid" /> </a>
							<h5 class="pt-2 text-light">Material Design for Bootstrap 5</h5>
						</div>
						<div class="bg-image hover-overlay ripple mb-3">
							<a href=""><img
								src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
								class="img-fluid" /> </a>
							<h5 class="pt-2 text-light">Material Design for Bootstrap 5</h5>
						</div>
					</section>
					<!--Section: Ad-->
				</div>
				<!--Grid column-->
			</div>
			<!--Grid row-->
		</div>
	</main>
	<!--Main layout-->
	<!-- Modal -->
	<div class="modal top fade" id="exampleModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content"
				style="background-color: rgba(128, 128, 128, 0)">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-white text-center">
						<h1 class="mb-3 text-success">Share the movie link to your
							friends</h1>
						<div class="input-group">
							<div class="form-outline" style="width: calc(100% - 60px);">
								<input type="email" id="form" class="form-control"
									style="color: white;" /> <label
									class="form-label text-success" style="color: white;"
									for="form1">Email Address</label>
							</div>
							<button type="button" class="btn btn-success">
								<i class="fas fa-share"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
<script>
	$('#likeOrUnlike').click(function() {
		$.ajax({
			url : '<c:url value = '/video?action=like&id=${video.id}'/>'
		}).then(function(data) {
			var text = $('#likeOrUnlike').text();
			if (text.indexOf('Favorite') != -1) {
				$('#likeOrUnlike').text('Unfavorite');
			} else {
				$('#likeOrUnlike').text('Favorite');
			}
		}).fail(function(error) {
			alert('Vui lòng đăng nhập !!!');
		})
	});
</script>
</html>