package warehouse

class Item {

    String name
    String description
    Float price
    Integer reorder
    Department department
    User publisher

    static constraints = {
        name blank:false
        description blank:false
        price blank:false
        reorder blank:false
        department nullable:false
        publisher nullable:false
    }
}
