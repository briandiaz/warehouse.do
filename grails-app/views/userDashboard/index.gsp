
<%@ page import="warehouse.BusinessLogicService; warehouse.Purchase; warehouse.NCF_Type; warehouse.Cart" %>
<g:set var="entityName" value="${message(code: 'cart.label', default: 'Carrito de Compras')}" />
<g:applyLayout name="main">

    <content tag="content">
        <div class="row inner-bottom-sm">
            <div class="shopping-cart">
                <div class="col-md-12 col-sm-12 shopping-cart-table ">
                    <div class="table-responsive">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="glyphicons clock">Compras realizadas</h4>

                                <div class="row">
                                    <div class="">

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
                                                Cart cart = Cart.findByOwner(BusinessLogicService.session())
                                            List<Purchase> compras = Purchase.findAllByCart(cart);
                                                for(Purchase compra:compras)
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
                                                <td><a>Print Documment</a>  </td>
                                            </tr>
                                            <%
                                                }%>

                                        </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.shopping-cart-table -->



            </div> <!-- /.row -->
    </content>
</g:applyLayout>