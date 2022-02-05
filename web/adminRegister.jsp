<%-- 
    Document   : adminRegister
    Created on : Jun 10, 2021, 6:02:03 PM
    Author     : NAD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            </nav>
        </header>
        <div class="container col-md-5" align="center">
            <h1>Employee Register Form</h1>
            <div class="card">
                <div class="card-body">
                    <form action="registerUser" method="post">
                        <table style="with: 80%">
                            <tr class="form-group">
                                <td>First Name</td>
                                <td><input type="text" name="firstName" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td><input type="text" name="lastName" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>UserName</td>
                                <td><input type="text" name="username" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="password" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><input type="text" name="address" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Contact No</td>
                                <td><input type="text" name="contact" class="form-control" /></td>
                            </tr>
                        </table>
                        <br>
                        <ul>
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="reset" class="btn btn-warning">Reset</button>
                            <a href="login"><button type="button" class="btn btn-danger">Cancel</button></a>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
