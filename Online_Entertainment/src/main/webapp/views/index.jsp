<%@ page pageEncoding="utf-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>Online Entertainment</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://wowjs.uk/css/libs/animate.css">
        <style>
            .img1 {
                background-image: url('https://data.1freewallpapers.com/download/caitlyn-ekko-jinx-vi-4k-arcane.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center center;
            }
            
            .img2 {
                background-image: url('https://i.vietgiaitri.com/2019/7/9/hot-phim-hoat-hinh-one-piece-ra-mat-phan-moi-nhat-doc-quyen-tren-kenh-pops-anime-77dc57.png');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center center;
            }
            
            .img3 {
                background-image: url('https://vtv1.mediacdn.vn/2019/4/26/poster-payoff-1-1556273680151870157160-crop-1556273779257196175768.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center center;
            }
            
            .navbar .nav-link {
                color: #fff !important;
            }
        </style>
    </head>

<body class="bg-dark">
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<jsp:include page="menu.jsp"></jsp:include>
	<header>
		<!-- Carousel wrapper -->
		<div id="introCarousel"
			class="carousel slide carousel-fade shadow-2-strong"
			data-mdb-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-mdb-target="#introCarousel" data-mdb-slide-to="0"
					class="active"></li>
				<li data-mdb-target="#introCarousel" data-mdb-slide-to="1"></li>
				<li data-mdb-target="#introCarousel" data-mdb-slide-to="2"></li>
			</ol>

			<!-- Inner -->
			<div class="carousel-inner">
				<!-- Single item -->
				<div class="carousel-item active img1" style="height: 60vh;">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.1);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center">
								<h1 class="mb-3">A R C A N E</h1>
								<h5 class="mb-4">RIOT - ARCANE - VALORANT</h5>
								<a class="btn btn-success btn-rounded btn-lg" href="detail.jsp"
									role="button" rel="nofollow">CHI TIẾT</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Single item -->
				<div class="carousel-item img2" style="height: 60vh;">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.2);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center">
								<h1 class="mb-3">O N E P I E C E</h1>
								<h5 class="mb-4">SUPER TEAM WANO</h5>
								<a class="btn btn-success btn-rounded btn-lg" href="#"
									role="button" rel="nofollow">CHI TIẾT</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Single item -->
				<div class="carousel-item img3" style="height: 60vh;">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center">
								<h1 class="mb-3">A V E N G E R S</h1>
								<h5 class="mb-4">END GAME</h5>
								<a class="btn btn-success btn-rounded btn-lg" href="#"
									role="button" rel="nofollow">CHI TIẾT</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Inner -->

			<!-- Controls -->
			<a class="carousel-control-prev" href="#introCarousel" role="button"
				data-mdb-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#introCarousel" role="button"
				data-mdb-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<!-- Carousel wrapper -->
	</header>
	<!--Main layout-->
	<jsp:include page="video.jsp"></jsp:include>
	<!--Main layout-->
	<!--footer-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--footer-->
</body>
<script src="https://wowjs.uk/dist/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>

    </html>