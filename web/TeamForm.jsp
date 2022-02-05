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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script type = "text/javascript">
            <!--
      // Form validation code will come here.
            function validate() {

                if (document.myForm.firstname.value == "") {
                    alert("Please provide your first name!");
                    document.myForm.firstname.focus();
                    return false;
                }
                if (document.myForm.lastname.value == "") {
                    alert("Please provide your last name!");
                    document.myForm.lastname.focus();
                    return false;
                }
                if (document.myForm.ic_no.value == "") {
                    alert("Please provide your ic number!");
                    document.myForm.ic_no.focus();
                    return false;
                }
                if (document.myForm.address.value == "") {
                    alert("Please provide your address!");
                    document.myForm.address.focus();
                    return false;
                }
                if (document.myForm.contact.value == "") {
                    alert("Please provide your contact number!");
                    document.myForm.contact.focus();
                    return false;
                }
                if (document.myForm.reg_date.value == "") {
                    alert("Please provide your date of job!");
                    document.myForm.reg_date.focus();
                    return false;
                }
                if (document.getElementById('jobid').value == "") {
                    alert("Please provide your job ID!");
                    document.getElementById('jobID').focus();
                    return false;
                }
                var emailID = document.myForm.email.value;
                atpos = emailID.indexOf("@");
                dotpos = emailID.lastIndexOf(".");

                if (atpos < 1 || (dotpos - atpos < 2)) {
                    alert("Please enter correct email ID")
                    document.myForm.email.focus();
                    return false;
                } else {
                    return true;
                }
            }
            //-->
</script>
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
                            <a class="nav-link" href="#">Staffs</a>
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
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
            <c:if test="${team != null}">
            <form action="updateteam" method="post" name="myForm" onsubmit = "return validate();">
            </c:if>
            <c:if test="${team == null}">
                <form action="insertteam" method="post" name="myForm" onsubmit = "return validate();">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${team != null}">
                            Edit Team
                        </c:if>
                        <c:if test="${team == null}">
                            Add New Team
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${team != null}">
                    <input type="hidden" name="user_id" value="<c:out value='${team.user_id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>First Name</label> <input type="text" value="<c:out value='${team.firstname}' />" class="form-control" name="firstname">
                </fieldset>

                <fieldset class="form-group">
                    <label>Last Name</label> <input type="text" value="<c:out value='${team.lastname}' />" class="form-control" name="lastname">
                </fieldset>

                <fieldset class="form-group">
                    <label>Ic No</label> <input type="text" value="<c:out value='${team.ic_no}' />" class="form-control" name="ic_no">
                </fieldset>

                <fieldset class="form-group">
                    <label>Address</label> <input type="text" value="<c:out value='${team.address}' />" class="form-control" name="address">
                </fieldset>

                <fieldset class="form-group">
                    <label>Contact</label> <input type="text" value="<c:out value='${team.contact}' />" class="form-control" name="contact">
                </fieldset>

                <fieldset class="form-group">
                    <label>Email</label> <input type="text" value="<c:out value='${team.email}' />" class="form-control" name="email">
                </fieldset>

                <fieldset class="form-group">
                    <label>Registration date</label> <input type="date" value="<c:out value='${team.reg_date}' />" class="form-control" name="reg_date">
                </fieldset>
                <fieldset class="form-group">
                    <label>JobID</label>
                    <select class="form-control" name="jobid" id="jobID" required>
                        <c:if test="${team == null}">
                            <option disabled selected>Choose Job ID</option>
                            <c:forEach var="jobid" items="${jobIdList}">
                                <option value="<c:out value='${jobid}' />"><c:out value='${jobid}' /></option>
                            </c:forEach>
                        </c:if>
                        <c:if test="${team != null}">
                            <c:forEach var="jobid" items="${jobIdList}">
                                <c:if test="${jobid == team.jobid}">
                                    <option selected value="<c:out value='${jobid}' />"><c:out value='${jobid}' /></option>
                                </c:if>
                                <c:if test="${jobid != team.jobid}">
                                    <option value="<c:out value='${jobid}' />"><c:out value='${jobid}' /></option>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </select>
                </fieldset>
                <input type="submit" class="btn btn-success" value="Save" id="saveteam"></input>
                <input type="reset" class="btn btn-warning" value="Reset"></input>
                <a href="listteam"><button type="button" class="btn btn-danger" action=>Cancel</button></a>
            </form>
        </div>
    </div>
</div>
</body>

</html>
