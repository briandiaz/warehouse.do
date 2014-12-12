package warehouse

class Area_User {

    Area area
    User user

    static constraints = {
        area nullable :false
        user nullable :false
    }
}
