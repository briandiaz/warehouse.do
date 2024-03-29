<%@ page import="warehouse.DashboardService; warehouse.BusinessLogicService; warehouse.Department; warehouse.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Meta -->
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="MediaCenter, Template, eCommerce">
	<meta name="robots" content="all">

	<title><g:layoutTitle default="WareHouse.DO"/></title>

	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/bootstrap.min.css">

	<!-- Customizable CSS -->
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/main.css">
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/dark-green.css">
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/owl.carousel.css">
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/owl.transitions.css">
	<!--<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/owl.theme.css">-->
	<link href="${createLink(uri: '/')}assets/css/lightbox.css" rel="stylesheet">
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/animate.min.css">
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/rateit.css">
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/bootstrap-select.min.css">

	<!-- Demo Purpose Only. Should be removed in production -->
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/config.css">

	<link href="${createLink(uri: '/')}assets/css/green.css" rel="alternate stylesheet" title="Green color">
	<link href="${createLink(uri: '/')}assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
	<link href="${createLink(uri: '/')}assets/css/red.css" rel="alternate stylesheet" title="Red color">
	<link href="${createLink(uri: '/')}assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
	<link href="${createLink(uri: '/')}assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
	<!-- Demo Purpose Only. Should be removed in production : END -->


	<!-- Icons/Glyphs -->
	<link rel="stylesheet" href="${createLink(uri: '/')}assets/css/font-awesome.min.css">

	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

	<!-- Favicon -->
	<link rel="shortcut icon" href="${createLink(uri: '/')}assets/images/favicon.ico">

	<!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
	<!--[if lt IE 9]>
			<script src="${createLink(uri: '/')}assets/js/html5shiv.js"></script>
			<script src="${createLink(uri: '/')}assets/js/respond.min.js"></script>
		<![endif]-->


	<!-- graficas-->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
		google.load("visualization", "1", {packages:["corechart"]});
		google.setOnLoadCallback(drawPieChart);
		function drawPieChart() {
			var data1 = google.visualization.arrayToDataTable([
				['Total', 'Hours per Day'],
				['Realizadas',     <%= warehouse.DashboardService.getrealizadas() %>],
				['Pendientes',      <%= DashboardService.getpendientes() %>],
				['Hoy',    <%= DashboardService.getdaily() %>]
			]);
			var options = {
				title: 'Compras',
				'width':400,
				'height':400
			};
			var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));
			chart1.draw(data1, options);
		}
	</script>

	<script type="text/javascript">
		google.load("visualization", "1", {packages:["corechart"]});
		google.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Compras', 'Total', 'Pendientes','Hoy'],
				['Compras',  <%=DashboardService.getrealizadas()%>,<%=DashboardService.getpendientes()%> ,<%=DashboardService.getdaily()%>]
			]);
			var options = {
				title: 'Compras',
				'width':400,
				'height':400
			};
			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
</head>
<body class="cnt-home">



<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">

	<!-- ============================================== TOP MENU ============================================== -->
	<div class="top-bar animate-dropdown">
		<div class="container">
			<div class="header-top-inner">
				<div class="cnt-account">
					<ul class="list-unstyled">
						<% if(BusinessLogicService.is_authenticated()) {%>
						<li><a href="${createLink(uri: '/')}cart"><i class="icon fa fa-shopping-cart"></i>My Cart</a></li>
						<li><a href="${createLink(uri: '/')}userDashboard/"><i class="icon fa fa-key"></i>History</a></li>
						<% if(BusinessLogicService.session().username == "admin") {%>
							<li><a href="${createLink(uri: '/')}item/create"><i class="icon fa fa-user"></i>Create Item</a></li>
							<li><a href="${createLink(uri: '/')}department/create"><i class="icon fa fa-shopping-cart"></i>Create Departament</a></li>
							<li><a href="${createLink(uri: '/')}area/create"><i class="icon fa fa-key"></i>Create Area</a></li>
							<li><a href="${createLink(uri: '/')}area/show/1"><i class="icon fa fa-key"></i>Item to be Delivered</a></li>
							<li><a href="${createLink(uri: '/')}payment/"><i class="icon fa fa-key"></i>Payments</a></li>
						<li><a href="${createLink(uri: '/')}adminDashboard/"><i class="icon fa fa-key"></i>History</a></li>
							<% } %>
							<li><g:link controller="user" action="logout" ><i class="icon fa fa-key"></i>LogOut</g:link></li>
						<%	} %>
						<% if(!BusinessLogicService.is_authenticated()) {%>
							<li><a href="${createLink(uri: '/')}login/auth"><i class="icon fa fa-sign-in"></i>Login</a></li>
						<% } %>
					</ul>
				</div><!-- /.cnt-account -->

				<div class="cnt-block">
					<ul class="list-unstyled list-inline">
						<li class="dropdown dropdown-small">
							<a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown"><span class="key">language :</span><span class="value">English </span><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">English</a></li>
								<li><a href="#">French</a></li>
								<li><a href="#">German</a></li>
							</ul>
						</li>
					</ul><!-- /.list-unstyled -->
				</div><!-- /.cnt-cart -->
				<div class="clearfix"></div>
			</div><!-- /.header-top-inner -->
		</div><!-- /.container -->
	</div><!-- /.header-top -->
