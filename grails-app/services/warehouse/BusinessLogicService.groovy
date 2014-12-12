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
}
