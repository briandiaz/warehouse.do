package warehouse

import grails.transaction.Transactional
import org.grails.mandrill.MandrillMessage
import org.grails.mandrill.MandrillRecipient
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

@Transactional
class BusinessLogicService {
    def mandrillService
    def serviceMethod() {


    }
    def static authenticated(){
        return SecurityContextHolder.getContext().getAuthentication();
    }

    def static session(){
        return User.findByUsername(authenticated().getName());
    }

    def static is_authenticated(){
        return (authenticated().getName().toString() != "__grails.anonymous.user__");
    }

    def static getUsersOfArea(String area){
        def warehouse = Area.findByName(area);
        def users = []
        for(area_user in Area_User.findAllByArea(warehouse)){
            users.add(area_user.user);
        }
        return users
    }

    def static getEmailUsersOfArea(String area){
        def users = getUsersOfArea(area);
        def emails = []
        for(user in users){
            emails.add(user.email);
        }
        return emails;
    }

    def static getProductsToBeShipped(){
        return Purchase.findAllByStatus(Status.findByValue(1));
    }

    def sendMailToSingleMailMandrill(name, email, subject, msg){
        def recpts = []
        recpts.add(new MandrillRecipient(name:name, email:email))
        def message = new MandrillMessage(
                text:msg,
                subject:subject,
                from_email:"brian@briandiaz.me",
                to:recpts)
        message.tags.add("test")
        def ret = mandrillService.send(message)
    }

    def sendMailToMultipleMailMandrill(emails, subject, msg){
        def recpts = []
        for(email in emails){
            recpts.add(new MandrillRecipient(name:"Usuario", email:email))
        }
        def message = new MandrillMessage(
                text:msg,
                subject:subject,
                from_email:"brian@briandiaz.me",
                to:recpts)
        message.tags.add("test")
        def ret = mandrillService.send(message)
    }



}
