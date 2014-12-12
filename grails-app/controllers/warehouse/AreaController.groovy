package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def mailService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Area.list(params), model: [areaInstanceCount: Area.count()]
    }

    def show(Area areaInstance) {
        respond areaInstance, model: [items: BusinessLogicService.getProductsToBeShipped()]
    }

    def create() {
        respond new Area(params)
    }

    def changePurchaseStatus(){
        Purchase purchase = Purchase.findById(params.purchase_id);
        Status status = Status.findById(params.status_id);
        User user = purchase.cart.owner;
        def items = []

        purchase.status= status;
        purchase.save flush: true;

        mailService.sendMail {
            from "giareloaded07@gmail.com"
            to user.email
            subject "Thanks for buying at WareHouse.Do"
            html "<i>Your order is completed.</i>\n" +
                    "<br/>\n" +
                    "<a href=\"http://localhost:8080/warehouse/\">WareHouse.DO</a>\n" +
                    "<br/>\n"
            "Your items are :<br/>"+ purchase.items +
                    "<br/>\n" +
                    "Your invoice is <a href='http://localhost:8080/warehouse/payment/show/"+purchase.id+"'>"+purchase.factura+"</a>\n" +
                    "Thanks."
        }
    }

    @Transactional
    def save(Area areaInstance) {
        if (areaInstance == null) {
            notFound()
            return
        }

        if (areaInstance.hasErrors()) {
            respond areaInstance.errors, view: 'create'
            return
        }

        areaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'area.label', default: 'Area'), areaInstance.id])
                redirect areaInstance
            }
            '*' { respond areaInstance, [status: CREATED] }
        }
    }

    def edit(Area areaInstance) {
        respond areaInstance
    }

    @Transactional
    def update(Area areaInstance) {
        if (areaInstance == null) {
            notFound()
            return
        }

        if (areaInstance.hasErrors()) {
            respond areaInstance.errors, view: 'edit'
            return
        }

        areaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Area.label', default: 'Area'), areaInstance.id])
                redirect areaInstance
            }
            '*' { respond areaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Area areaInstance) {

        if (areaInstance == null) {
            notFound()
            return
        }

        areaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Area.label', default: 'Area'), areaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
