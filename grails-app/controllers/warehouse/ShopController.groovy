package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ShopController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Shop.list(params), model: [shopInstanceCount: Shop.count()]
    }

    def show(Shop shopInstance) {
        respond shopInstance
    }

    def create() {
        respond new Shop(params)
    }

    @Transactional
    def save(Shop shopInstance) {
        if (shopInstance == null) {
            notFound()
            return
        }

        if (shopInstance.hasErrors()) {
            respond shopInstance.errors, view: 'create'
            return
        }

        shopInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shop.label', default: 'Shop'), shopInstance.id])
                redirect shopInstance
            }
            '*' { respond shopInstance, [status: CREATED] }
        }
    }

    def edit(Shop shopInstance) {
        respond shopInstance
    }

    @Transactional
    def update(Shop shopInstance) {
        if (shopInstance == null) {
            notFound()
            return
        }

        if (shopInstance.hasErrors()) {
            respond shopInstance.errors, view: 'edit'
            return
        }

        shopInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Shop.label', default: 'Shop'), shopInstance.id])
                redirect shopInstance
            }
            '*' { respond shopInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Shop shopInstance) {

        if (shopInstance == null) {
            notFound()
            return
        }

        shopInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Shop.label', default: 'Shop'), shopInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shop.label', default: 'Shop'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
