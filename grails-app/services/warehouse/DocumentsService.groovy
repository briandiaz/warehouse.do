package warehouse

import grails.transaction.Transactional
import groovy.sql.Sql
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.util.JRLoader

@Transactional
class DocumentsService {

    public JasperPrint getreporteEnvio(String factura){

        //Obteniendo la conexion.
        Sql con = BaseDatosServices.instancia.conexion;

        //Parametros.
        HashMap<String, Object> parametros=new HashMap<>();
        parametros.put("factura", factura)

        //Cargando el reporte desde el Jar del proyecto. Reporte compilado.
        JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResource("/groovy/reportes/reporteEnvio.jasper"));

        //Mandando a ejecutar el proyecto.
        JasperPrint print = JasperFillManager.fillReport(reporte, parametros ,con.connection);

        return print;

    }
    public JasperPrint getreporteFactura(String factura){

        //Obteniendo la conexion.
        Sql con = BaseDatosServices.instancia.conexion;

        //Parametros.
        HashMap<String, Object> parametros=new HashMap<>();
        parametros.put("factura", factura)

        //Cargando el reporte desde el Jar del proyecto. Reporte compilado.
        JasperReport reporte = (JasperReport) JRLoader.loadObject(this.getClass().getResource("/groovy/reportes/Factura.jasper"));

        //Mandando a ejecutar el proyecto.
        JasperPrint print = JasperFillManager.fillReport(reporte, parametros ,con.connection);

        return print;

    }


}
