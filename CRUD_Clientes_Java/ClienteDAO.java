import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    private Connection connection;
    
    public ClienteDAO(Connection connection) {
        this.connection = connection;
    }
    
    public void insertarCliente(Cliente cliente) throws SQLException {
        String sql = "INSERT INTO Clientes (cedula, nombre, direccion, telefono) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cliente.getCedula());
            statement.setString(2, cliente.getNombre());
            statement.setString(3, cliente.getDireccion());
            statement.setString(4, cliente.getTelefono());
            statement.executeUpdate();
        }
    }
    
    public void actualizarCliente(Cliente cliente) throws SQLException {
        String sql = "UPDATE Clientes SET nombre = ?, direccion = ?, telefono = ? WHERE cedula = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cliente.getNombre());
            statement.setString(2, cliente.getDireccion());
            statement.setString(3, cliente.getTelefono());
            statement.setString(4, cliente.getCedula());
            statement.executeUpdate();
        }
    }
    
    public void eliminarCliente(String cedula) throws SQLException {
        String sql = "DELETE FROM Clientes WHERE cedula = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cedula);
            statement.executeUpdate();
        }
    }
    
    public List<Cliente> obtenerClientes() throws SQLException {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT cedula, nombre, direccion, telefono FROM Clientes";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Cliente cliente = new Cliente();
                cliente.setCedula(resultSet.getString("cedula"));
                cliente.setNombre(resultSet.getString("nombre"));
                cliente.setDireccion(resultSet.getString("direccion"));
                cliente.setTelefono(resultSet.getString("telefono"));
                clientes.add(cliente);
            }
        }
        return clientes;
    }
}