<!-- ============================================== TOP MENU : END ============================================== -->
	<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
					<!-- ============================================================= LOGO ============================================================= -->
					<div class="logo">
						<a href="index.php?page=home">

							<img src="${createLink(uri: '/')}assets/images/logo.png" alt="">

						</a>
					</div><!-- /.logo -->
				<!-- ============================================================= LOGO : END ============================================================= -->				</div><!-- /.logo-holder -->

				<div class="col-xs-12 col-sm-12 col-md-6 top-search-holder">
					<div class="contact-row">
						<div class="phone inline">
							<i class="icon fa fa-phone"></i> (826) 616 2714
						</div>
						<div class="contact inline">
							<i class="icon fa fa-envelope"></i> saler@warehouse.do
						</div>
					</div><!-- /.contact-row -->
				<!-- ============================================================= SEARCH AREA ============================================================= -->
					<div class="search-area">
						<form>
							<div class="control-group">

								<ul class="categories-filter animate-dropdown">
									<li class="dropdown">

										<a class="dropdown-toggle"  data-toggle="dropdown" href="index.php?page=category">Categories <b class="caret"></b></a>

										<ul class="dropdown-menu" role="menu" >
											<li class="menu-header">Computer</li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="index.php?page=category">- Laptops</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="index.php?page=category">- Tv & audio</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="index.php?page=category">- Gadgets</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="index.php?page=category">- Cameras</a></li>

										</ul>
									</li>
								</ul>

								<input class="search-field" placeholder="Search here..." />

								<a class="search-button" href="#" ></a>

							</div>
						</form>
					</div><!-- /.search-area -->
				<!-- ============================================================= SEARCH AREA : END ============================================================= -->				</div><!-- /.top-search-holder -->

				<div class="col-xs-12 col-sm-12 col-md-3 animate-dropdown top-cart-row">
					<!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->

					<div class="dropdown dropdown-cart">
						<a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
							<div class="items-cart-inner">
								<div class="total-price-basket">
									<span class="lbl">cart -</span>
									<span class="total-price">
										<span class="sign">$</span>
										<span class="value">600.00</span>
									</span>
								</div>
								<div class="basket">
									<i class="glyphicon glyphicon-shopping-cart"></i>
								</div>
								<div class="basket-item-count"><span class="count">2</span></div>

							</div>
						</a>
						<ul class="dropdown-menu">
							<li>
								<div class="cart-item product-summary">
									<div class="row">
										<div class="col-xs-4">
											<div class="image">
												<a href="index.php?page=detail"><img src="${createLink(uri: '/')}assets/images/cart.jpg" alt=""></a>
											</div>
										</div>
										<div class="col-xs-7">

											<h3 class="name"><a href="index.php?page-detail">Simple Product</a></h3>
											<div class="price">$600.00</div>
										</div>
										<div class="col-xs-1 action">
											<a href="#"><i class="fa fa-trash"></i></a>
										</div>
									</div>
								</div><!-- /.cart-item -->
								<div class="clearfix"></div>
								<hr>

								<div class="clearfix cart-total">
									<div class="pull-right">

										<span class="text">Sub Total :</span><span class='price'>$600.00</span>

									</div>
									<div class="clearfix"></div>

									<a href="index.php?page=checkout" class="btn btn-upper btn-primary btn-block m-t-20">Checkout</a>
								</div><!-- /.cart-total-->


							</li>
						</ul><!-- /.dropdown-menu-->
					</div><!-- /.dropdown-cart -->

				<!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= -->				</div><!-- /.top-cart-row -->
			</div><!-- /.row -->

		</div><!-- /.container -->

	</div><!-- /.main-header -->

