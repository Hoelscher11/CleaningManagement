/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.Model.Job;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUSVIVO
 */
public class JobDAO {
    
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/cleaning_management";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String ADD_NEW_JOB = "insert into jobs(customername, customerhpno,"
            + " address, buildingtype, date, addnotes) values(?, ?, ?, ?, ?, ?)";
    private static final String SELECT_JOBS_BY_ID = "select id,customername,customerhpno,address,buildingtype,"
            + " date, addnotes from jobs where id=?";
    private static final String SELECT_JOBS_ID = "select id from jobs";
    private static final String SELECT_ALL_JOBS = "select * from jobs";
    private static final String DELETE_JOBS = "delete from jobs where id=?";
    private static final String UPDATE_JOB = "update jobs set customername =?, customerhpno=?, address =?,"
            + " buildingtype =?, date=?, addnotes=? where id=?";
    private static final String SELECT_JOB = "select * from jobs where id=?";
    
    public JobDAO(){}
    
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
    
    public List <Integer> listJobID() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Integer > jobIDs = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_JOBS_ID);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                jobIDs.add(id);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return jobIDs;
    }
    
    public void addNewJobs (Job job) throws SQLException{
        System.out.println(ADD_NEW_JOB);
        
        try(Connection connection = getConnection(); 
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_JOB)){
            preparedStatement.setString(1, job.getCustomerName());
            preparedStatement.setString(2, job.getCustomerHpNo());
            preparedStatement.setString(3, job.getAddress());
            preparedStatement.setString(4, job.getBuildingType());
            preparedStatement.setString(5, job.getDate());
            preparedStatement.setString(6, job.getAddNote());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            printSQLException(e);
        }
    }
    
    public List < Job > selectAllJobs() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Job > jobs = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_JOBS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String customerName = rs.getString("customername");
                String customerHpNo = rs.getString("customerhpno");
                String address  = rs.getString("address");
                String buildingType = rs.getString("buildingtype");
                String date = rs.getString("date");
                String addNote = rs.getString("addnotes");
                jobs.add(new Job(id, customerName, customerHpNo, address, buildingType, date, addNote));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return jobs;
    }
    
    public Job selectJob(int id){
        Job job = null;
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_JOBS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String customerName = rs.getString("customername");
                String customerHpNo = rs.getString("customerhpno");
                String address  = rs.getString("address");
                String buildingType = rs.getString("buildingtype");
                String date = rs.getString("date");
                String addNote = rs.getString("addnotes");
                job = new Job(id, customerName, customerHpNo, address, buildingType, date, addNote);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return job;
    }
       
       public boolean deleteJob(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_JOBS);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
       
       public boolean updateJob(Job job) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_JOB);) {
            statement.setString(1, job.getCustomerName());
            statement.setString(2, job.getCustomerHpNo());
            statement.setString(3, job.getAddress());
            statement.setString(4, job.getBuildingType());
            statement.setString(5, job.getDate());
            statement.setString(6, job.getAddNote());
            statement.setInt(7, job.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
       
       public List < Job > selectJobByID(int id) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Job > jobs = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_JOB);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                id = rs.getInt("id");
                String customerName = rs.getString("customername");
                String customerHpNo = rs.getString("customerhpno");
                String address  = rs.getString("address");
                String buildingType = rs.getString("buildingtype");
                String date = rs.getString("date");
                String addNote = rs.getString("addnotes");
                jobs.add(new Job(id, customerName, customerHpNo, address, buildingType, date, addNote));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return jobs;
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
