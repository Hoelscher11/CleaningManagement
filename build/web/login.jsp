<%-- 
    Document   : login
    Created on : Jun 10, 2021, 6:36:56 PM
    Author     : NAD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cleaning Service Management System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" 
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" 
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script language="javascript">
            javascript:window.history.forward(1);
        </script>
    </head>
    <body>
        <nav class="navbar navbar-dark navbar-expand-lg bg-primary">
            <h1 class="navbar-brand">Cleaning Service Management System</h1>
        </nav>
        <div class="container">
            <div class="d-flex justify-content-center h-100" style="margin-top: 200px;">
                <div class="card">
                    <div class="card-header">
                        <h3>Sign In</h3>
                    </div>
                    <div class="card-body">
                        <form action="loginuser" method="post">
                            <div class="input-group form-group">
                                <input type="text" class="form-control" placeholder="username" name="username">

                            </div>
                            <div class="input-group form-group">
                                <input type="password" class="form-control" placeholder="password" name="password">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" class="btn login_btn">
                            </div>
                        </form>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="register">New Admin? Register Here</a>
                    </div> 
                </div>
            </div>
        </div>
    </body>
    <footer class="bg-light text-center fixed-bottom">
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2020 Copyright: Universiti Malaysia Terengganu
        </div>
        <!-- Copyright -->
    </footer>
</html>
