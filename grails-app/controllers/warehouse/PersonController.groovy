package warehouse


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def mailService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model: [personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
        respond new Person(params)
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'create'
            return
        }
        def user = new User(username: params.username, email: params.email, password: params.password).save(failOnError: true)
        personInstance.user = user
        personInstance.save flush: true
        def roleClient = Role.findByName("Cliente");
        UserRole.create(user, roleClient, true);
        mailService.sendMail {
            to user.email
            subject "Welcome to WareHouse.Do"
            html "<i>Dear "+personInstance+"</i>\n" +
                    "<br/>\n" +
                    "Welcome to <a href=\"http://localhost:8080/warehouse/\">WareHouse.DO</a>\n" +
                    "<br/>\n" +
                    "To sign in at the <a href=\"http://localhost:8080/warehouse/person/create\">site</a> this are your credentials:\n" +
                    "<br/>\n" +
                    "<br/>\n" +
                    "<b>username:</b> " + user.username +
                    "<b>password:</b> " + user.password +
                    "<br/><br/><br/>\n" +
                    "Thanks."
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }

    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'edit'
            return
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
