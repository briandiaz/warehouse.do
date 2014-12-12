package warehouse

class Status {

    String name
    Integer value

    static constraints = {
        name blank:false, unique:true
        value blank:false
    }

    @Override
    def String toString(){
        return name
    }
}
