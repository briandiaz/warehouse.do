package warehouse

import grails.plugin.springsecurity.SpringSecurityUtils

import javax.servlet.http.HttpServletResponse

class UserController {

    def index() {}

    def logout(){
        if (!request.post && SpringSecurityUtils.getSecurityConfig().logout.postOnly) {
            response.sendError HttpServletResponse.SC_METHOD_NOT_ALLOWED // 405
            return
        }
        redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'

    }
}
