package warehouse

import groovy.sql.Sql
import org.h2.tools.Server


class BaseDatosServices {

    private  Server server
    private static BaseDatosServices baseDatosServices;

    private BaseDatosServices(){

            inicializarH2();
           // bootStrap();

    }


    public static BaseDatosServices getInstancia(){
       if(!baseDatosServices){
          baseDatosServices=new BaseDatosServices();
       }

        return baseDatosServices;
    }

    /**
     *
     */
    private void inicializarH2(){
        println("Inicializando el H2")
        server = Server.createTcpServer("-tcpAllowOthers", "-tcpDaemon");
        server.start();
        println("Servidor H2 Modo Server Disponible: "+server.isRunning(true));
        println("Estatus del servidor: "+server.status)
    }

    /**
     *
     * @return
     */
    public Sql getConexion(){
        Sql con=Sql.newInstance("jdbc:h2:mem:devDb;MODE=MYSQL;MVCC=TRUE", "sa", "", "org.h2.Driver");

    }

    /**
     *
     */
    private void bootStrap(){
        println("Creando tabla estudiantes.");

        //Creando tabla estudiantes
        String sql="""

           DROP TABLE IF EXISTS estudiantes;

           CREATE or REPLACE TABLE estudiantes (
    MATRICULA	varchar(10) NOT NULL,
    NOMBRE   	varchar(45) NOT NULL,
    APELLIDO 	varchar(45) NOT NULL,
    PRIMARY KEY(MATRICULA)
)
        """;


        Sql con = getConexion();
        con.execute(sql);

        //Insertando los estudiantes.
        (1..100).each {
            sql = "insert into estudiantes values('$it','Nombre $it','Apellido $it');"
            //println("$it:" +sql)
            con.executeInsert(sql);
        }

        con.commit();

        con.eachRow("select count(*) cantidad from estudiantes"){
            println("La cantidad de estudiantes: "+it.cantidad)
        }

        con.close();

    }
}
