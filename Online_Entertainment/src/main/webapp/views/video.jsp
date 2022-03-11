<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<main class="mt-5">
	<!-- Section: Basic example -->
	

	<!-- List Videos New -->
	<section class="m-auto" style="margin-top: -30px; max-width: 80%;">
		<h4>
			<strong style="color: rgba(255, 255, 255, 0.7);">Mới cập
				nhật</strong>
		</h4>
		<hr class="bg-light" style="margin-top: -5px; margin-bottom: 30px;" />
		<div class="row wow fadeInUpBig">
			<c:forEach var="list" items="${videos}">
				<div class="col-lg-3 col-md-4 mb-4">
					<div class="bg-image hover-overlay hover-zoom ripple"
						data-mdb-ripple-color="light" id="box-card">
						<img style="width: 100%;"
							src="https://img.youtube.com/vi/${list.poster}/maxresdefault.jpg"
							class="img-fluid" /><a
							href="<c:url value = '/video?action=watch&id=${list.id}'/>">
							<b class="mask"
							style="background-color: rgba(128, 128, 128, 0.233);"></b>
						</a>
						<div class="p-1 position-absolute bottom-0 start-0" id="ls-btn">
							<a href="#!" class="btn btn-danger btn-floating"> <i
								class="fas fa-heart"></i>
							</a> <a href="#!" class="btn btn-success btn-floating"
								data-mdb-toggle="modal" data-mdb-target="#exampleModal"> <i
								class="fas fa-share"></i>
							</a>
						</div>
					</div>
					<div class="mt-2">
						<h6 class="card-title text-light">${list.title}</h6>
						<p class="card-text">
							<strong class="text-info" style="font-size: 10pt">${list.views}
								views</strong> - <strong class="text-success" style="font-size: 10pt">${list.share}
								shares</strong>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</main>
<!-- Modal share-->
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
								style="color: white;" /> <label class="form-label text-success"
								style="color: white;" for="form1">Email Address</label>
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