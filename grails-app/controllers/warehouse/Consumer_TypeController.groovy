package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Consumer_TypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Consumer_Type.list(params), model: [consumer_TypeInstanceCount: Consumer_Type.count()]
    }

    def show(Consumer_Type consumer_TypeInstance) {
        respond consumer_TypeInstance
    }

    def create() {
        respond new Consumer_Type(params)
    }

    @Transactional
    def save(Consumer_Type consumer_TypeInstance) {
        if (consumer_TypeInstance == null) {
            notFound()
            return
        }

        if (consumer_TypeInstance.hasErrors()) {
            respond consumer_TypeInstance.errors, view: 'create'
            return
        }

        consumer_TypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consumer_Type.label', default: 'Consumer_Type'), consumer_TypeInstance.id])
                redirect consumer_TypeInstance
            }
            '*' { respond consumer_TypeInstance, [status: CREATED] }
        }
    }

    def edit(Consumer_Type consumer_TypeInstance) {
        respond consumer_TypeInstance
    }

    @Transactional
    def update(Consumer_Type consumer_TypeInstance) {
        if (consumer_TypeInstance == null) {
            notFound()
            return
        }

        if (consumer_TypeInstance.hasErrors()) {
            respond consumer_TypeInstance.errors, view: 'edit'
            return
        }

        consumer_TypeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Consumer_Type.label', default: 'Consumer_Type'), consumer_TypeInstance.id])
                redirect consumer_TypeInstance
            }
            '*' { respond consumer_TypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Consumer_Type consumer_TypeInstance) {

        if (consumer_TypeInstance == null) {
            notFound()
            return
        }

        consumer_TypeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Consumer_Type.label', default: 'Consumer_Type'), consumer_TypeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consumer_Type.label', default: 'Consumer_Type'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
