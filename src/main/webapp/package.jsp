<%--
  Created by IntelliJ IDEA.
  User: 860234
  Date: 5/9/2021
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Packages"/>
</jsp:include>

<%--The package page is done by Ronnie. It mainly lists all the packages for customers to select.--%>
<div class="content-wrapper">
    <div class="container packages-section">
        <h3 class="container-fluid"><i class="fas fa-suitcase fa-sm pr-2"></i>Packages</h3>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 mx-auto" id="packages">

        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>
    // reach out to the api to grab all the packages from the database and fill out necessary info to the view
    $.get("api/packages/getallpackages", function (data) {
        var i;
        for (i = 0; i < data.length; i++) {
            // append a new card package view to the package area
            $("#packages").append("<div class='col'><div class='card package-card'> " +
                "<div class='card-image' style='height:13.25rem'>" +
                "<img class='card-img-top' src='" + data[i].Picture + "'>" +
                "<div class='dark-overlay'></div></div>" +
                "<div class='card-body text-light'> <h5 class='card-title'>" +
                data[i].PkgName + "</h5> " +
                "<p class='card-text' style='min-height: 50px'>" + data[i].PkgDesc + "</p>" +
                "<form action='bookingdetail'><input type='hidden' name='packageId' id='pkgId' " +
                "value='" + (i+1) + "'/>" +
                "<button class='btn btn-secondary btn-sm' onclick='viewdetail()'>More Details</button>" +
                "</form></div></div></div>");
        }
    });

    // send the packageId to booking servlet and redirect user to bookpackage page
    function viewdetail()
    {
        $(this).siblings("form").submit();
    }

</script>