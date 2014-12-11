package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CartController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def auth_name = BusinessLogicService.authenticated().getName();
        def user = User.findByUsername(auth_name);
        def cart = Cart.findByOwner(user);
        def cartItems = Cart_Items.findAllByCart(cart);
        def sub_total = 0;
        def grand_total = 0;
        for(item in cartItems){
            sub_total += item.item.sub_total();
            grand_total += item.item.grand_total();
        }
        respond cart, model: [cartItems: cartItems, grand_total: grand_total, sub_total: sub_total]
    }


    @Transactional
    def save(Cart cartInstance) {
        if (cartInstance == null) {
            notFound()
            return
        }

        if (cartInstance.hasErrors()) {
            respond cartInstance.errors, view: 'create'
            return
        }

        cartInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cart.label', default: 'Cart'), cartInstance.id])
                redirect cartInstance
            }
            '*' { respond cartInstance, [status: CREATED] }
        }
    }

    def edit(Cart cartInstance) {
        respond cartInstance
    }

    @Transactional
    def update(Cart cartInstance) {
        if (cartInstance == null) {
            notFound()
            return
        }

        if (cartInstance.hasErrors()) {
            respond cartInstance.errors, view: 'edit'
            return
        }

        cartInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cart.label', default: 'Cart'), cartInstance.id])
                redirect cartInstance
            }
            '*' { respond cartInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cart cartInstance) {

        if (cartInstance == null) {
            notFound()
            return
        }

        cartInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cart.label', default: 'Cart'), cartInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cart.label', default: 'Cart'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
