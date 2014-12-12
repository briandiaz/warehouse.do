package warehouse

class Item {

    String name
    String description
    Float price
    Integer reorder
    Department department
    User publisher

    byte[] photo1
    String photo1Type
    byte[] photo2
    String photo2Type
    byte[] photo3
    String photo3Type
    byte[] photo4
    String photo4Type
    byte[] photo5
    String photo5Type


    static constraints = {
        name blank:false
        description blank:false
        price blank:false
        reorder blank:false
        department nullable:false
        publisher nullable:true
        photo1 nullable:true, maxSize:1024000
        photo2 nullable:true, maxSize:1024000
        photo3 nullable:true, maxSize:1024000
        photo4 nullable:true, maxSize:1024000
        photo5 nullable:true, maxSize:1024000
        photo1Type nullable:true
        photo2Type nullable:true
        photo3Type nullable:true
        photo4Type nullable:true
        photo5Type nullable:true
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
