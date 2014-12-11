package warehouse

class Purchase {

    User user
    String ncf
    NCF_Type ncf_type
    Status status

    BigDecimal purchase_amount

    String nombre;
    String factura;
    String transaccion;
    String estatusPago


    BigDecimal payment_gross;
    BigDecimal tax;
    BigDecimal handling_amount;
    BigDecimal payment_fee;
    BigDecimal shipping;

    String payer_id;
    String payer_email;
    Date date;
    String business;

    String address_name;
    String address_state;
    String address_city;
    String address_zip;

    static constraints = {
    }
}
