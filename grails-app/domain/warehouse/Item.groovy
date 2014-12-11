package warehouse

class Item {

    String name
    String description
    Float price
    Integer reorder
    Department department
    User publisher
    //List<Image> images

    static constraints = {
        name blank:false
        description blank:false
        price blank:false
        reorder blank:false
        department nullable:false
        publisher nullable:false
    }

    def tax(){
        return 0.18
    }

    def sub_total(){
        return price
    }
    def grand_total(){
        return (price + (price * tax()))
    }
}
