
<%@ page import="warehouse.NCF_Type; warehouse.Cart" %>
<g:set var="entityName" value="${message(code: 'cart.label', default: 'Carrito de Compras')}" />
<g:applyLayout name="main">

	<content tag="content">
		<div class="row inner-bottom-sm">
			<div class="shopping-cart">
				<div class="col-md-12 col-sm-12 shopping-cart-table ">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
							<tr>
								<th class="cart-description item">Imagen</th>
								<th class="cart-product-name item">Nombre de Producto</th>
								<th class="cart-qty item">Cantidad</th>
								<th class="cart-sub-total item">Subtotal</th>
								<th class="cart-total last-item">Total</th>
							</tr>
							</thead><!-- /thead -->
							<tfoot>
							<tr>
								<td colspan="7">
									<div class="shopping-cart-btn">
										<span class="">
											<a href="#" class="btn btn-upper btn-primary outer-left-xs">Continue Shopping</a>
											<a href="#" class="btn btn-upper btn-primary pull-right outer-right-xs">Update shopping cart</a>
										</span>
									</div><!-- /.shopping-cart-btn -->
								</td>
							</tr>
							</tfoot>
							<tbody>
							<g:each in="${cartItems}" status="i" var="item">
							<tr>
								<td class="cart-image">
									<g:link controller="item" action="show" id="${item?.id}">
										<img src="assets/images/products/shopping_cart_01.jpg" alt="">
									</g:link>
								</td>
								<td class="cart-product-name-info">
									<h4 class="cart-product-description"><g:link controller="item" action="show" id="${item?.id}"><%= item.name %></g:link></h4>
									<div class="cart-product-info">
										<span class="product-imel">Descripción:<span><%= item.description %></span></span><br>
									</div>
								</td>
								<td class="cart-product-quantity">
									<div class="quant-input">
										<div class="arrows">
											<div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
											<div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
										</div>
										<input type="text" value="1">
									</div>
								</td>
								<td class="cart-product-sub-total"><span class="cart-sub-total-price">$<%= item.sub_total() %></span></td>
								<td class="cart-product-grand-total"><span class="cart-grand-total-price">$<%= item.grand_total() %></span></td>
							</tr>
							</g:each>

							</tbody><!-- /tbody -->
						</table><!-- /table -->
					</div>
				</div><!-- /.shopping-cart-table -->				<div class="col-md-4 col-sm-12 estimate-ship-tax">
				<table class="table table-bordered">
					<thead>
					<tr>
						<th>
							<span class="estimate-title">Tipo de Factura</span>
							<p>Elige tu tipo de factura.</p>
						</th>
					</tr>
					</thead><!-- /thead -->
					<tbody>
					<tr>
						<td>
							<div class="form-group">
								<label class="info-title control-label">NCF <span>*</span></label>

								<select name=""  class="form-control unicase-form-control selectpicker" style="display: none;">
									<option>--Selecciona el tipo de factura--</option>
									<% for(item in NCF_Type.list()){ %>
									<option value="<%= item.id %>"><%= item.name %></option>
									<% } %>
								</select>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div><!-- /.estimate-ship-tax -->


				<div class="col-md-4 col-sm-12 cart-shopping-total">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th>
								<div class="cart-sub-total">
									Subtotal<span class="inner-left-md">$<%= sub_total %></span>
								</div>
								<div class="cart-grand-total">
									Grand Total<span class="inner-left-md">$<%= grand_total %></span>
								</div>
							</th>
						</tr>
						</thead><!-- /thead -->
						<tbody>
						<tr>
							<td>
								<div class="cart-checkout-btn pull-right">
									<button type="submit" class="btn btn-primary">PROCCED TO CHEKOUT</button>
									<span class="">Checkout with multiples address!</span>
								</div>
							</td>
						</tr>
						</tbody><!-- /tbody -->
					</table><!-- /table -->
				</div><!-- /.cart-shopping-total -->
			</div><!-- /.shopping-cart -->
		</div> <!-- /.row -->
	</content>
</g:applyLayout>