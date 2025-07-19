package net.offersmanagement.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.offersmanagement.dao.Offer;

public class OfferDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/demo3?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Sahan*$7*";

    private static final String INSERT_OFFERS_SQL = "INSERT INTO offers (name, email, type, `range`, code) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_OFFER_BY_ID_SQL = "SELECT id, name, email, type, `range`, code FROM offers WHERE id = ?";
    private static final String SELECT_ALL_OFFERS_SQL = "SELECT id, name, email, type, `range`, code FROM offers";
    private static final String DELETE_OFFER_SQL = "DELETE FROM offers WHERE id = ?";
    private static final String UPDATE_OFFER_SQL = "UPDATE offers SET name = ?, email = ?, type = ?, `range` = ?, code = ? WHERE id = ?";

    public OfferDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new IllegalStateException("Failed to load MySQL JDBC driver.");
        }
    }

    public void insertOffer(Offer offer) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_OFFERS_SQL)) {
            preparedStatement.setString(1, offer.getName());
            preparedStatement.setString(2, offer.getEmail());
            preparedStatement.setString(3, offer.getType());
            preparedStatement.setString(4, offer.getRange());
            preparedStatement.setString(5, offer.getCode());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Offer selectOffer(int id) {
        Offer offer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_OFFER_BY_ID_SQL)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    offer = extractOfferFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return offer;
    }

    public List<Offer> selectAllOffer() {
        List<Offer> offers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_OFFERS_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                offers.add(extractOfferFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return offers;
    }

    public boolean deleteOffer(int id) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_OFFER_SQL)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
            return false;
        }
    }

    public boolean updateOffer(Offer offer) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_OFFER_SQL)) {
            statement.setString(1, offer.getName());
            statement.setString(2, offer.getEmail());
            statement.setString(3, offer.getType());
            statement.setString(4, offer.getRange());
            statement.setString(5, offer.getCode());
            statement.setInt(6, offer.getId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
            return false;
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    private Offer extractOfferFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String name = resultSet.getString("name");
        String email = resultSet.getString("email");
        String type = resultSet.getString("type");
        String range = resultSet.getString("range");
        String code = resultSet.getString("code");
        return new Offer(id, name, email, type, range, code);
    }

    private void printSQLException(SQLException ex) {
        ex.printStackTrace();
        System.err.println("SQLState: " + ex.getSQLState());
        System.err.println("Error Code: " + ex.getErrorCode());
        System.err.println("Message: " + ex.getMessage());
        Throwable t = ex.getCause();
        while (t != null) {
            System.out.println("Cause: " + t);
            t = t.getCause();
        }
    }
}
