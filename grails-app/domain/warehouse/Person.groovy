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
        phone nullable: true
        mobile nullable: true
        consumerType blank:false
        user blank:false, unique: true
        company nullable: true
        country nullable: true
        city nullable: true
        address1 blank:false
        address2 nullable: true

    }
}
