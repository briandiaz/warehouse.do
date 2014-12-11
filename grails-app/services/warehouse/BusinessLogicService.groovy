package warehouse

import grails.transaction.Transactional
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

@Transactional
class BusinessLogicService {

    def serviceMethod() {


    }
    def static authenticated(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth;
    }
}
