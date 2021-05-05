<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Homw"/>
</jsp:include>

<!DOCTYPE html>
<html>

<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
    <div class="container">
        <a href="#" class="navbar-brand">Travel Experts LOGO</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarNav">
            <form action="" class="form-inline">
                <input type="search" class="form-control" placeholder="search">
                <button class="btn btn-primary"><i class="fas fa-search"></i></button>
            </form>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a href="#home-section" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="login.jsp" class="nav-link">Login</a>
                </li>
                <li class="nav-item">
                    <a href="package.jsp" class="nav-link">Package</a>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" id="account-list" data-toggle="dropdown">Account</a>
                    <div class="dropdown-menu" aria-labelledby="account-list">
                        <a class="dropdown-item" href="account.jsp">Profile</a>
                        <a class="dropdown-item" href="mybookings.jsp">Bookings</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<header class="home-section">
    <div class="dark-overlay">
        <div class="container home-inner">
            <div class="d-flex flex-column">
                <h3 class="text-light">Welcome to Travel Experts!</h3>
                <button class="btn btn-primary mt-4 align-self-start">Explore more</button>
            </div>
        </div>
    </div>
</header>

</body>
</html>