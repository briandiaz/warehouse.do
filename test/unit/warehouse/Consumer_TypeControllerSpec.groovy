package warehouse


import grails.test.mixin.*
import spock.lang.*

@TestFor(Consumer_TypeController)
@Mock(Consumer_Type)
class Consumer_TypeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.consumer_TypeInstanceList
        model.consumer_TypeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.consumer_TypeInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def consumer_Type = new Consumer_Type()
        consumer_Type.validate()
        controller.save(consumer_Type)

        then: "The create view is rendered again with the correct model"
        model.consumer_TypeInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        consumer_Type = new Consumer_Type(params)

        controller.save(consumer_Type)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/consumer_Type/show/1'
        controller.flash.message != null
        Consumer_Type.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def consumer_Type = new Consumer_Type(params)
        controller.show(consumer_Type)

        then: "A model is populated containing the domain instance"
        model.consumer_TypeInstance == consumer_Type
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def consumer_Type = new Consumer_Type(params)
        controller.edit(consumer_Type)

        then: "A model is populated containing the domain instance"
        model.consumer_TypeInstance == consumer_Type
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/consumer_Type/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def consumer_Type = new Consumer_Type()
        consumer_Type.validate()
        controller.update(consumer_Type)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.consumer_TypeInstance == consumer_Type

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        consumer_Type = new Consumer_Type(params).save(flush: true)
        controller.update(consumer_Type)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/consumer_Type/show/$consumer_Type.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/consumer_Type/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def consumer_Type = new Consumer_Type(params).save(flush: true)

        then: "It exists"
        Consumer_Type.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(consumer_Type)

        then: "The instance is deleted"
        Consumer_Type.count() == 0
        response.redirectedUrl == '/consumer_Type/index'
        flash.message != null
    }
}
