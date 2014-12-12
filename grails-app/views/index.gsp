<%@ page import="warehouse.Item" %>

<g:applyLayout name="main">

	<content tag="content">
		<div class="col-xs-12 col-sm-12 col-md-12 homebanner-holder">
			<!-- ========================================== SECTION – HERO ========================================= -->

			<div id="hero">
				<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">

					<div class="item" style="background-image: url(http://demo.transvelo.com/unicase/assets/images/sliders/01.jpg);">
						<div class="container-fluid">
							<div class="caption bg-color vertical-center text-left">
								<div class="big-text fadeInDown-1">
									The new <span class="highlight">imac</span> for you
								</div>

								<div class="excerpt fadeInDown-2 hidden-xs">

									<span>21.5-Inch Now Starting At $1099 </span>
									<span>27-Inch Starting At $1799</span>
								</div>
								<div class="button-holder fadeInDown-3">
									<a href="index.php?page=single-product" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a>
								</div>
							</div><!-- /.caption -->
						</div><!-- /.container-fluid -->
					</div><!-- /.item -->

					<div class="item" style="background-image: url(http://demo.transvelo.com/unicase/assets/images/sliders/01.jpg);">
						<div class="container-fluid">
							<div class="caption bg-color vertical-center text-left">
								<div class="big-text fadeInDown-1">
									The new <span class="highlight">imac</span> for you
								</div>

								<div class="excerpt fadeInDown-2 hidden-xs">

									<span>21.5-Inch Now Starting At $1099 </span>
									<span>27-Inch Starting At $1799</span>
								</div>
								<div class="button-holder fadeInDown-3">
									<a href="index.php?page=single-product" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a>
								</div>
							</div><!-- /.caption -->
						</div><!-- /.container-fluid -->
					</div><!-- /.item -->



				</div><!-- /.owl-carousel -->
			</div>

			<!-- ========================================= SECTION – HERO : END ========================================= -->

	<!-- ============================================== INFO BOXES ============================================== -->
	<div class="info-boxes wow fadeInUp animated" style="visibility: visible; -webkit-animation: fadeInUp;">
		<div class="info-boxes-inner">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="info-box">
						<div class="row">
							<div class="col-xs-2">
								<i class="icon fa fa-dollar"></i>
							</div>
							<div class="col-xs-10">
								<h4 class="info-box-heading green">money back</h4>
							</div>
						</div>
						<h6 class="text">30 Day Money Back Guarantee.</h6>
					</div>
				</div><!-- .col -->

				<div class="col-md-4 col-sm-4">
					<div class="info-box">
						<div class="row">
							<div class="col-xs-2">
								<i class="icon fa fa-truck"></i>
							</div>
							<div class="col-xs-10">
								<h4 class="info-box-heading orange">free shipping</h4>
							</div>
						</div>
						<h6 class="text">free ship-on oder over $600.00</h6>
					</div>
				</div><!-- .col -->

				<div class="col-md-4 col-sm-4">
					<div class="info-box">
						<div class="row">
							<div class="col-xs-2">
								<i class="icon fa fa-gift"></i>
							</div>
							<div class="col-xs-10">
								<h4 class="info-box-heading red">Special Sale</h4>
							</div>
						</div>
						<h6 class="text">All items-sale up to 20% off </h6>
					</div>
				</div><!-- .col -->
			</div><!-- /.row -->
		</div><!-- /.info-boxes-inner -->

	</div><!-- /.info-boxes -->
