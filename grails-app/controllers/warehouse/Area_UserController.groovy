package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Area_UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Area_User.list(params), model: [area_UserInstanceCount: Area_User.count()]
    }

    def show(Area_User area_UserInstance) {
        respond area_UserInstance
    }

    def create() {
        respond new Area_User(params)
    }

    @Transactional
    def save(Area_User area_UserInstance) {
        if (area_UserInstance == null) {
            notFound()
            return
        }

        if (area_UserInstance.hasErrors()) {
            respond area_UserInstance.errors, view: 'create'
            return
        }

        area_UserInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'area_User.label', default: 'Area_User'), area_UserInstance.id])
                redirect area_UserInstance
            }
            '*' { respond area_UserInstance, [status: CREATED] }
        }
    }

    def edit(Area_User area_UserInstance) {
        respond area_UserInstance
    }

    @Transactional
    def update(Area_User area_UserInstance) {
        if (area_UserInstance == null) {
            notFound()
            return
        }

        if (area_UserInstance.hasErrors()) {
            respond area_UserInstance.errors, view: 'edit'
            return
        }

        area_UserInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Area_User.label', default: 'Area_User'), area_UserInstance.id])
                redirect area_UserInstance
            }
            '*' { respond area_UserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Area_User area_UserInstance) {

        if (area_UserInstance == null) {
            notFound()
            return
        }

        area_UserInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Area_User.label', default: 'Area_User'), area_UserInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'area_User.label', default: 'Area_User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
