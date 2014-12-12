<g:applyLayout name="main">

    <content tag="content">

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

                    <tr class="info">
                        <td><span><%=payment.purchase.cart.owner.username %></span>  </td>
                        <td><span><%=payment.purchase.ncf%></span>  </td>
                        <td><span><%=payment.purchase.nombre%></span>  </td>
                        <td><span><%=payment.purchase.purchase_amount%></span>  </td>
                        <td><span><%=payment.purchase.factura%></span>  </td>
                        <td><span><%=payment.purchase.status.name%></span>  </td>
                        <td><span><%=payment.purchase.tax%></span>  </td>
                        <td><span><%=payment.purchase.shipping%></span>  </td>
                        <td><span><%=payment.purchase.date.toGMTString()%></span>  </td>
                        <td><a href="http://localhost:8080/warehouse/payment/generatepdf?factura=<%= payment.purchase.factura %>" class="btn btn-danger btn-md"><i class="fa fa-file-pdf-o"></i> Generate PDF</a></td>
                    </tr>

                </tbody>
                </table>

            </div>

        </div>
    </content>
</g:applyLayout>