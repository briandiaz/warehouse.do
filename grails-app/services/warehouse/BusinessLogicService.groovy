package warehouse

import grails.transaction.Transactional
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder


@Transactional
class BusinessLogicService {

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



}
