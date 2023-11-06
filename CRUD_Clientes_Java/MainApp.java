import java.sql.*;
import java.util.List;
import java.util.Scanner;

public class MainApp {
    private static final String URL = "jdbc:postgresql://localhost:5432/nombre_basedatos";
    private static final String USER = "usuario";
    private static final String PASSWORD = "contraseña";
    
    private Connection connection;
    private ClienteDAO clienteDAO;
    
    public MainApp() {
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            clienteDAO = new ClienteDAO(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void ejecutar() {
        Scanner scanner = new Scanner(System.in);
        int opcion = 0;
        
        do {
            System.out.println("----- CRUD de Clientes -----");
            System.out.println("1. Agregar cliente");
            System.out.println("2. Actualizar cliente");
            System.out.println("3. Eliminar cliente");
            System.out.println("4. Obtener lista de clientes");
            System.out.println("5. Salir");
            System.out.print("Ingrese una opción: ");
            
            opcion = scanner.nextInt();
            scanner.nextLine(); // Limpiar el buffer
            
            switch (opcion) {
                case 1:
                    agregarCliente(scanner);
                    break;
                case 2:
                    actualizarCliente(scanner);
                    break;
                case 3:
                    eliminarCliente(scanner);
                    break;
                case 4:
                    obtenerClientes();
                    break;
                case 5:
                    System.out.println("¡Hasta luego!");
                    break;
                default:
                    System.out.println("Opción inválida");
            }
            
            System.out.println();
        } while (opcion != 5);
        
        scanner.close();
        cerrarConexion();
    }
    
    private void agregarCliente(Scanner scanner) {
        System.out.println("Ingrese los datos del cliente:");
        System.out.print("Cédula: ");
        String cedula = scanner.nextLine();
        System.out.print("Nombre: ");
        String nombre = scanner.nextLine();
        System.out.print("Dirección: ");
        String direccion = scanner.nextLine();
        System.out.print("Teléfono: ");
        String telefono = scanner.nextLine();
        
        Cliente cliente = new Cliente();
        cliente.setCedula(cedula);
        cliente.setNombre(nombre);
        cliente.setDireccion(direccion);
        cliente.setTelefono(telefono);
        
        try {
            clienteDAO.insertarCliente(cliente);
            System.out.println("Cliente agregado exitosamente");
        } catch (SQLException e) {
            System.out.println("Error al agregar el cliente: " + e.getMessage());
        }
    }
    
    private void actualizarCliente(Scanner scanner) {
        System.out.print("Ingrese la cédula del cliente a actualizar: ");
        String cedula = scanner.nextLine();
        
        try {
            Cliente clienteExistente = buscarClientePorCedula(cedula);
            
            if (clienteExistente != null) {
                System.out.println("Ingrese los nuevos datos del cliente:");
                System.out.print("Nombre: ");
                String nombre = scanner.nextLine();
                System.out.print("Dirección: ");
                String direccion = scanner.nextLine();
                System.out.print("Teléfono: ");
                String telefono = scanner.nextLine();
                
                Cliente clienteActualizado = new Cliente();
                clienteActualizado.setCedula(cedula);
                clienteActualizado.setNombre(nombre);
                clienteActualizado.setDireccion(direccion);
                clienteActualizado.setTelefono(telefono);
                
                clienteDAO.actualizarCliente(clienteActualizado);
                System.out.println("Cliente actualizado exitosamente");
            } else {
                System.out.println("Cliente no encontrado");
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar el cliente: " + e.getMessage());
        }
    }
    
    private void eliminarCliente(Scanner scanner) {
        System.out.print("Ingrese la cédula del cliente a eliminar: ");
        String cedula = scanner.nextLine();
        
        try {
            Cliente clienteExistente = buscarClientePorCedula(cedula);
            
            if (clienteExistente != null) {
                clienteDAO.eliminarCliente(cedula);
                System.out.println("Cliente eliminado exitosamente");
            } else {
                System.out.println("Cliente no encontrado");
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar el cliente: " + e.getMessage());
        }
    }
}    