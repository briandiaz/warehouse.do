import warehouse.Cart
import warehouse.Consumer_Type
import warehouse.Country
import warehouse.Department
import warehouse.NCF_Type
import warehouse.Person
import warehouse.Role
import warehouse.Status
import warehouse.User
import warehouse.UserRole

class BootStrap {

    def init = { servletContext ->
        def roleAdmin = new Role(authority: "ROLE_ADMIN", name: "Administrador").save(failOnError: true);
        def roleCliente = new Role(authority: "ROLE_CLIENTE", name: "Cliente").save(failOnError: true);
        def roleUsuario = new Role(authority: "ROLE_USUARIO", name: "Usuario Generico").save(failOnError: true);

        def consumerTypeConsumer = new Consumer_Type(name: "Consumidor Final", value: 1).save();

        def consumerTypeEnterprise = new Consumer_Type(name: "Empresa", value: 2).save(failOnError: true);

        def consumerTypePerson = new Consumer_Type(name: "Persona Física", value: 3).save(failOnError: true);

        Country country = new Country(name: "República Dominicana").save(failOnError: true);

        def admin=new User(username: "admin", password: "admin", email:"brian@briandiaz.me").save(failOnError: true);
        def user =new User(username: "brian", password: "12345", email:"briandiaz@outlook.com").save(failOnError: true);

        def personAdmin = new Person(first_name: "Administrador", last_name: "Root", phone: "111-000-1010", mobile: "000-111-0101", consumerType: consumerTypeConsumer, country: country, city: "Root", address1: "Root", user: admin).save(failOnError: true);
        def personUser = new Person(first_name: "Brian Enmanuel", last_name: "Díaz Peña", phone: "809-576-0856", mobile: "829-616-2714", consumerType: consumerTypePerson, country: country, city: "Santiago de los Caballeros", address1: "La Zurza 2, Calle 8, Casa 38", user: user).save(failOnError: true);

        def cart = new Cart(owner: admin).save(failOnError: true);
        cart = new Cart(owner: user).save(failOnError: true);

        def department = new Department(name: "Smartphones", icon: "fa-mobile", description: "iPhone, Samsung, Nokia, Alcatel, etc..").save(failOnError: true);
        department = new Department(name: "Computadoras", icon: "fa-desktop", description: "Hasta un 50% de descuento!").save(failOnError: true);
        department = new Department(name: "Deportes", icon: "fa-soccer-ball-o", description: "Artículos para deportes").save(failOnError: true);
        department = new Department(name: "TV & Audio", icon: "fa-headphones", description: "Hasta un 25% de descuento en TV's").save(failOnError: true);
        department = new Department(name: "Video", icon: "fa-gamepad", description: "Nuevas consolas, juegos y películas").save(failOnError: true);
        department = new Department(name: "Repuestos", icon: "fa-desktop", description: "Repuestos para autos americanos y europeos").save(failOnError: true);
        department = new Department(name: "Libros", icon: "fa-book", description: "Desde Don Quijote hasta George R.R. Martin").save(failOnError: true);

        def status = new Status(name:"Ordenada", value: 1).save(failOnError: true);
        status = new Status(name:"Despachada", value: 2).save(failOnError: true);
        status = new Status(name:"Entregada", value: 3).save(failOnError: true);

        def ncf = new NCF_Type(name: "Con Comprobante Fiscal").save(failOnError: true);
        ncf = new NCF_Type(name: "Sin Comprobante Fiscal").save(failOnError: true);

        UserRole.create(admin, roleAdmin, true);
        UserRole.create(user, roleUsuario, true);

    }
    def destroy = {
    }
}