<!-- ============================================== NAVBAR ============================================== -->
	<div class="header-nav animate-dropdown">
		<div class="container">
			<div class="yamm navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="nav-bg-class">
					<div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
						<div class="nav-outer">
							<ul class="nav navbar-nav">
								<li class="active dropdown yamm-fw">
									<a href="${createLink(uri: '/')}" data-hover="dropdown" class="dropdown-toggle" data-toggle="dropdown">Inicio</a>
								</li>
								<li class="dropdown yamm">
									<a href="${createLink(uri: '/')}department/show/2">Computadoras</a>
								</li>

								<li class="dropdown">

									<a href="${createLink(uri: '/')}department/show/1">Smart Phones
										<span class="menu-label hot-menu hidden-xs">hot</span>
									</a>
								</li>
								<li class="dropdown hidden-sm">

									<a href="${createLink(uri: '/')}department/show/3">Deportes
										<span class="menu-label new-menu hidden-xs">new</span>
									</a>
								</li>

								<li class="dropdown hidden-sm">
									<a href="${createLink(uri: '/')}department/show/4">TV & Audio</a>
								</li>

								<li class="dropdown">
									<a href="${createLink(uri: '/')}">Contacto</a>
								</li>

								<li class="dropdown navbar-right">
									<a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">Pages</a>
								</li>

							</ul><!-- /.navbar-nav -->
							<div class="clearfix"></div>
						</div><!-- /.nav-outer -->
					</div><!-- /.navbar-collapse -->


				</div><!-- /.nav-bg-class -->
			</div><!-- /.navbar-default -->
		</div><!-- /.container-class -->

	</div><!-- /.header-nav -->
<!-- ============================================== NAVBAR : END ============================================== -->

</header>

<!-- ============================================== HEADER : END ============================================== -->

<div class="body-content outer-top-xs">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3 sidebar">
				<div class="side-menu animate-dropdown outer-bottom-xs">
					<div class="head"><i class="icon fa fa-align-justify fa-fw"></i> Departamentos</div>
					<nav class="yamm megamenu-horizontal" role="navigation">
						<ul class="nav">
							<%
								def departments = Department.findAll()

							%>
							<% for(department in departments){%>
							<li class="dropdown menu-item"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon fa <%= department.icon %> fa-fw"></i><%= department.name %></a></li><!-- /.menu-item -->
							<%}%>
						</ul><!-- /.nav -->
					</nav><!-- /.megamenu-horizontal -->
				</div>
				<g:pageProperty name="page.sidebar">

				</g:pageProperty>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder">
				<g:layoutBody/>
				<g:pageProperty name="page.content">
				</g:pageProperty>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12">

				<!-- ============================================== BRANDS CAROUSEL ============================================== -->
				<div id="brands-carousel" class="logo-slider wow fadeInUp">

					<h3 class="section-title">Our Brands</h3>
					<div class="logo-slider-inner">
						<div id="brand-slider" class="owl-carousel brand-slider custom-carousel owl-theme">
							<div class="item m-t-15">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand1.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item m-t-10">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand2.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand3.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand4.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand5.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand6.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand2.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand4.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand1.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->

							<div class="item">
								<a href="#" class="image">
									<img data-echo="http://demo.transvelo.com/unicase/assets/images/brands/brand5.png" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
								</a>
							</div><!--/.item-->
						</div><!-- /.owl-carousel #logo-slider -->
					</div><!-- /.logo-slider-inner -->

				</div><!-- /.logo-slider -->
			<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
			</div>
		</div>
	</div><!-- /.container -->
