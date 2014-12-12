
<%@ page import="warehouse.Item" %>
<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
<g:applyLayout name="main">
	<%
		def photo_1 = 'http://localhost:8080/warehouse/item/viewImage/?id='+itemInstance?.id+'&photo_id=1'
		def photo_2 = 'http://localhost:8080/warehouse/item/viewImage/?id='+itemInstance?.id+'&photo_id=2'
		def photo_3 = 'http://localhost:8080/warehouse/item/viewImage/?id='+itemInstance?.id+'&photo_id=3'
		def photo_4 = 'http://localhost:8080/warehouse/item/viewImage/?id='+itemInstance?.id+'&photo_id=4'
		def photo_5 = 'http://localhost:8080/warehouse/item/viewImage/?id='+itemInstance?.id+'&photo_id=5'
	%>
	<content tag="content">
		<div class="row single-product outer-bottom-sm ">
			<div class='col-md-12'>
				<div class="row  wow fadeInUp">
					<div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
						<div class="product-item-holder size-big single-product-gallery small-gallery">

							<div id="owl-single-product">
								<div class="single-product-gallery-item" id="slide1">
									<a data-lightbox="image-1" data-title="Gallery" href="<%= photo_1 %>">
										<img class="img-responsive" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_1 %>" />
									</a>
								</div><!-- /.single-product-gallery-item -->

								<div class="single-product-gallery-item" id="slide2">
									<a data-lightbox="image-1" data-title="Gallery" href="<%= photo_2 %>">
										<img class="img-responsive" alt="" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_2 %>" />
									</a>
								</div><!-- /.single-product-gallery-item -->

								<div class="single-product-gallery-item" id="slide3">
									<a data-lightbox="image-1" data-title="Gallery" href="<%= photo_3 %>">
										<img class="img-responsive" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_3 %>" />
									</a>
								</div><!-- /.single-product-gallery-item -->

								<div class="single-product-gallery-item" id="slide4">
									<a data-lightbox="image-1" data-title="Gallery" href="<%= photo_4 %>">
										<img class="img-responsive" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_4 %>" />
									</a>
								</div><!-- /.single-product-gallery-item -->

								<div class="single-product-gallery-item" id="slide5">
									<a data-lightbox="image-1" data-title="Gallery" href="<%= photo_5 %>">
										<img class="img-responsive" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_5 %>" />
									</a>
								</div><!-- /.single-product-gallery-item -->


							</div><!-- /.single-product-slider -->


							<div class="single-product-gallery-thumbs gallery-thumbs">

								<div id="owl-single-product-thumbnails">
									<div class="item">
										<a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0" href="#slide1">
											<img class="img-responsive" width="85" alt="" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_1 %>" />
										</a>
									</div>

									<div class="item">
										<a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
											<img class="img-responsive" width="85" alt="" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_2 %>"/>
										</a>
									</div>
									<div class="item">

										<a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
											<img class="img-responsive" width="85" alt="" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_3 %>" />
										</a>
									</div>
									<div class="item">

										<a class="horizontal-thumb" data-target="#owl-single-product" data-slide="0" href="#slide4">
											<img class="img-responsive" width="85" alt="" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_4 %>" />
										</a>
									</div>
									<div class="item">

										<a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide5">
											<img class="img-responsive" width="85" alt="" src="http://demo.transvelo.com/unicase/assets/images/blank.gif" data-echo="<%= photo_5 %>" />
										</a>
									</div>
								</div><!-- /#owl-single-product-thumbnails -->



							</div><!-- /.gallery-thumbs -->

						</div><!-- /.single-product-gallery -->
					</div><!-- /.gallery-holder -->
					<div class='col-sm-6 col-md-7 product-info-block'>
						<div class="product-info">
							<h1 class="name"><%= itemInstance?.name %></h1>

							<div class="stock-container info-container m-t-10">
								<div class="row">
									<div class="col-sm-3">
										<div class="stock-box">
											<span class="label">Availability :</span>
										</div>
									</div>
									<div class="col-sm-9">
										<div class="stock-box">
											<span class="value"><%= itemInstance?.reorder %></span>
										</div>
									</div>
								</div><!-- /.row -->
							</div><!-- /.stock-container -->
							<div class="stock-container info-container m-t-10">
								<div class="row">
									<div class="col-sm-3">
										<div class="stock-box">
											<span class="label">Department :</span>
										</div>
									</div>
									<div class="col-sm-9">
										<div class="stock-box">
											<span><%= itemInstance?.department.name %></span>
										</div>
									</div>
								</div><!-- /.row -->
							</div><!-- /.stock-container -->

							<div class="description-container m-t-20">
								${itemInstance?.description}
							</div><!-- /.description-container -->

							<div class="price-container info-container m-t-20">
								<div class="row">


									<div class="col-sm-6">
										<div class="price-box">
											<span class="price">$<%= itemInstance?.price %></span>
											<span class="price-strike">$<%= itemInstance?.price + 100 %></span>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="favorite-button m-t-10">
											<a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Wishlist" href="#">
												<i class="fa fa-heart"></i>
											</a>
											<a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Add to Compare" href="#">
												<i class="fa fa-retweet"></i>
											</a>
											<a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="E-mail" href="#">
												<i class="fa fa-envelope"></i>
											</a>
										</div>
									</div>

								</div><!-- /.row -->
							</div><!-- /.price-container -->

							<div class="quantity-container info-container">
								<div class="row">

									<form action="http://localhost:8080/warehouse/cart/additemtocart/" method="GET">
										<input type="hidden" value="<%= itemInstance?.id %>" name="item_id" id="item_id">
										<div class="col-sm-2">
											<span class="label">Qty :</span>
										</div>

										<div class="col-sm-2">
											<div class="cart-quantity">
												<div class="quant-input">
													<div class="arrows">
														<div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
														<div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
													</div>
													<input type="text" value="1" name="quantity" id="quantity">
												</div>
											</div>
										</div>
										<div class="col-sm-7">
											<button type="submit" class="btn btn-primary"><i class="fa fa-shopping-cart inner-right-vs"></i> ADD TO CART</button>
										</div>
									</form>


								</div><!-- /.row -->
							</div><!-- /.quantity-container -->

							<div class="product-social-link m-t-20 text-right">
								<span class="social-label">Share :</span>
								<div class="social-icons">
									<ul class="list-inline">
										<li><a class="fa fa-facebook" href="http://facebook.com/transvelo"></a></li>
										<li><a class="fa fa-twitter" href="#"></a></li>
										<li><a class="fa fa-linkedin" href="#"></a></li>
										<li><a class="fa fa-rss" href="#"></a></li>
										<li><a class="fa fa-pinterest" href="#"></a></li>
									</ul><!-- /.social-icons -->
								</div>
							</div>




						</div><!-- /.product-info -->
					</div><!-- /.col-sm-7 -->
				</div><!-- /.row -->


				<div class="product-tabs inner-bottom-xs  wow fadeInUp">
					<div class="row">
						<div class="col-sm-3">
							<ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
								<li class="active"><a data-toggle="tab" href="#description">DESCRIPTION</a></li>
							</ul><!-- /.nav-tabs #product-tabs -->
						</div>
						<div class="col-sm-9">

							<div class="tab-content">

								<div id="description" class="tab-pane in active">
									<div class="product-tab">
										<p class="text"><%= itemInstance?.description %></p>
									</div>
								</div><!-- /.tab-pane -->



							</div><!-- /.tab-content -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.product-tabs -->
			</div>
		</div>
	</content>
</g:applyLayout>
