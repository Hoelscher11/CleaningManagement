<%-- 
    Document   : index
    Created on : Jun 9, 2021, 8:29:18 AM
    Author     : NAD
--%>
<%@ page errorPage="error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listteam">Staffs</a>
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
        <div class="container">
            <table class="table table-bordered" style="margin-top: 100px;text-align: center;">
                <colgroup>
                    <col style="background-color:#59F15F">
                    <col style="background-color:#59F0F1">
                    <col style="background-color:#EC95E1">
                </colgroup>
                <thead>
                    <tr>
                        <th>Jobs Applications</th>
                        <th>Number of Workers</th>
                        <th>Assigned Tools Record</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="font-size: 50px;">
                        <td><c:out value='${jobcount}' /></td>
                        <td><c:out value='${staffcount}' /></td>
                        <td><c:out value='${toolsRecord}' /></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <div align="center">
                <h1>Jobs Summary</h1>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr class="bg-info">
                            <th>JobID</th>
                            <th>Location</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="job" items="${jobSummary}">
                        <tr>
                            <td>
                        <c:out value="${job.id}" />
                        </td>
                        <td>
                        <c:out value="${job.address}" />
                        </td>
                        <td>
                        <c:out value="${job.date}" />
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
                <div align="left" style="font-style: italic; font-size: 20px;">
                <c:if test="${more == 0}">
                    <p></p>
                </c:if>
                <c:if test="${more != 0}">
                    <p><c:out value="${more}" /> more....</p>
                </c:if>
                </div>
            </div>
            <div align="center" style="margin-top: 60px;">
                <ul>
                    <a href="listjob"><button type="button" class="btn btn-primary">Show All Jobs</button></a>
                    <a href="listteam"><button type="button" class="btn btn-primary">Show List of Workers</button></a>
                    <a href="listtools"><button type="button" class="btn btn-primary">Show Tools Booking Record</button></a>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>