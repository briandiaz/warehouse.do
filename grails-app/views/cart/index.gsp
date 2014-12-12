
<%@ page import="warehouse.NCF_Type; warehouse.Cart; warehouse.Cart_Items" %>
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
										<img class="img-responsive" src="http://localhost:8080/warehouse/item/viewImage/?id=<%= item?.item?.id %>&photo_id=1" alt="">

								</td>
								<td class="cart-product-name-info">
									<h4 class="cart-product-description"><%= item?.item?.name %></h4>
									<div class="cart-product-info">
										<span class="product-imel">Descripción:<span><%= item?.item?.description %></span></span><br>
									</div>
								</td>
								<td class="cart-product-quantity">
									<div class="quant-input">
										<div class="arrows">
											<div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
											<div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
										</div>
										<input type="text" value="<%= item?.quantity %>">
									</div>
								</td>
								<td class="cart-product-sub-total"><span class="cart-sub-total-price">$<%= item?.item?.sub_total() %></span></td>
								<td class="cart-product-grand-total"><span class="cart-grand-total-price">$<%= item?.item?.grand_total() %></span></td>
							</tr>
							</g:each>

							</tbody><!-- /tbody -->
						</table><!-- /table -->
					</div>
				</div><!-- /.shopping-cart-table -->

				<div class="col-md-offset-6 col-md-6 col-sm-12 cart-shopping-total">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th>
								<div class="cart-sub-total">
									SubTotal<span class="inner-left-md">$<%= sub_total %></span>
								</div>
								<div class="cart-grand-total">
									Total<span class="inner-left-md">$<%= grand_total %></span>
								</div>
							</th>
						</tr>
						</thead><!-- /thead -->
						<tbody>
						<tr>
							<td>
								<div class="cart-checkout-btn pull-right">
									<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
										<div class="form-group">
											<label class="info-title control-label">NCF <span>*</span></label>

											<select  class="form-control unicase-form-control selectpicker" >
												<option>--Selecciona el tipo de factura--</option>
												<% for(item in NCF_Type.list()){ %>
												<option value="<%= item.id %>"><%= item.name %></option>
												<% } %>
											</select>
											<input type="text" class="form-control" id="invoice" name="invoice" value="FA1234" required="required">
										</div>
										<input type="hidden" name="cmd" value="_xclick">
										<input type="hidden" name="business" value="deamon@host809.com">
										<input type="hidden" name="currency_code" value="USD">
										<input type="hidden" name="upload" value="1">
										<input type="hidden" name="cbt" value="Realizar Compra WareHouse.do"> %{--  --}%
										<input type="hidden" name="rm" value="2"> %{--Indicando que haga un redirect por el metodo POST--}%
										<input type="hidden" name="return" value="http://localhost:8080/warehouse/payment/processPayment">
										<input type="hidden" name="cancel_return" value="http://localhost:8080/warehouse/payment/cancelledPayment">

										<% def description = "";
											for(item in cartItems){
												description +=item?.item?.name + " \r\n";
										    }%>
										<input type="hidden" id="item_name" name="item_name" value="<%= description %>">
										<input type="hidden" id=amount" name="amount" value="<%= grand_total %>">

										<button type="submit" class="btn btn-link">
											<img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" alt="Pay">
										</button>
									</form>
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