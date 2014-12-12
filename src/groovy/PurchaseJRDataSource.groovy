package warehouse
import net.sf.jasperreports.engine.JRDataSource
import net.sf.jasperreports.engine.JRException
import net.sf.jasperreports.engine.JRField
import warehouse.Purchase

class PurchaseJRDataSource implements JRDataSource{

    private List<Purchase> listado;
    private int indice=-1;

    public PurchaseJRDataSource(){
        listado=new ArrayList<>();
        (1..50).each {
            listado << new Purchase(factura: "$it", nombre: "Nombre $it",
                    estatusPago: "estatusPago $it",
                    payment_gross: "gross $it",handling_amount: "handling $it",
                    payment_fee: "fee $it",shipping: "shipping $it",
                    address_name: "address $it",address_city: "city $it",
                    address_state: "state $it",address_zip: "zip $it");
        }
    }

    @Override
    boolean next() throws JRException {
        indice++;
        if(indice<listado.size()){
            return true;
        }
        return false;
    }

    @Override
    Object getFieldValue(JRField fila) throws JRException {
        Object tmp = null;
        if(fila.name=="factura"){
            tmp = listado.get(indice).factura
        }else if(fila.name=="nombre"){
            tmp = listado.get(indice).nombre
        }else if(fila.name=="estatusPago"){
            tmp = listado.get(indice).estatusPago
        }else if(fila.name=="payment_gross"){
            tmp = listado.get(indice).payment_gross

        }else if(fila.name=="handling_ammount"){
            tmp = listado.get(indice).handling_amount

        }

        return tmp;
    }
}

