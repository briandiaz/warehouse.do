package warehouse

class Country {

    String name

    static constraints = {
        name blank:false, unique: true
    }
}
