/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Tools;

/**
 *
 * @author NAD
 */
public class ToolsDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/cleaning_management";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_TOOLS_SQL = "insert into tools(tool,quantity,jobID) values " +
            " (?,?,?);";
    
    private static final String SELECT_TOOLS_BY_ID = "select id,tool,quantity,jobID from tools where id=?";
    private static final String SELECT_ALL_TOOLS = "select * from tools";
    private static final String SELECT_TOOLS = "select * from tools where jobID=?";
    private static final String DELETE_TOOLS_SQL = "delete from tools where id=?";
    private static final String DELETE_TOOLS_BY_JOBID_SQL = "delete from tools where jobID=?";
    private static final String UPDATE_TOOLS_SQL = "update tools set tool =?, quantity=?, jobID =? where id=?";
    
    public ToolsDAO(){}
    
    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        }catch(SQLException e){
            e.printStackTrace();
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertTools (Tools tools) throws SQLException{
        System.out.println(INSERT_TOOLS_SQL);
        
        try(Connection connection = getConnection(); 
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TOOLS_SQL)){
            preparedStatement.setString(1, tools.getTool());
            preparedStatement.setInt(2, tools.getQuantity());
            preparedStatement.setInt(3, tools.getJobid());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            printSQLException(e);
        }
    }
    
    public Tools selectTools(int id){
        Tools tool = null;
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TOOLS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String tools = rs.getString("tool");
                int quantity = rs.getInt("quantity");
                int jobid = rs.getInt("jobID");
                tool = new Tools(id, tools, quantity, jobid);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tool;
    }
    public List < Tools > selectAllTools() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Tools > tool = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TOOLS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String tools = rs.getString("tool");
                int quantity = rs.getInt("quantity");
                int jobid = rs.getInt("jobID");
                tool.add(new Tools(id, tools, quantity, jobid));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tool;
    }
    
    public List < Tools > listToolsByID(int id) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Tools > tool = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TOOLS);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                id = rs.getInt("id");
                String tools = rs.getString("tool");
                int quantity = rs.getInt("quantity");
                int jobid = rs.getInt("jobID");
                tool.add(new Tools(id, tools, quantity, jobid));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tool;
    }
    
    
    
    public boolean deleteTools(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_TOOLS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean deleteToolsByJobID(int jobid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_TOOLS_BY_JOBID_SQL);) {
            statement.setInt(1, jobid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
     public boolean updateTools(Tools tool) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_TOOLS_SQL);) {
            statement.setString(1, tool.getTool());
            statement.setInt(2, tool.getQuantity());
            statement.setInt(3, tool.getJobid());
            statement.setInt(4, tool.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
     
     private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }    
}
