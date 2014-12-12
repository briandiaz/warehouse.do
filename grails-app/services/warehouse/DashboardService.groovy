package warehouse

import grails.transaction.Transactional

@Transactional
class DashboardService {
/*
* El sistema debe implementar una vista que contengas gráficos
* de las compras realizadas, despachos pendientes y realizados
* del día actual.
* */
    //devuelve las compras realizadas
     public static String getrealizadas(){
        return Purchase.all.size().toString();
    }
    //devuelve las compras pendientes de envio
    public static String getpendientes(){
        Status st = Status.findByValue(2);
        return Purchase.findAllByStatus(st).size().toString();
    }
    //devuelve las compras del dia de hoy
    public static String getdaily(){
        Date hoy = new Date();
        Date ayer = new Date( hoy.getTime()-86400000);
        // todo lo que sea mayor a ayer es de hoy
        return Purchase.findAllByDateGreaterThan(ayer).size().toString();
    }
}
