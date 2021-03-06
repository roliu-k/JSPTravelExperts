<%--
  Created by IntelliJ IDEA.
  User: 860234
  Date: 5/3/2021
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%--The general layout page contains navbar and it is being used in every single jsp page - Done by Ronnie --%>

<!DOCTYPE HTML>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
        crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
        crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/travelexperts.css">
  <title>${param.title}</title>

</head>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
  <div class="container">
    <a href="index.jsp" class="navbar-brand"><img src="images/travel experts Logo.png" style="position:fixed; top: 0; height: 60px;"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a href="index.jsp" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
          <a href="package.jsp" class="nav-link">Packages</a>
        </li>
        <li class="nav-item">
          <a href="login.jsp" class="nav-link" id="loginLogout">Login</a>
        </li>
        <li class="nav-item dropdown">
          <a href="#" class="nav-link dropdown-toggle" id="account-list" data-toggle="dropdown">Account</a>
          <div class="dropdown-menu" aria-labelledby="account-list">
            <a class="dropdown-item" href="account.jsp">Profile</a>
            <a class="dropdown-item" href="booking.jsp">Booking</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>


</html>

<script>
  // make logout and account nav items visible once the user is logged in -- done by Julie
  $(document).ready(function(){
    //Customers has not been authenticated
    if (sessionStorage.getItem("token") == null){
      $("#loginLogout").text("Login");
      $("#loginLogout").attr("href", "login.jsp");
      $("#account-list").hide();

    }
    //Customers has been authenticated
    else{
      $("#loginLogout").text("Logout");
      $("#loginLogout").attr("href", "logout.jsp");
      $("#account-list").show();
    }
  });
</script>
