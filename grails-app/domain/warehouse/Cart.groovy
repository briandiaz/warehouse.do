package warehouse

class Cart {

    User owner

    static constraints = {
        owner blank:false, unique:true
    }
}
