
<%@ page import="warehouse.Status; warehouse.Purchase; warehouse.Area" %>
<g:applyLayout name="main">

	<content tag="content">
		<div class="row">
			<h1><%= areaInstance?.name %></h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover ">
					<thead>
					<tr>

						<th>Usuario</th>
						<th>NCF</th>
						<th>Amount</th>
						<th>Nombre</th>
						<th>Invoice#</th>
						<th>Status</th>
						<th>Tax</th>
						<th>shipping</th>
						<th>Date</th>
						<th>Generate</th>
					</tr>
					</thead>

					<%
						for(Purchase compra:Purchase.findByStatus(warehouse.Status.findById(1)))
						{
					%>
					<tr class="info">
						<td><span><%=compra.cart.owner.username %></span>  </td>
						<td><span><%=compra.ncf%></span>  </td>
						<td><span><%=compra.nombre%></span>  </td>
						<td><span><%=compra.purchase_amount%></span>  </td>
						<td><span><%=compra.factura%></span>  </td>
						<td><span><%=compra.status.name%></span>  </td>
						<td><span><%=compra.tax%></span>  </td>
						<td><span><%=compra.shipping%></span>  </td>
						<td><span><%=compra.date.toGMTString()%></span>  </td>
						<td>
							<form class="form-horizontal" action="http://localhost:8080/warehouse/area/changePurchaseStatus" action="GET">
								<div class="form-group">
									<g:select name="status_id" id="status_id" class="form-control" from="${Status.findAll()}"/>
								</div>
								<input type="hidden" value="<%= compra.id %>" name="purchase_id" id="purchase_id">
							</form>

						</td>
					</tr>
					<%
						}%>

				</tbody>
				</table>
			</div>
		</div>

	</content>
</g:applyLayout>