</div><!-- /.body-content -->
<!-- ============================================================= FOOTER ============================================================= -->
<footer id="footer" class="footer color-bg">
	<div class="links-social inner-top-sm">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-3">
					<!-- ============================================================= CONTACT INFO ============================================================= -->
					<div class="contact-info">
						<div class="footer-logo">
							<div class="logo">
								<a href="index.php?page=home">

									<img src="${createLink(uri: '/')}assets/images/logo.png" alt="">

								</a>
							</div><!-- /.logo -->

						</div><!-- /.footer-logo -->

						<div class="module-body m-t-20">
							<p class="about-us"> Nam libero tempore, cum soluta nobis est ses  eligendi optio cumque cum soluta nobis est ses  eligendi optio cumque.</p>

							<div class="social-icons">

								<a href="http://facebook.com/transvelo" class='active'><i class="icon fa fa-facebook"></i></a>
								<a href="#"><i class="icon fa fa-twitter"></i></a>
								<a href="#"><i class="icon fa fa-linkedin"></i></a>
								<a href="#"><i class="icon fa fa-rss"></i></a>
								<a href="#"><i class="icon fa fa-pinterest"></i></a>

							</div><!-- /.social-icons -->
						</div><!-- /.module-body -->

					</div><!-- /.contact-info -->
				<!-- ============================================================= CONTACT INFO : END ============================================================= -->            	</div><!-- /.col -->

				<div class="col-xs-12 col-sm-6 col-md-3">
					<!-- ============================================================= CONTACT TIMING============================================================= -->
					<div class="contact-timing">
						<div class="module-heading">
							<h4 class="module-title">opening time</h4>
						</div><!-- /.module-heading -->

						<div class="module-body outer-top-xs">
							<div class="table-responsive">
								<table class="table">
									<tbody>
									<tr><td>Monday-Friday:</td><td class="pull-right">08.00 To 18.00</td></tr>
									<tr><td>Saturday:</td><td class="pull-right">09.00 To 20.00</td></tr>
									<tr><td>Sunday:</td><td class="pull-right">10.00 To 20.00</td></tr>
									</tbody>
								</table>
							</div><!-- /.table-responsive -->
							<p class='contact-number'>Hot Line:(400)888 868 848</p>
						</div><!-- /.module-body -->
					</div><!-- /.contact-timing -->
				<!-- ============================================================= CONTACT TIMING : END ============================================================= -->            	</div><!-- /.col -->

				<div class="col-xs-12 col-sm-6 col-md-3">
					<!-- ============================================================= LATEST TWEET============================================================= -->
					<div class="latest-tweet">
						<div class="module-heading">
							<h4 class="module-title">latest tweet</h4>
						</div><!-- /.module-heading -->

						<div class="module-body outer-top-xs">
							<div class="re-twitter">
								<div class="comment media">
									<div class='pull-left'>
										<span class="icon fa-stack fa-lg">
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
										</span>
									</div>
									<div class="media-body">
										<a href="#">@laurakalbag</a> As a result of your previous recommendation :)
										<span class="time">
											12 hours ago
										</span>
									</div>
								</div>

							</div>
							<div class="re-twitter">
								<div class="comment media">
									<div class='pull-left'>
										<span class="icon fa-stack fa-lg">
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
										</span>
									</div>
									<div class="media-body">
										<a href="#">@laurakalbag</a> As a result of your previous recommendation :)
										<span class="time">
											12 hours ago
										</span>
									</div>
								</div>
							</div>
						</div><!-- /.module-body -->
					</div><!-- /.contact-timing -->
				<!-- ============================================================= LATEST TWEET : END ============================================================= -->            	</div><!-- /.col -->

				<div class="col-xs-12 col-sm-6 col-md-3">
					<!-- ============================================================= INFORMATION============================================================= -->
					<div class="contact-information">
						<div class="module-heading">
							<h4 class="module-title">information</h4>
						</div><!-- /.module-heading -->

						<div class="module-body outer-top-xs">
							<ul class="toggle-footer" style="">
								<li class="media">
									<div class="pull-left">
										<span class="icon fa-stack fa-lg">
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-map-marker fa-stack-1x fa-inverse"></i>
										</span>
									</div>
									<div class="media-body">
										<p>868 Any Stress,Burala Casi,Picasa USA.</p>
									</div>
								</li>

								<li class="media">
									<div class="pull-left">
										<span class="icon fa-stack fa-lg">
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-mobile fa-stack-1x fa-inverse"></i>
										</span>
									</div>
									<div class="media-body">
										<p>(400) 0888 888 888<br>(400) 888 888 888</p>
									</div>
								</li>

								<li class="media">
									<div class="pull-left">
										<span class="icon fa-stack fa-lg">
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
										</span>
									</div>
									<div class="media-body">
										<span><a href="#">Contact @warehouse.do</a></span><br>
										<span><a href="#">Sale @warehouse.do</a></span>
									</div>
								</li>

							</ul>
						</div><!-- /.module-body -->
					</div><!-- /.contact-timing -->
				<!-- ============================================================= INFORMATION : END ============================================================= -->            	</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container -->
	</div><!-- /.links-social -->

	<div class="footer-bottom inner-bottom-sm">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="module-heading outer-bottom-xs">
						<h4 class="module-title">category</h4>
					</div><!-- /.module-heading -->

					<div class="module-body">
						<ul class='list-unstyled'>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Returns</a></li>
							<li><a href="#">Libero Sed rhoncus</a></li>
							<li><a href="#">Venenatis augue tellus</a></li>
							<li><a href="#">My Vouchers</a></li>
						</ul>
					</div><!-- /.module-body -->
				</div><!-- /.col -->

				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="module-heading outer-bottom-xs">
						<h4 class="module-title">my account</h4>
					</div><!-- /.module-heading -->

					<div class="module-body">
						<ul class='list-unstyled'>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Customer Service</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Site Map</a></li>
							<li><a href="#">Search Terms</a></li>
						</ul>
					</div><!-- /.module-body -->
				</div><!-- /.col -->

				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="module-heading outer-bottom-xs">
						<h4 class="module-title">our services</h4>
					</div><!-- /.module-heading -->

					<div class="module-body">
						<ul class='list-unstyled'>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Returns</a></li>
							<li><a href="#">Libero Sed rhoncus</a></li>
							<li><a href="#">Venenatis augue tellus</a></li>
							<li><a href="#">My Vouchers</a></li>
						</ul>
					</div><!-- /.module-body -->
				</div><!-- /.col -->

				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="module-heading outer-bottom-xs">
						<h4 class="module-title">help & support</h4>
					</div><!-- /.module-heading -->

					<div class="module-body">
						<ul class='list-unstyled'>
							<li><a href="#">Knowledgebase</a></li>
							<li><a href="#">Terms of Use</a></li>
							<li><a href="#">Contact Support</a></li>
							<li><a href="#">Marketplace Blog</a></li>
							<li><a href="#">About Unicase</a></li>
						</ul>
					</div><!-- /.module-body -->
				</div>
			</div>
		</div>
	</div>

	<div class="copyright-bar">
		<div class="container">
			<div class="col-xs-12 col-sm-6 no-padding">
				<div class="copyright">
					Copyright © 2014
					<a href="index.php?page=home">WareHouse.DO</a>
					- All rights Reserved
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 no-padding">
				<div class="clearfix payment-methods">
					<ul>
						<li><img src="${createLink(uri: '/')}assets/images/1.png" alt=""></li>
						<li><img src="${createLink(uri: '/')}assets/images/2.png" alt=""></li>
						<li><img src="${createLink(uri: '/')}assets/images/3.png" alt=""></li>
						<li><img src="${createLink(uri: '/')}assets/images/4.png" alt=""></li>
						<li><img src="${createLink(uri: '/')}assets/images/5.png" alt=""></li>
					</ul>
				</div><!-- /.payment-methods -->
			</div>
		</div>
	</div>
</footer>
<!-- ============================================================= FOOTER : END============================================================= -->



<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="${createLink(uri: '/')}assets/js/jquery-1.11.1.min.js"></script>

<script src="${createLink(uri: '/')}assets/js/bootstrap.min.js"></script>

<script src="${createLink(uri: '/')}assets/js/bootstrap-hover-dropdown.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/owl.carousel.min.js"></script>

<script src="${createLink(uri: '/')}assets/js/echo.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/jquery.easing-1.3.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/bootstrap-slider.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/jquery.rateit.min.js"></script>
<script type="text/javascript" src="${createLink(uri: '/')}assets/js/lightbox.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/bootstrap-select.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/wow.min.js"></script>
<script src="${createLink(uri: '/')}assets/js/scripts.js"></script>



</body>
</html>