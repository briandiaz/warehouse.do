package warehouse

class Person {

    String first_name
    String last_name
    String phone
    String mobile
    Consumer_Type consumerType
    User user
    String company
    Country country
    String city
    String address1
    String address2

    static constraints = {
        first_name blank:false
        last_name blank: false
        phone nullable: false
        mobile nullable: true
        consumerType blank:false, nullable: false
        user nullable: true
        company nullable: true
        country nullable: false
        city nullable: false
        address1 blank:false
        address2 nullable: true

    }
}
