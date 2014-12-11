import warehouse.Cart
import warehouse.Consumer_Type
import warehouse.Country
import warehouse.Person
import warehouse.Role
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

        def personAdmin = new Person(first_name: "Brian Enmanuel", last_name: "Díaz Peña", phone: "809-576-0856", mobile: "829-616-2714", consumerType: consumerTypeConsumer, country: country, city: "Santiago de los Caballeros", address1: "La Zurza 2, Calle 8, Casa 38", user: admin).save(failOnError: true);

        def cart = new Cart(owner: admin).save()

        UserRole.create(admin, roleAdmin, true);

    }
    def destroy = {
    }
}
