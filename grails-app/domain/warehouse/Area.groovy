package warehouse

class Area {

    String name

    static constraints = {
        name blank:false
    }

    @Override
    def String toString(){
        name
    }
}
