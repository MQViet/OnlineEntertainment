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
body {
	background-color: #fbfbfb;
}

@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding: 58px 0 0; /* Height of navbar */
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 5%), 0 2px 10px 0 rgb(0 0 0/ 5%);
	width: 240px;
	z-index: 600;
}

@media ( max-width : 991.98px) {
	.sidebar {
		width: 100%;
	}
}

.sidebar .active {
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0 rgb(0 0 0/ 12%);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: 0.5rem;
	overflow-x: hidden;
	overflow-y: auto;
}
</style>
</head>

<body>
	<div class="container">
		<header>
			<!-- Sidebar -->
			<nav id="sidebarMenu"
				class="collapse d-lg-block sidebar collapse bg-white">
				<div class="position-sticky">
					<div class="list-group list-group-flush mx-3 mt-4">
						<span
							class="list-group-item list-group-item-action mb-5 py-2 ripple active"><i
							class="fas fa-address-card fa-fw me-3"></i>${sessionScope.currentUser.fullname}</span>
						<a href="#"
							class="list-group-item list-group-item-action py-2 ripple"
							aria-current="true"> <i
							class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main
								dashboard</span>
						</a> <a href="#"
							class="list-group-item list-group-item-action py-2 ripple"
							aria-current="true"> <i class="fab fa-youtube fa-fw me-3"></i><span>Video</span>
						</a> <a href="#"
							class="list-group-item list-group-item-action py-2 ripple"><i
							class="fas fa-users fa-fw me-3"></i><span>Users</span></a>
					</div>
				</div>
			</nav>
		</header>

		<!--Main layout-->
		<main style="margin-top: 58px">
			<div class="container pt-4">
				<!--Section: Sales Performance KPIs-->
				<section class="mb-4">
					<div class="card">
						<div class="card-header py-3">
							<h5 class="mb-0 text-center">
								<strong>Video Favorite Statistics</strong>
							</h5>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Title</th>
											<th scope="col">Views</th>
											<th scope="col">Total Likes</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${videoss}">
											<tr>
												<td><a class="link-danger fw-bold"
													href="/video?action=watch&id=${list.videoId}">${list.videoId}</a></td>
												<td>${list.title}</td>
												<td>${list.views}</td>
												<td>${list.totalLike}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
				<!--Section: Statistics with subtitles-->
				<section>
					<div class="py-4">
						<h5 class="text-center">
							<strong>Video Favorite Info</strong>
						</h5>
						<div class="dropdown" style="max-width: 100%;">
							<button class="btn btn-info dropdown-toggle" type="button"
								id="dropdownMenuButton" data-mdb-toggle="dropdown"
								aria-expanded="false">List Videos</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<c:forEach var="item" items="${videoss}">
									<li><a class="dropdown-item" href="#">${item.title}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6 col-md-12 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between p-md-1">
										<div class="d-flex flex-row">
											<div class="align-self-center">
												<i class="fas fa-pencil-alt text-info fa-3x me-4"></i>
											</div>
											<div>
												<h4>Total Posts</h4>
												<p class="mb-0">Monthly blog posts</p>
											</div>
										</div>
										<div class="align-self-center">
											<h2 class="h1 mb-0">18,000</h2>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-md-12 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between p-md-1">
										<div class="d-flex flex-row">
											<div class="align-self-center">
												<i class="far fa-comment-alt text-warning fa-3x me-4"></i>
											</div>
											<div>
												<h4>Total Comments</h4>
												<p class="mb-0">Monthly blog posts</p>
											</div>
										</div>
										<div class="align-self-center">
											<h2 class="h1 mb-0">84,695</h2>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6 col-md-12 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between p-md-1">
										<div class="d-flex flex-row">
											<div class="align-self-center">
												<h2 class="h1 mb-0 me-4">$76,456.00</h2>
											</div>
											<div>
												<h4>Total Sales</h4>
												<p class="mb-0">Monthly Sales Amount</p>
											</div>
										</div>
										<div class="align-self-center">
											<i class="far fa-heart text-danger fa-3x"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-md-12 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between p-md-1">
										<div class="d-flex flex-row">
											<div class="align-self-center">
												<h2 class="h1 mb-0 me-4">$36,000.00</h2>
											</div>
											<div>
												<h4>Total Cost</h4>
												<p class="mb-0">Monthly Cost</p>
											</div>
										</div>
										<div class="align-self-center">
											<i class="fas fa-wallet text-success fa-3x"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!--Section: Statistics with subtitles-->
			</div>
		</main>
		<!--Main layout-->
	</div>
</body>
<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
</html>