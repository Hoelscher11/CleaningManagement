<%-- 
    Document   : EmployeeList
    Created on : Jun 9, 2021, 9:48:03 AM
    Author     : NAD
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
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

                if (document.myForm.tool.value == "") {
                    alert("Please state the tool name!");
                    document.myForm.tool.focus();
                    return false;
                }
                if (document.myForm.quantity.value == "") {
                    alert("Please provide the tool quantity!");
                    document.myForm.quantity.focus();
                    return false;
                }
                if (document.myForm.jobid.value == "") {
                    alert("Please provide the job ID");
                    document.myForm.jobid.focus();
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
                <button class="navbar-toggler" type="button" data-toggle="collapse" 
                        data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                        <li class="nav-item">
                            <a class="nav-link" href="listjob">Jobs</a>
                        </li>
                        <li class="nav-item active">
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
            <c:if test="${tools != null}">
            <form action="updatetoolsbyid" name="myForm" method="post" name="myForm" onsubmit="return validate();">
            </c:if>
            <c:if test="${tools == null}">
                <form action="insert" name="myForm" method="post" name="myForm" onsubmit="return validate();">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${tools != null}">
                            Edit Tools
                        </c:if>
                        <c:if test="${tools == null}">
                            Add New Tools
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${tools != null}">
                    <input type="hidden" name="id" value="<c:out value='${tools.id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Tools</label> <input type="text" value="<c:out value='${tools.tool}' />" class="form-control" name="tool" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Quantity</label> <input type="number" value="<c:out value='${tools.quantity}' />" class="form-control" name="quantity">
                </fieldset>

                <fieldset class="form-group">
                    <c:if test="${tools != null}">
                        <label>Job ID</label> <input type="text" value="<c:out value='${tools.jobid}' />" class="form-control" name="jobid">
                    </c:if>
                    <c:if test="${tools == null}">
                        <label>Job ID</label> <input type="text" value="<c:out value='${id}' />" class="form-control" name="jobid">
                    </c:if>

                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
                <input type="reset" class="btn btn-warning" value="Reset"></input>
                <a href="listtools"><button type="button" class="btn btn-danger" action=>Cancel</button></a>
            </form>
        </div>
    </div>
</div>
</body>

</html>