<!-- ============================================== INFO BOXES : END ============================================== -->
<!-- ============================================== SCROLL TABS ============================================== -->
	<div id="product-tabs-slider" class="scroll-tabs outer-top-vs wow fadeInUp animated" style="visibility: visible; -webkit-animation: fadeInUp;">
		<div class="more-info-tab clearfix ">
			<h3 class="new-product-title pull-left">New Products</h3>
			<ul class="nav nav-tabs nav-tab-line pull-right" id="new-products-1">
				<li class="active"><a data-transition-type="backSlide" href="#all" data-toggle="tab">All</a></li>
				<li><a data-transition-type="backSlide" href="#smartphone" data-toggle="tab">smartphone</a></li>
				<li><a data-transition-type="backSlide" href="#laptop" data-toggle="tab">laptop</a></li>
				<li><a data-transition-type="backSlide" href="#apple" data-toggle="tab">apple</a></li>
			</ul><!-- /.nav-tabs -->
		</div>

		<div class="tab-content outer-top-xs">
			<div class="tab-pane in active" id="all">
				<div class="product-slider">
					<div class="owl-carousel home-owl-carousel custom-carousel owl-theme" >

						<div class="owl-wrapper-outer">
							<div class="owl-wrapper" >
							<div class="owl-item" >
								<div class="item item-carousel">
									<%for(item in Item.findAll()){%>
									<div class="products">
										<div class="product">
											<div class="product-image">
												<div class="image">
													<a href="index.php?page=detail"><img src="http://localhost:8080/warehouse/item/viewImage/?id=<%=item?.id%>&photo_id=1" alt=""></a>
												</div><!-- /.image -->

												<div class="tag hot"><span>hot</span></div>
											</div><!-- /.product-image -->


											<div class="product-info text-left">
												<h3 class="name"><a href="index.php?page=detail"><%= item?.name %></a></h3>
												<div class="rating rateit-small rateit"><button id="rateit-reset-23" data-role="none" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-23" style="display: none;"></button><div id="rateit-range-23" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-23" aria-valuemin="0" aria-valuemax="5" aria-valuenow="4" aria-readonly="true" style="width: 80px; height: 16px;"><div class="rateit-selected" style="height: 16px; width: 64px;"></div><div class="rateit-hover" style="height: 16px;"></div></div></div>
												<div class="description"></div>

												<div class="product-price">
													<span class="price">
														$<%= item?.price %>				</span>
													<span class="price-before-discount">$ <%= item?.price + 100 %></span>

												</div><!-- /.product-price -->

											</div><!-- /.product-info -->
											<div class="cart clearfix animate-effect">
												<div class="action">
													<ul class="list-unstyled">
														<li class="add-cart-button btn-group">
															<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
																<i class="fa fa-shopping-cart"></i>
															</button>
															<a class="btn btn-primary" href="http://localhost:8080/warehouse/cart/additemtocart/?item_id=<%= item?.id %>&quantity=1">Add to cart</a>

														</li>

														<li class="lnk wishlist">
															<a class="add-to-cart" href="index.php?page=detail" title="Wishlist">
																<i class="icon fa fa-heart"></i>
															</a>
														</li>

														<li class="lnk">
															<a class="add-to-cart" href="index.php?page=detail" title="Compare">
																<i class="fa fa-retweet"></i>
															</a>
														</li>
													</ul>
												</div><!-- /.action -->
											</div><!-- /.cart -->
										</div><!-- /.product -->

									</div><!-- /.products -->
								<%}%>
								</div>
							</div>
							</div><!-- /.item -->
						</div>
						<div class="owl-controls clickable">
							<div class="owl-buttons">
								<div class="owl-prev"></div><div class="owl-next"></div>
							</div>
						</div>
					</div><!-- /.home-owl-carousel -->
				</div><!-- /.product-slider -->
			</div><!-- /.tab-pane -->


		</div><!-- /.tab-content -->
	</div><!-- /.scroll-tabs -->
<!-- ============================================== SCROLL TABS : END ============================================== -->
<!-- ============================================== WIDE PRODUCTS ============================================== -->
	<div class="wide-banners wow fadeInUp outer-bottom-vs animated" style="visibility: visible; -webkit-animation: fadeInUp;">
		<div class="row">

			<div class="col-md-7">
				<div class="wide-banner cnt-strip">
					<div class="image">
						<img class="img-responsive" src="http://demo.transvelo.com/unicase/assets/images/banners/1.jpg" alt="">
					</div>
					<div class="strip">
						<div class="strip-inner">
							<h3 class="hidden-xs">samsung</h3>
							<h2>galaxy</h2>
						</div>
					</div>
				</div><!-- /.wide-banner -->
			</div><!-- /.col -->

			<div class="col-md-5">
				<div class="wide-banner cnt-strip">
					<div class="image">
						<img class="img-responsive" src="http://demo.transvelo.com/unicase/assets/images/banners/2.jpg" alt="">
					</div>
					<div class="strip">
						<div class="strip-inner">
							<h3 class="hidden-xs">new trend</h3>
							<h2>watch phone</h2>
						</div>
					</div>
				</div><!-- /.wide-banner -->
			</div><!-- /.col -->

		</div><!-- /.row -->
	</div><!-- /.wide-banners -->

<!-- ============================================== WIDE PRODUCTS : END ============================================== -->

<!-- ============================================== WIDE PRODUCTS ============================================== -->
	<div class="wide-banners wow fadeInUp outer-bottom-vs animated" style="visibility: visible; -webkit-animation: fadeInUp;">
		<div class="row">

			<div class="col-md-12">
				<div class="wide-banner cnt-strip">
					<div class="image">
						<img class="img-responsive" data-echo="http://demo.transvelo.com/unicase/assets/images/banners/3.jpg" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" alt="">
					</div>
					<div class="strip strip-text">
						<div class="strip-inner">
							<h2 class="text-right">one stop place for<br>
								<span class="shopping-needs">all your shopping needs</span></h2>
						</div>
					</div>
					<div class="new-label">
						<div class="text">NEW</div>
					</div><!-- /.new-label -->
				</div><!-- /.wide-banner -->
			</div><!-- /.col -->

		</div><!-- /.row -->
	</div><!-- /.wide-banners -->
<!-- ============================================== WIDE PRODUCTS : END ============================================== -->

</div>
	</content>
</g:applyLayout>