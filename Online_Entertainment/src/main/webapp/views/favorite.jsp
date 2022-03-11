<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Favorite And History</title>
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
<link rel="stylesheet" href="https://wowjs.uk/css/libs/animate.css">
</head>

<body class="bg-dark py-5">
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container py-5">
		<section class="m-auto" style="margin-top: -30px;">
			<h4>
				<strong style="color: rgba(255, 255, 255, 0.7); margin-left: 10px;">Video
					yêu thích</strong>
			</h4>
			<hr class="bg-light" style="margin-top: -5px;" />
			<div class="row wow bounce">
				<c:forEach var="list" items="${videofa}">
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
								<a href="#!" class="btn btn-success btn-floating"
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
		<jsp:include page="history.jsp"></jsp:include>
	</div>
</body>
<script src="https://wowjs.uk/dist/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>

</html>