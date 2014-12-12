package warehouse

class Department {

    String name
    String description
    String icon

    static constraints = {
    }

    @Override
    def String toString(){
        return name
    }
}
