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

                if (document.myForm.customername.value == "") {
                    alert("Please provide your customer 's first name");
                    document.myForm.customername.focus();
                    return false;
                }
                if (document.myForm.customerhpno.value == "") {
                    alert("Please provide your customer HP number");
                    document.myForm.customerhpno.focus();
                    return false;
                }
                if (document.myForm.address.value == "") {
                    alert("Please provide your customer's address");
                    document.myForm.address.focus();
                    return false;
                }
                if (document.myForm.buildingtype.value == "") {
                    alert("Please provide your customer's building type");
                    document.myForm.buildingtype.focus();
                    return false;
                }
                if (document.myForm.date.value == "") {
                    alert("Please provide your customer's contact number!");
                    document.myForm.date.focus();
                    return false;
                }
                else {
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
    <caption>
        <h2 style="text-align: center;">
            <c:if test="${job != null}">
                Edit Job
            </c:if>
            <c:if test="${job == null}">
                Add New Job
            </c:if>
        </h2>
    </caption>
    <br>
    <br>
    <c:if test="${job != null}">
        <form action="updatejob" name="myForm" method="post" style="margin-right: 20%; margin-left: 20%;" onsubmit="return validate();">
        </c:if>
        <c:if test="${job == null}">
            <form action="addnewjob" name="myForm" method="post" style="margin-right: 20%; margin-left: 20%;" onsubmit="return validate();">
            </c:if>
            <c:if test="${job != null}">
                <input type="hidden" name="id" value="<c:out value='${job.id}' />" />
            </c:if>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Customer's Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="<c:out value='${job.customerName}' />" id="inputEmail3" name="customername">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail4" class="col-sm-2 col-form-label">Customer's Phone No.</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="<c:out value='${job.customerHpNo}' />" id="inputEmail4" name="customerhpno">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail5" class="col-sm-2 col-form-label">Address</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="<c:out value='${job.address}' />" id="inputEmail5" name="address">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Building Type</label>
                <div class="col-sm-10">
                    <select class="form-control" name="buildingtype">
                        <c:if test="${job == null}">
                            <option disabled selected>Select Building Type</option>
                            <option value="Small House">Small House</option>
                            <option value="Medium-size House">Medium Size House (has 3 Bedrooms)</option>
                            <option value="Big House">Big House (has 4 or more bedrooms)</option>
                            <option value="Small Office Room">Small Office Room</option>
                            <option value="Big Office Room">Big Office Rooms</option>
                        </c:if>
                        <c:if test="${job != null}">
                            <c:if test="${job.buildingType == 'Small House'}">
                                <option disabled>Select Building Type</option>
                                <option value="Small House" selected>Small House</option>
                                <option value="Medium-size House">Medium Size House (has 3 Bedrooms)</option>
                                <option value="Big House">Big House (has 4 or more bedrooms)</option>
                                <option value="Small Office Room">Small Office Room</option>
                                <option value="Big Office Room">Big Office Rooms</option>
                            </c:if>
                            <c:if test="${job.buildingType == 'Medium-size House'}">
                                <option disabled>Select Building Type</option>
                                <option value="Small House">Small House</option>
                                <option value="Medium-size House" selected>Medium Size House (has 3 Bedrooms)</option>
                                <option value="Big House">Big House (has 4 or more bedrooms)</option>
                                <option value="Small Office Room">Small Office Room</option>
                                <option value="Big Office Room">Big Office Rooms</option>
                            </c:if>
                            <c:if test="${job.buildingType == 'Big House'}">
                                <option disabled>Select Building Type</option>
                                <option value="Small House">Small House</option>
                                <option value="Medium-size House">Medium Size House (has 3 Bedrooms)</option>
                                <option value="Big House" selected>Big House (has 4 or more bedrooms)</option>
                                <option value="Small Office Room">Small Office Room</option>
                                <option value="Big Office Room">Big Office Rooms</option>
                            </c:if>
                            <c:if test="${job.buildingType == 'Small Office Room'}">
                                <option disabled>Select Building Type</option>
                                <option value="Small House">Small House</option>
                                <option value="Medium-size House">Medium Size House (has 3 Bedrooms)</option>
                                <option value="Big House">Big House (has 4 or more bedrooms)</option>
                                <option value="Small Office Room" selected>Small Office Room</option>
                                <option value="Big Office Room">Big Office Rooms</option>
                            </c:if>  
                            <c:if test="${job.buildingType == 'Big Office Room'}">
                                <option disabled>Select Building Type</option>
                                <option value="Small House">Small House</option>
                                <option value="Medium-size House">Medium Size House (has 3 Bedrooms)</option>
                                <option value="Big House">Big House (has 4 or more bedrooms)</option>
                                <option value="Small Office Room">Small Office Room</option>
                                <option value="Big Office Room" selected>Big Office Rooms</option>
                            </c:if>
                        </c:if>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail7" class="col-sm-2 col-form-label">Date</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" value="<c:out value='${job.date}' />" id="inputEmail5" name="date">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail7" class="col-sm-2 col-form-label">Additional Notes/Request</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="<c:out value='${job.addNote}' />" id="inputEmail6" name="addnote" value="None">
                </div>
            </div>
            <br>
            <div class="form-group row">
                <div class="col-sm-10">
                    <input type="submit" class="btn btn-success" value="Save"></input>
                    <input type="reset" class="btn btn-warning" value="Reset"></input>
                    <a href="listjob"><button type="button" class="btn btn-danger" action=>Cancel</button></a>
                </div>
            </div>
        </form>
    </body>
</html>