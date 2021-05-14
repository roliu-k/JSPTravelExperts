<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

<%--The home page is done by Ronnie. It contains the hero header and a recommendation list for packages--%>
<body>
<div class="content-wrapper">
    <header class="home-section">
        <div class="dark-overlay">
            <div class="container home-inner">
                <div class="d-flex flex-column justify-content-center">
                    <h3 class="text-light display-4">Welcome to Travel Experts</h3>
                    <div class="card col-lg-6 col-10">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">All</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#">Flight</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#">Hotel</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#">Car Rental</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#">Cruise</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body d-flex">
                            <input type="text" class="form-control align-itself-start" placeholder="search">
                            <button class="btn btn-primary align-itself-end" type="button" style="margin-left: -42px">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <a href="package.jsp">
                        <button class="btn btn-primary mt-4 align-self-start" >Explore more</button>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <div class="container popular-packages">
        <h3 class="text-light m-4">Popular Packages</h3>
        <hr>
        <div class="package-area">
            <div class='row row-cols-1 row-cols-md-3 align-items-center justify-content-center'>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>


<script>

    // grab the first six packages to display as popular packages
    $.get("api/packages/getallpackages", function (data){
        var i;

        for(i=0; i<6; i++){
            // append a new card to the popular package area
            $(".row").append("<div class='col'> <div class='card package-card' style='height: 13.25rem'>" +
                "<img class='card-img' src='" + data[i].Picture + "'>" +
                "<div class='card-img-overlay text-center text-light pt-4'>" +
                "<h5 class='card-title'>" + data[i].PkgName + "</h5> " +
                "<div class='card-hover-display p-4'>" +
                "<p class='card-text'>" + data[i].PkgDesc + "</p>" +
                "<form action='bookingdetail'><input type='hidden' name='packageId' id='pkgId' " +
                "value='" + (i+1) + "'/>" +
                "<button class='btn btn-secondary btn-sm' onclick='viewdetail()'>More Details</button>" +
                "</form></div></div></div></div>");
        }
    });

    // send the packageId to bookservlet and then redirect user to booking detail page
    function viewdetail()
    {
        $(this).siblings("form").submit();
    }

</script>
