
<%@ page import="org.codehaus.groovy.grails.web.json.JSONObject; grails.converters.JSON; warehouse.Department" %>

<g:applyLayout name="main">

	<content tag="content">
	<!-- ========================================== SECTION – HERO ========================================= -->

	<div id="category" class="category-carousel hidden-xs">
		<div class="item">
			<div class="image">
				<img src="${createLink(uri: '/')}assets/images/_<%= departmentInstance.id %>.jpg" alt="" class="img-responsive">
			</div>
			<div class="container-fluid">
				<div class="caption vertical-top text-left">
					<div class="big-text" style="text-shadow:1px 1px 1px black;font-size: 14rem;">
						<%= departmentInstance?.name %>
					</div>

					<div class="excerpt hidden-sm hidden-md" style="font-size: 3rem;color:white;text-shadow:1px 1px 1px black">
						<%= departmentInstance?.description %>
					</div>

				</div><!-- /.caption -->
			</div><!-- /.container-fluid -->
		</div>
	</div>




	<!-- ========================================= SECTION – HERO : END ========================================= -->
	<div class="clearfix filters-container m-t-10">
		<div class="row">
			<div class="col col-sm-6 col-md-2">
				<div class="filter-tabs">
					<ul id="filter-tabs" class="nav nav-tabs nav-tab-box nav-tab-fa-icon">
						<li class="active">
							<a data-toggle="tab" href="#grid-container"><i class="icon fa fa-th-list"></i>Grid</a>
						</li>
						<li><a data-toggle="tab" href="#list-container"><i class="icon fa fa-th"></i>List</a></li>
					</ul>
				</div><!-- /.filter-tabs -->
			</div><!-- /.col -->
			<div class="col col-sm-12 col-md-6">
				<div class="col col-sm-3 col-md-6 no-padding">
					<div class="lbl-cnt">
						<span class="lbl">Sort by</span>
						<div class="fld inline">
							<div class="dropdown dropdown-small dropdown-med dropdown-white inline">
								<button data-toggle="dropdown" type="button" class="btn dropdown-toggle">
									Position <span class="caret"></span>
								</button>

								<ul role="menu" class="dropdown-menu">
									<li role="presentation"><a href="#">position</a></li>
									<li role="presentation"><a href="#">Price:Lowest first</a></li>
									<li role="presentation"><a href="#">Price:HIghest first</a></li>
									<li role="presentation"><a href="#">Product Name:A to Z</a></li>
								</ul>
							</div>
						</div><!-- /.fld -->
					</div><!-- /.lbl-cnt -->
				</div><!-- /.col -->
				<div class="col col-sm-3 col-md-6 no-padding">
					<div class="lbl-cnt">
						<span class="lbl">Show</span>
						<div class="fld inline">
							<div class="dropdown dropdown-small dropdown-med dropdown-white inline">
								<button data-toggle="dropdown" type="button" class="btn dropdown-toggle">
									1 <span class="caret"></span>
								</button>

								<ul role="menu" class="dropdown-menu">
									<li role="presentation"><a href="#">1</a></li>
									<li role="presentation"><a href="#">2</a></li>
									<li role="presentation"><a href="#">3</a></li>
									<li role="presentation"><a href="#">4</a></li>
									<li role="presentation"><a href="#">5</a></li>
									<li role="presentation"><a href="#">6</a></li>
									<li role="presentation"><a href="#">7</a></li>
									<li role="presentation"><a href="#">8</a></li>
									<li role="presentation"><a href="#">9</a></li>
									<li role="presentation"><a href="#">10</a></li>
								</ul>
							</div>
						</div><!-- /.fld -->
					</div><!-- /.lbl-cnt -->
				</div><!-- /.col -->
			</div><!-- /.col -->
			<div class="col col-sm-6 col-md-4 text-right">
				<div class="pagination-container">
					<ul class="list-inline list-unstyled">
						<li class="prev"><a href="#"><i class="fa fa-angle-left"></i></a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li class="next"><a href="#"><i class="fa fa-angle-right"></i></a></li>
					</ul><!-- /.list-inline -->
				</div><!-- /.pagination-container -->       </div><!-- /.col -->
		</div><!-- /.row -->
	</div>
	<div class="search-result-container">
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane active " id="grid-container">
				<div class="category-product  inner-top-vs">
					<div class="row">
						<% for(item in itemDepartment){ %>
						<div class="col-sm-6 col-md-4 wow fadeInUp animated">
							<div class="products">

								<div class="product">
									<div class="product-image">
										<div class="image">
											<g:link controller="item" action="show" id="${item?.id}"><img src="http://localhost:8080/warehouse/item/viewImage/?id=<%=item?.id%>&photo_id=1" alt="" class="img-responsive"></g:link>
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
						</div><!-- /.item -->
						<%}%>
					</div><!-- /.row -->
				</div><!-- /.category-product -->

			</div><!-- /.tab-pane -->

			<div class="tab-pane " id="list-container">
				<div class="category-product  inner-top-vs">
					<% for(item in itemDepartment){ %>

					<div class="category-product-inner wow fadeInUp animated" >
						<div class="products">
							<div class="product-list product">
								<div class="row product-list-row">
									<div class="col col-sm-4 col-lg-4">
										<div class="product-image">
											<div class="image">
												<img src="http://demo.transvelo.com/unicase/assets/images/products/c1.jpg" alt="">
											</div>
										</div><!-- /.product-image -->
									</div><!-- /.col -->
									<div class="col col-sm-8 col-lg-8">
										<div class="product-info">
											<h3 class="name"><a href="index.php?page=detail"><%= item.name %></a></h3>
											<div class="rating rateit-small rateit"><button id="rateit-reset-14" data-role="none" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-14" style="display: none;"></button><div id="rateit-range-14" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-14" aria-valuemin="0" aria-valuemax="5" aria-valuenow="4" style="width: 80px; height: 16px;" aria-readonly="true"><div class="rateit-selected" style="height: 16px; width: 64px;"></div><div class="rateit-hover" style="height: 16px;"></div></div></div>
											<div class="product-price">
												<span class="price">
													$<%= item.price %>                </span>
												<span class="price-before-discount">$ <%= (item.price+(item.price*0.4)) %></span>

											</div><!-- /.product-price -->
											<div class="description m-t-10"><%= item?.description %></div>
											<div class="cart clearfix animate-effect">
												<div class="action">
													<ul class="list-unstyled">
														<li class="add-cart-button btn-group">
															<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
																<i class="fa fa-shopping-cart"></i>
															</button>
															<button class="btn btn-primary" type="button">Add to cart</button>

														</li>
													</ul>
												</div><!-- /.action -->
											</div><!-- /.cart -->

										</div><!-- /.product-info -->
									</div><!-- /.col -->
								</div><!-- /.product-list-row -->
								<div class="tag new"><span>new</span></div>        </div><!-- /.product-list -->
						</div><!-- /.products -->
					</div><!-- /.category-product-inner -->
					<%}%>
				</div><!-- /.category-product -->
			</div><!-- /.tab-pane #list-container -->
		</div><!-- /.tab-content -->
		<div class="clearfix filters-container">

			<div class="text-right">
				<div class="pagination-container">
					<ul class="list-inline list-unstyled">
						<li class="prev"><a href="#"><i class="fa fa-angle-left"></i></a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li class="next"><a href="#"><i class="fa fa-angle-right"></i></a></li>
					</ul><!-- /.list-inline -->
				</div><!-- /.pagination-container -->                           </div><!-- /.text-right -->

		</div><!-- /.filters-container -->

	</div><!-- /.search-result-container -->

		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</content>
</g:applyLayout>