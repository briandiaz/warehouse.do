package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PaymentController {
    def mailService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Payment.list(params), model: [paymentInstanceCount: Payment.count()]
    }

    def show(Payment paymentInstance) {
        respond paymentInstance
    }

    def create() {
        respond new Payment(params)
    }

    def processPayment(){
        Purchase compra=new Purchase();
        User user = BusinessLogicService.session();
        compra.factura=params.invoice;
        compra.transaccion=params.txn_id;
        compra.nombre=params.item_name;
        compra.estatusPago=params.payment_status;

        compra.payment_gross=new BigDecimal(params.payment_gross.toString());
        compra.tax=new BigDecimal(params.tax.toString());
        compra.handling_amount=new BigDecimal(params.handling_amount.toString());
        compra.payment_fee=new BigDecimal(params.payment_fee.toString());
        compra.shipping=new BigDecimal(params.shipping.toString());

        compra.payer_id=params.payer_id;
        compra.payer_email=params.payer_email;

        compra.date=new Date();
        compra.business=params.business;

        compra.address_city=params.address_city;
        compra.address_zip=params.address_zip;
        compra.address_state=params.address_state;
        compra.address_name=params.address_name;
        compra.status = Status.findByValue(1);// Estatus Compra Ordenada
        compra.ncf = new Date().toString() + params.invoice;
        compra.ncf_type = NCF_Type.findById(params.ncf_type);
        compra.save(failOnError: true);
        Cart cart = Cart.findByOwner(user);
        compra.cart = cart;
        def cartItems = Cart_Items.findAllByCart(cart);
        def items_email= "";
        for(item in cartItems){
            compra.items.add(item.item);
            items_email += "Item: <b>"+item.item.name + "</b> Quantity: "+item.quantity + "<br/>";
            item.delete();
        }
        Payment payment = new Payment();
        payment.purchase = compra;

        payment.save(failOnError: true);

        mailService.sendMail {
            from "giareloaded07@gmail.com"
            to BusinessLogicService.getEmailUsersOfArea("Warehouse")
            subject "Item to be shipped from WareHouse.Do"
            html "<i>Some items have been requested from the warehouse area.</i>\n" +
                    "<br/>\n" +
                    "<a href=\"http://localhost:8080/warehouse/\">WareHouse.DO</a>\n" +
                    "<br/>\n"
            "These are the items:<br/>"+ items_email +
                    "<br/>\n" +
                    "Thanks."
        }
        redirect(action: show(payment));
    }

    def cancelledPayment(){
        redirect(controller: CartController, action: index(1));
    }

    @Transactional
    def save(Payment paymentInstance) {
        if (paymentInstance == null) {
            notFound()
            return
        }

        if (paymentInstance.hasErrors()) {
            respond paymentInstance.errors, view: 'create'
            return
        }

        paymentInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])
                redirect paymentInstance
            }
            '*' { respond paymentInstance, [status: CREATED] }
        }
    }

    def edit(Payment paymentInstance) {
        respond paymentInstance
    }

    @Transactional
    def update(Payment paymentInstance) {
        if (paymentInstance == null) {
            notFound()
            return
        }

        if (paymentInstance.hasErrors()) {
            respond paymentInstance.errors, view: 'edit'
            return
        }

        paymentInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Payment.label', default: 'Payment'), paymentInstance.id])
                redirect paymentInstance
            }
            '*' { respond paymentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Payment paymentInstance) {

        if (paymentInstance == null) {
            notFound()
            return
        }

        paymentInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Payment.label', default: 'Payment'), paymentInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
