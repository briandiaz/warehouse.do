package warehouse

class Image {

    byte[] photo
    String photoType

    static constraints = {
        photo nullable:true, maxSize: 160384 /* 16K */
        photoType nullable:true
    }
}
