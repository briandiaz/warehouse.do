
<%@ page import="warehouse.Area" %>
<g:applyLayout name="main">

	<content tag="content">
		<div class="row">
			<h1><%= areaInstance?.name %></h1>
		</div>
		<div class="category-product  inner-top-vs">
			<div class="row">
				<% for(item in items){ %>
				<div class="col-sm-6 col-md-4 wow fadeInUp animated">
					<div class="products">

						<div class="product">
							<div class="product-image">
								<div class="image">
									<g:link controller="item" action="show" id="${item?.id}"><img src="http://demo.transvelo.com/unicase/assets/images/products/3.jpg" alt=""></g:link>
								</div><!-- /.image -->

								<div class="tag new"><span>new</span></div>
							</div><!-- /.product-image -->


							<div class="product-info text-left">
								<h3 class="name"><g:link controller="item" action="show" id="${item?.id}"><%= item.name %></g:link></h3>
								<div class="rating rateit-small rateit"><button id="rateit-reset-2" data-role="none" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-2" style="display: none;"></button><div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="4" aria-readonly="true" style="width: 80px; height: 16px;"><div class="rateit-selected" style="height: 16px; width: 64px;"></div><div class="rateit-hover" style="height: 16px;"></div></div></div>
								<div class="description"></div>

								<div class="product-price">
									<span class="price">
										$<%= item.price.toString() %>
									</span>
									<span class="price-before-discount">
										$ <%= item.grand_total().toString() %>
									</span>

								</div><!-- /.product-price -->

							</div><!-- /.product-info -->
							<div class="cart clearfix animate-effect">
								<div class="action">
									<ul class="list-unstyled">
										<li class="add-cart-button btn-group">
											<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
												<i class="fa fa-shopping-cart"></i>
											</button>
											<button class="btn btn-primary" type="button">Add to cart</button>

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
				</div><!-- /.item -->
			<%}%>
			</div>
		</div>

	</content>
</g:applyLayout>