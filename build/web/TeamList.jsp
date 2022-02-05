<%-- 
    Document   : TeamList
    Created on : Jun 14, 2021, 10:58:58 AM
    Author     : THINKPAD
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ]
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
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Staffs</a>
                        </li>
                        <li class="nav-item">
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

        <div class="row">
            <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

            <div class="container">
                <h3 class="text-center">List of Team Worker</h3>
                <hr>
                <div class="container text-left">

                    <a href="<%=request.getContextPath()%>/newteamform" class="btn btn-success">Add
                        New Worker</a>
                </div>
                <br>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr class="table-success">
                            <th>Staff ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Ic No</th>
                            <th>Address</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>Registration Date</th>
                            <th>Assign Job ID</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--   for (Todo todo: todos) {  -->
                        <c:forEach var="team" items="${listTeam}">

                            <tr>
                                <td>
                                    <c:out value="${team.user_id}" />
                                </td>

                                <td>
                                    <c:out value="${team.firstname}" />
                                </td>
                                <td>
                                    <c:out value="${team.lastname}" />
                                </td>
                                <td>
                                    <c:out value="${team.ic_no}" />
                                </td>
                                <td>
                                    <c:out value="${team.address}" />
                                </td>
                                <td>
                                    <c:out value="${team.contact}" />
                                </td>
                                <td>
                                    <c:out value="${team.email}" />
                                </td>
                                <td>
                                    <c:out value="${team.reg_date}" />
                                </td>
                                 <td>
                                    <c:out value="${team.jobid}" />
                                </td>
                                <td><a href="editteam?user_id=<c:out value='${team.user_id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                    <a href="deleteteam?user_id=<c:out value='${team.user_id}' />">Delete</a></td>
                            </tr>
                        </c:forEach>
                        <!-- } -->
                    </tbody>

                </table>
            </div>
        </div>
    </body>
</html>