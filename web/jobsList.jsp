<%-- 
    Document   : jobsList
    Created on : Jun 13, 2021, 4:13:17 PM
    Author     : ASUSVIVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cleaning Service Management System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#">Cleaning Service Management System</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listteam">Staffs</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="listjob">Jobs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listtools">Tools</a>
                        </li>
                    </ul>
                </div>
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link btn btn-dark" href="logout">Logout</a>
                    </li>
                </ul>
            </nav>
        </header>
        <br>
        <h3 align="center">List of Jobs</h3>
        <hr>
        <br>
        <div style="margin-right: 10%; margin-left: 10%;">
            <a href="newJob" class="btn btn-success">Add New Job</a>
            <br>
            <br>
            <table class="table table-bordered table-striped">
                <thead class="">
                    <tr class="table-primary">
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Customer Phone No.</th>
                        <th>Customer Address</th>
                        <th>Building Type</th>
                        <th>Date of Job</th>
                        <th>Additional Notes/Requests</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!--   for (Todo todo: todos) {  -->
                    <c:forEach var="job" items="${listJobs}">
                        <tr>
                            <td>
                                <c:out value="${job.id}" />
                            </td>

                            <td>
                                <c:out value="${job.customerName}" />
                            </td>
                            <td>
                                <c:out value="${job.customerHpNo}" />
                            </td>
                            <td>
                                <c:out value="${job.address}" />
                            </td>
                            <td>
                                <c:out value="${job.buildingType}" />
                            </td>
                            <td>
                                <c:out value="${job.date}" />
                            </td>
                            <td>
                                <c:out value="${job.addNote}" />
                            </td>
                            <td><a href="editjob?id=<c:out value='${job.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="deletejob?id=<c:out value='${job.id}' />">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="listtoolsbyid?id=<c:out value='${job.id}' />">Manage Tools</a></td>
                        </tr>
                    </c:forEach>
                    <!-- } -->
                </tbody>
            </table>
        </div>
    </body>
</html>
